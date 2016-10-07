/* INFORMATIONS

Les triggers doivent etre compilés et non executé (icone fichier avec fleche verte : "Executer un script (F5)"

OLD représente la valeur avant modification
OLD n'est renseignée que pour les ordres DELETE et UPDATE. Elle n'a aucune signification pour un ordre INSERT, puisqu'aucune ancienne valeur n'existe 

NEW représente la nouvelle valeur
NEW n'est renseignée que pour les ordres INSERT et UPDATE. Elle n'a aucune signification pour un ordre DELETE, puisqu'aucune nouvelle valeur n'existe 
*/
------------------------------------------------------------------------------------------------------

/* COLLABORATEURS */

create or replace trigger TRIGGER_COL_MATRICULE  
   before insert on "CDI10"."COLLABORATEURS" 
   for each row 
begin  
   if inserting then 
      if :NEW."COL_MATRICULE" is null then 
         select S_COLLABORATEURS.nextval into :NEW."COL_MATRICULE" from dual; 
      end if; 
   end if; 
end;

create or replace TRIGGER CHECK_COL_SEXE 
  BEFORE INSERT OR UPDATE OF COL_ETATCIVIL,COL_SEXE ON COLLABORATEURS
  --REFERENCING OLD AS old NEW AS new 
  FOR EACH ROW
  DECLARE 
    VAR_SEXE        CHAR(1);
    VAR_ETATCIVIL   CHAR(4);
BEGIN  
    -- On interroge la table virtuelle d'insertion contenant les NEW valeurs :
    SELECT :NEW.COL_SEXE INTO VAR_SEXE FROM dual;      
    SELECT :NEW.COL_ETATCIVIL INTO VAR_ETATCIVIL FROM dual;
      
	IF VAR_SEXE = 'M' OR VAR_SEXE = 'F'  
    THEN		    
      -- Si l'ajout/update du collaborateur est de sexe MASCULIN (M)
        IF VAR_SEXE = 'M'      
        THEN      
          -- On vérifie alors qu'il à une donnée correcte pour son ETAT CIVIL :
          IF VAR_ETATCIVIL != 'MR' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Etat civil incorrect !');
          END IF;
        END IF;
        
        -- Si l'ajout/update du collaborateur est de sexe FEMININ (F)
        IF VAR_SEXE = 'F'  
        THEN      
          -- On vérifie alors qu'elle à une donnée correcte pour son ETAT CIVIL :
          IF VAR_ETATCIVIL != 'MME' THEN
            IF VAR_ETATCIVIL != 'MLLE' THEN
              RAISE_APPLICATION_ERROR(-20001, 'Etat civil incorrect !');
            END IF;
          END IF; 
        END IF;
	  
      ---- Autrement on gère l'exception :
    ELSE      
      RAISE_APPLICATION_ERROR(-20001, 'Sexe inconnu');
    END IF;
END;

CREATE OR REPLACE TRIGGER CHECK_COL_AGE
BEFORE INSERT OR UPDATE OF COL_DATENAISSANCE ON COLLABORATEURS
--REFERENCING NEW AS new OLD AS old 
FOR EACH ROW 
DECLARE
  COL_AGE NUMBER(3);
BEGIN     
    -- Calcul la difference (années) entre la date actuelle et date de naissance :
    SELECT trunc(months_between(SYSDATE, to_date(:NEW.COL_DATENAISSANCE))/12) INTO COL_AGE FROM dual;
    
    -- Detection des personnes mineures :
    IF (COL_AGE < 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Avoir un âge négatif est interdit !'); 
    END IF; 
    IF (COL_AGE < 16) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Ce collaborateur est encore mineur !'); 
    END IF;     
END;


------------------------------------------------------------------------------------------------------

/* OCCUPERFONCTIONS */

CREATE OR REPLACE TRIGGER TRIGGER_CALCUL_ANCIENNETE
AFTER INSERT OR UPDATE OF COL_DATEEMBAUCHE,COL_DATEFINCONTRAT ON OCCUPERFONCTIONS
FOR EACH ROW
DECLARE
	VMatricule NUMBER(4); 
	ANCIENNETE NUMBER(10) := 0; --Nbr Jours
	CURSOR OldContrats IS SELECT to_date(:NEW.COL_DATEFINCONTRAT), to_date(:NEW.COL_DATEEMBAUCHE) FROM OCCUPERFONCTIONS WHERE COL_MATRICULE = VMatricule;
	Fin_Contrat OCCUPERFONCTIONS.COL_DATEEMBAUCHE%TYPE;
  Debut_Contrat OCCUPERFONCTIONS.COL_DATEEMBAUCHE%TYPE;
BEGIN   
  SELECT TO_NUMBER(:NEW.COL_MATRICULE) INTO VMatricule FROM dual;
  
  OPEN OldContrats;
  FETCH OldContrats INTO Fin_Contrat, Debut_Contrat;
  WHILE OldContrats%FOUND
	LOOP
      -- Pour chaque contrat, on ajoutera a l'actif le nombre de jours dans la variable ANCIENNETE, pour ce faire
      -- on tronque les dates pour les soustraire entre elle afin de recuperer la difference en nombre de jours
	  --ANCIENNETE := ANCIENNETE + TO_NUMBER( TRUNC( DAYS_BETWEEN(to_date(Fin_Contrat), to_date(Fin_Contrat))));
		ANCIENNETE := ANCIENNETE + (TO_NUMBER( TRUNC(to_date(Fin_Contrat)) - TRUNC(to_date(Fin_Contrat)) ));
	  -- Puis on passe a la lecture suivante
		FETCH OldContrats INTO Fin_Contrat, Debut_Contrat;
		--EXIT WHEN OldContrats%NOTFOUND; --> identique a un : WHILE OldContrats%FOUND
	END LOOP;
	CLOSE OldContrats;  
	
	UPDATE COLLABORATEURS SET COL_ANCIENNETE = TO_CHAR(ANCIENNETE) WHERE COL_MATRICULE = VMatricule;
	--COMMIT;
END;

----------------------------------VERSION 2 :
-- CREATION D'UNE TABLE TEMPORAIRE
CREATE GLOBAL TEMPORARY TABLE TEMP_OCCUPERFONCTIONS (
  COL_MATRICULE        NUMBER(4)            not null,
   FONCTION_ID          NUMBER(6)            not null,
   COL_TYPECONTRAT      CHAR(3)              not null,
   COL_DATEEMBAUCHE     DATE                 PRIMARY KEY not null,
   COL_DATEFINCONTRAT   DATE,
   COL_SALAIREBASE      NUMBER(7,2)          not null
);-- ON COMMIT PRESERVE ROWS;
INSERT INTO TEMP_OCCUPERFONCTIONS SELECT * FROM OCCUPERFONCTIONS;
SELECT COUNT(*) FROM TEMP_OCCUPERFONCTIONS;

--CREATION DU TRIGGER
CREATE OR REPLACE TRIGGER TRIGGER_CALCUL_ANCIENNETE
AFTER INSERT OR UPDATE OF COL_DATEEMBAUCHE,COL_DATEFINCONTRAT ON OCCUPERFONCTIONS
FOR EACH ROW
DECLARE
	VMatricule NUMBER(4); 
	ANCIENNETE NUMBER(10) := 0; --Nbr Jours
	type Historique is ref CURSOR;
	OldContrats  Historique;
	Fin_Contrat OCCUPERFONCTIONS.COL_DATEEMBAUCHE%TYPE;
  Debut_Contrat OCCUPERFONCTIONS.COL_DATEEMBAUCHE%TYPE;
BEGIN         
    -- Creation dynamique d'une table temporaire ( TEMP_OCCUPERFONCTIONS ) pour stocker les données :
    -- Son utilité est de permettre au TRIGGER_CALCUL_ANCIENNETE (AFTER insert or update) de ne plus passer par la 
    -- table mutante (où les modifications ne sont pas encore validée) sur laquelle il pointe son declenchement.
    EXECUTE IMMEDIATE 'CREATE OR REPLACE GLOBAL TEMPORARY TABLE TEMP_OCCUPERFONCTIONS AS SELECT * FROM OCCUPERFONCTIONS WHERE COL_MATRICULE = :NEW.COL_MATRICULE';
    
    -- Insertion des données dans la table temporaire pour permettre au trigger after d'y acceder :
    --EXECUTE IMMEDIATE 'INSERT INTO TEMP_OCCUPERFONCTIONS (COL_MATRICULE, FONCTION_ID, COL_TYPECONTRAT, COL_DATEEMBAUCHE, COL_DATEFINCONTRAT, COL_SALAIREBASE) VALUES (:NEW.COL_MATRICULE, :NEW.FONCTION_ID, :NEW.COL_TYPECONTRAT, :NEW.COL_DATEEMBAUCHE, :NEW.COL_DATEFINCONTRAT, :NEW.COL_SALAIREBASE)';   

    SELECT TO_NUMBER(:NEW.COL_MATRICULE) INTO VMatricule FROM dual;
  
    OPEN OldContrats for 'SELECT to_date(COL_DATEFINCONTRAT), to_date(COL_DATEEMBAUCHE) FROM TEMP_OCCUPERFONCTIONS WHERE COL_MATRICULE = VMatricule';
    FETCH OldContrats INTO Fin_Contrat, Debut_Contrat;
    WHILE OldContrats%FOUND
    LOOP
        -- Pour chaque contrat, on ajoutera a l'actif le nombre de jours dans la variable ANCIENNETE, pour ce faire
        -- on tronque les dates pour les soustraire entre elle afin de recuperer la difference en nombre de jours
      ANCIENNETE := ANCIENNETE + TO_NUMBER( TRUNC( MONTHS_BETWEEN(to_date(Fin_Contrat), to_date(Fin_Contrat))));
      --ANCIENNETE := ANCIENNETE + (TO_NUMBER( TRUNC(to_date(Fin_Contrat)) - TRUNC(to_date(Fin_Contrat)) ));
      -- Puis on passe a la lecture suivante
      FETCH OldContrats INTO Fin_Contrat, Debut_Contrat;
      --EXIT WHEN OldContrats%NOTFOUND; --> identique a un : WHILE OldContrats%FOUND
    END LOOP;
    CLOSE OldContrats;  
    
    UPDATE COLLABORATEURS SET COL_ANCIENNETE = TO_CHAR(ANCIENNETE) WHERE COL_MATRICULE = VMatricule;
    --COMMIT;

/*
    EXECUTE IMMEDIATE 'DROP MATERIALIZED VIEW TEMP_OCCUPERFONCTIONS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -12003 THEN
                dbms_output.put_line('Impossible de trouver la Vue Matérialisée, une erreur est survenue.');
            ELSE
                RAISE;
            END IF;
*/
END;

------------------------------------------------------------------------------------------------------

/* SALAIRES */

create or replace trigger TRIGGER_SALAIRES  
   before insert on "CDI10"."SALAIRES" 
   for each row 
begin  
   if inserting then 
      if :NEW."SALAIRE_ID" is null then 
         select S_SALAIRES.nextval into :NEW."SALAIRE_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* PROJETS */

CREATE OR REPLACE TRIGGER TRIGGER_PROJET_CODE
	BEFORE INSERT on "CDI10"."PROJETS" 
	FOR EACH ROW 
BEGIN
	IF :NEW.PROJET_CODE IS NULL THEN 	
		IF S_PROJETS.nextval > 99 THEN
			RAISE_APPLICATION_ERROR(-20000, 'Limite de 99 projets atteind pour cette année !');
		ELSE		
			SELECT TO_NUMBER(CONCAT(TO_CHAR(SYSDATE,'YY'),TO_CHAR(S_PROJETS.nextval,'FM09'))) INTO :NEW.PROJET_CODE FROM DUAL;
		END IF;
	END IF;    
END;

------------------------------------------------------------------------------------------------------

/* DOCUMENTS */

create or replace trigger TRIGGER_DOCUMENTS
   before insert on "CDI10"."DOCUMENTS" 
   for each row 
begin  
   if inserting then 
      if :NEW."DOC_ID" is null then 
         select S_DOCUMENTS.nextval into :NEW."DOC_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* LIBETAPES */

create or replace trigger TRIGGER_LIBETAPES
   before insert on "CDI10"."LIBETAPES" 
   for each row 
begin  
   if inserting then 
      if :NEW."STEP_ID" is null then 
         select S_LIBETAPES.nextval into :NEW."STEP_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* ETAPES */

create or replace trigger TRIGGER_ETAPES
   before insert on "CDI10"."ETAPES" 
   for each row 
   DECLARE 
   CODE_PROJET NUMBER(4) := :NEW."PROJET_CODE";
begin  
   if inserting then 
      if :NEW."CHARGE_NUMLOT" is null then 
         select TO_NUMBER( CONCAT( TO_CHAR(CODE_PROJET,'9999'),TO_CHAR(S_ETAPES.nextval,'FM09') ) ) into :NEW."CHARGE_NUMLOT" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* INTERVENIR */

create or replace trigger TRIGGER_INTERVENIR
   before insert on "CDI10"."INTERVENIR" 
   for each row 
begin  
   if inserting then 
      if :NEW."INT_NUMINTERVENTION" is null then 
         select S_INTERVENIR.nextval into :NEW."INT_NUMINTERVENTION" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* LIBRETEXP */

create or replace trigger TRIGGER_LIBRETEXP
   before insert on "CDI10"."LIBRETEXP" 
   for each row 
begin  
   if inserting then 
      if :NEW."RETEXP_ID" is null then 
         select S_LIBRETEXP.nextval into :NEW."RETEXP_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* COLLABORER */

create or replace trigger TRIGGER_COLLABORER
   before insert on "CDI10"."COLLABORER" 
   for each row 
begin  
   if inserting then 
      if :NEW."COLAB_ID" is null then 
         select S_COLLABORER.nextval into :NEW."COLAB_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

/* RETOURSEXP */

create or replace trigger TRIGGER_RETOURSEXP
   before insert on "CDI10"."RETOURSEXP" 
   for each row 
begin  
   if inserting then 
      if :NEW."EXP_ID" is null then 
         select S_RETOURSEXP.nextval into :NEW."EXP_ID" from dual; 
      end if; 
   end if; 
end;

------------------------------------------------------------------------------------------------------

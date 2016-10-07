/*==============================================================*/
/* DROITS D'ACCES POUR LA BDD : USERS                          	*/
/*==============================================================*/
/* http://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqljgrant.html */
/* http://oracle.developpez.com/guide/administration/adminrole/ */
----------------------------------------------------------------------BEGIN
/* --EXEMPLE POUR L'ASSIGNATION DES PRIVILEGES OBJET A UN UTILISATEUR :
GRANT CREATE SESSION TO Nom_Utilisateur ;
GRANT Nom_Role TO Nom_Utilisateur ;
GRANT 
   SELECT
  ,INSERT
  ,UPDATE
  ,DELETE ( colonne1 , colonne3 )
  ON Nom_Schema.Nom_Table 
  TO Nom_Utilisateur ;
*/
------------------------------------------------------------------------COM

-- Responsable commercial (1)
CREATE USER AMELIA IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "AMELIA"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "AMELIA" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO AMELIA;
GRANT RESP_COM TO AMELIA;

------------------------------------------------------------------------ETD

-- Responsable du département études (1)
--> Associe role chef_projet a un collaborateur (et donc retire aussi le droit)
CREATE USER TALITHIA IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "TALITHIA"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "TALITHIA" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO TALITHIA;
GRANT RESP_ETD TO TALITHIA;

------------------------------------------------------------------------RHH

-- Responsable des Ressources Humaines (1)
CREATE USER CECILIA IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "CECILIA"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "CECILIA" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO CECILIA;
GRANT RESP_RRH TO CECILIA;

------------------------------------------------------------------------SEC

-- Secrétariat technique (2)
CREATE USER CARINE IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "CARINE"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "CARINE" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO CARINE;
GRANT SECR_TECH TO CARINE;

CREATE USER CATHELINE IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "CATHELINE"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "CATHELINE" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO CATHELINE;
GRANT SECR_TECH TO CATHELINE;

------------------------------------------------------------------------COL

-- Collaborateurs (5-*)
CREATE USER FREDERIC IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "FREDERIC"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON ARIANE;
GRANT COLLABORATEUR TO utilisateur;



------------------------------------------------------------------------END
--Lister les ROLES USER :
SELECT grantee "Bénéficiaire", granted_role "Role Accordé", admin_option FROM dba_role_privs WHERE grantee = 'CARINE' 
	UNION SELECT grantee "Bénéficiaire", granted_role "Role Accordé", admin_option FROM dba_role_privs WHERE grantee in 
	(SELECT granted_role FROM DBA_ROLE_PRIVS WHERE grantee = 'CARINE');  

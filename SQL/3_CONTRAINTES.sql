---CONTRAINTE A ENTRER MANUELLEMENT-------------------------------------------------------------------
-- L'ajout de contrainte se fait par clic droit sur la table > contrainte > Ajouter la verification...
UPPER(COL_ETATCIVIL) IN ('MR', 'MME', 'MLLE')
UPPER(COL_SEXE) IN ('M', 'F')
--alter table "CDI10"."COLLABORATEURS" add constraint CHECK_ETATCIVIL check(UPPER(COL_ETATCIVIL) IN ('M.', 'MR', 'MME', 'MLLE')) ENABLE
--alter table "CDI10"."COLLABORATEURS" add constraint CHECK_SEXE check(UPPER(COL_SEXE) IN ('M', 'F')) ENABLE
------------------------------------------------------------------------------------------------------
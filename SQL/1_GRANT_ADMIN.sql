/*==============================================================*/
/* DROITS D'ACCES POUR LA BDD                                 	*/
/*==============================================================*/
/* http://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqljgrant.html */
/* http://oracle.developpez.com/guide/administration/adminrole/ */

-- TABLESPACE
CREATE SMALLFILE TABLESPACE ARIANE 
    DATAFILE 
        'TBSP_Ariane.DBF' SIZE 104857600 	REUSE 
		AUTOEXTEND ON NEXT 104857600 MAXSIZE UNLIMITED 
    DEFAULT NOCOMPRESS 
    ONLINE 
    SEGMENT SPACE MANAGEMENT AUTO 
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE;
	

-- USER SQL (mettre en majuscule le nom de l'user !)
CREATE USER CDI10 IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "CDI10"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;


-- QUOTAS
ALTER USER "CDI10" QUOTA UNLIMITED ON ARIANE;
ALTER USER "CDI10" QUOTA UNLIMITED ON APEX_1851336378250219;
ALTER USER "CDI10" QUOTA UNLIMITED ON APEX_5457999048253711;
ALTER USER "CDI10" QUOTA UNLIMITED ON EXAMPLE;
ALTER USER "CDI10" QUOTA UNLIMITED ON SYSAUX;
ALTER USER "CDI10" QUOTA UNLIMITED ON SYSTEM;
ALTER USER "CDI10" QUOTA UNLIMITED ON USERS;
--ALTER USER "CDI10" QUOTA UNLIMITED ON TEMP;


-- TENTATIVE D'ATTRIBUTION DE TOUT LES ROLES / DROITS DISPONIBLES :
ALTER USER "CDI10" DEFAULT ROLE "DBA","DV_MONITOR","CTXAPP","DV_AUDIT_CLEANUP","SPATIAL_CSW_ADMIN","APEX_GRANTS_FOR_NEW_USERS_ROLE","WFS_USR_ROLE","EM_EXPRESS_ALL","WM_ADMIN_ROLE","OLAP_USER","OLAP_XS_ADMIN","DV_SECANALYST","CSW_USR_ROLE","XS_CACHE_ADMIN","GDS_CATALOG_SELECT","SCHEDULER_ADMIN","PROVISIONER","AUDIT_ADMIN","XDB_WEBSERVICES_OVER_HTTP","DV_REALM_RESOURCE","AQ_ADMINISTRATOR_ROLE","DELETE_CATALOG_ROLE","XDB_WEBSERVICES","DV_PUBLIC","LBAC_DBA","XFILES_USER","OPTIMIZER_PROCESSING_RATE","RECOVERY_CATALOG_USER","DV_DATAPUMP_NETWORK_LINK","GSMUSER_ROLE","XFILES_ADMINISTRATOR","GATHER_SYSTEM_STATISTICS","LOGSTDBY_ADMINISTRATOR","GSM_POOLADMIN_ROLE","DV_ADMIN","HS_ADMIN_ROLE","XS_SESSION_ADMIN","DV_GOLDENGATE_ADMIN","IMP_FULL_DATABASE","DV_XSTREAM_ADMIN","DV_PATCH_ADMIN","DATAPUMP_EXP_FULL_DATABASE","EJBCLIENT","HS_ADMIN_EXECUTE_ROLE","JMXSERVER","OLAP_DBA","ADM_PARALLEL_EXECUTE_TASK","JAVAIDPRIV","SELECT_CATALOG_ROLE","JAVADEBUGPRIV","CONNECT","DATAPUMP_IMP_FULL_DATABASE","SODA_APP","OEM_MONITOR","APEX_ADMINISTRATOR_ROLE","GSMADMIN_ROLE","AQ_USER_ROLE","JAVAUSERPRIV","XDB_SET_INVOKER","RECOVERY_CATALOG_OWNER","JAVA_ADMIN","DBFS_ROLE","PDB_DBA","DV_GOLDENGATE_REDO_ACCESS","CDB_DBA","JAVASYSPRIV","HS_ADMIN_SELECT_ROLE","AUDIT_VIEWER","RESOURCE","DV_OWNER","XDB_WEBSERVICES_WITH_PUBLIC","EXECUTE_CATALOG_ROLE","DV_ACCTMGR","DV_REALM_OWNER","EXP_FULL_DATABASE","DV_STREAMS_ADMIN","JAVA_DEPLOY","SPATIAL_WFS_ADMIN","XS_NAMESPACE_ADMIN","XS_RESOURCE","ORDADMIN","AUTHENTICATEDUSER","CAPTURE_ADMIN","OEM_ADVISOR","XDBADMIN","EM_EXPRESS_BASIC";
GRANT ALL PRIVILEGES TO "CDI10" WITH ADMIN OPTION;

--PRIVILEGES------------------------------------------------------------------------------
--ACCES A LA BASE DE DONNEES :

--Gestion des espaces de noms :
GRANT MANAGE TABLESPACE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE TABLESPACE TO "CDI10" WITH ADMIN OPTION;		
GRANT ALTER TABLESPACE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP TABLESPACE TO "CDI10" WITH ADMIN OPTION;
-- Gestion de la base de données :
GRANT ALTER DATABASE TO "CDI10" WITH ADMIN OPTION;

-- Gestion des sessions pour  la connection à la BDD :
GRANT CREATE SESSION TO "CDI10" WITH ADMIN OPTION;			
GRANT RESTRICTED SESSION TO "CDI10" WITH ADMIN OPTION;
--Droits d'acces/modifications sur les TABLES :
GRANT SELECT ANY TABLE TO "CDI10" WITH ADMIN OPTION;			
GRANT CREATE TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT DELETE ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT LOCK ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT READ ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT COMMENT ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT REDEFINE ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT FLASHBACK ANY TABLE TO "CDI10" WITH ADMIN OPTION;
GRANT BACKUP ANY TABLE TO "CDI10" WITH ADMIN OPTION;

-- Gestion des index :
GRANT DROP ANY INDEX TO "CDI10" WITH ADMIN OPTION;			
-- Gestion des vues :
GRANT CREATE VIEW TO "CDI10" WITH ADMIN OPTION;				
GRANT CREATE ANY VIEW TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY VIEW TO "CDI10" WITH ADMIN OPTION;
GRANT UNDER ANY VIEW TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY MATERIALIZED VIEW TO "CDI10" WITH ADMIN OPTION;
-- Gestion des sequences :
GRANT CREATE SEQUENCE TO "CDI10" WITH ADMIN OPTION;			
GRANT SELECT ANY SEQUENCE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY SEQUENCE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY SEQUENCE TO "CDI10" WITH ADMIN OPTION;
-- Gestion des déclencheurs :
GRANT CREATE ANY TRIGGER TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY TRIGGER TO "CDI10" WITH ADMIN OPTION;
-- Gestion des procedures :
GRANT DEBUG ANY PROCEDURE TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE TO "CDI10" WITH ADMIN OPTION;

-----------------------------------------------------------------------------------------------------------------
-- SYSTEM PRIVILEGES
GRANT GRANT ANY PRIVILEGE TO "CDI10" WITH ADMIN OPTION;
GRANT ADMINISTER SQL TUNING SET TO "CDI10" WITH ADMIN OPTION;
GRANT ADMINISTER ANY SQL TUNING SET TO "CDI10" WITH ADMIN OPTION;
GRANT ADMINISTER RESOURCE MANAGER TO "CDI10" WITH ADMIN OPTION;
GRANT ADMINISTER KEY MANAGEMENT TO "CDI10" WITH ADMIN OPTION;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO "CDI10" WITH ADMIN OPTION;
GRANT FLASHBACK ARCHIVE ADMINISTER TO "CDI10" WITH ADMIN OPTION;

-- Gestion des utilisateurs :
GRANT BECOME USER TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE USER TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER USER TO "CDI10" WITH ADMIN OPTION;
GRANT DROP USER TO "CDI10" WITH ADMIN OPTION;
-- Gestion des roles :
GRANT GRANT ANY ROLE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY ROLE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY ROLE TO "CDI10" WITH ADMIN OPTION;
-- Gestion des règles :
GRANT EXECUTE ANY RULE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE RULE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY RULE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY RULE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE RULE SET TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY RULE SET TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY RULE SET TO "CDI10" WITH ADMIN OPTION;

-- Gestion des TRANSACTION :
GRANT FORCE TRANSACTION TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY TRANSACTION TO "CDI10" WITH ADMIN OPTION;
GRANT FORCE ANY TRANSACTION TO "CDI10" WITH ADMIN OPTION;
-- Gestion des modeles de MINING de données :
GRANT CREATE MINING MODEL TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY MINING MODEL TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY MINING MODEL TO "CDI10" WITH ADMIN OPTION;
GRANT COMMENT ANY MINING MODEL TO "CDI10" WITH ADMIN OPTION;
-- Gestion des CUBE de données :
GRANT SELECT ANY CUBE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE CUBE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY CUBE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT INSERT ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT DELETE ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY CUBE DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY CUBE BUILD PROCESS TO "CDI10" WITH ADMIN OPTION;

-- JOB
GRANT CREATE ANY JOB TO "CDI10" WITH ADMIN OPTION;
-- PROFILE
GRANT CREATE ANY SQL PROFILE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY SQL TRANSLATION PROFILE TO "CDI10" WITH ADMIN OPTION;
-- MEASURE FOLDER
GRANT CREATE MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
GRANT INSERT ANY MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
GRANT DELETE ANY MEASURE FOLDER TO "CDI10" WITH ADMIN OPTION;
--

-- A FINIR DE RANGER :
GRANT ALTER DATABASE LINK TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY ASSEMBLY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY EVALUATION CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY EDITION TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE EXTERNAL JOB TO "CDI10" WITH ADMIN OPTION;
GRANT EM EXPRESS CONNECT TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY MATERIALIZED VIEW TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE CREDENTIAL TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY LIBRARY TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY OUTLINE TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ASSEMBLY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY CLUSTER TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY CLASS TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CREDENTIAL TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT UNDER ANY TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY OPERATOR TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY OPERATOR TO "CDI10" WITH ADMIN OPTION;
GRANT EXEMPT IDENTITY POLICY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE EVALUATION CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT ADVISOR TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE PUBLIC DATABASE LINK TO "CDI10" WITH ADMIN OPTION;
GRANT ANALYZE ANY TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY RULE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ROLLBACK SEGMENT TO "CDI10" WITH ADMIN OPTION;
GRANT QUERY REWRITE TO "CDI10" WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE PUBLIC SYNONYM TO "CDI10" WITH ADMIN OPTION;
GRANT GLOBAL QUERY REWRITE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY CLUSTER TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY SYNONYM TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY SYNONYM TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE SYNONYM TO "CDI10" WITH ADMIN OPTION;
GRANT SET CONTAINER TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROGRAM TO "CDI10" WITH ADMIN OPTION;
GRANT EXEMPT REDACTION POLICY TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT ON COMMIT REFRESH TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY INDEXTYPE TO "CDI10" WITH ADMIN OPTION;
GRANT KEEP DATE TIME TO "CDI10" WITH ADMIN OPTION;
GRANT DEQUEUE ANY QUEUE TO "CDI10" WITH ADMIN OPTION;
GRANT ANALYZE ANY DICTIONARY TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY INDEXTYPE TO "CDI10" WITH ADMIN OPTION;
GRANT TRANSLATE ANY SQL TO "CDI10" WITH ADMIN OPTION;
GRANT EXEMPT DDL REDACTION POLICY TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY OPERATOR TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE PROFILE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY LIBRARY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CLUSTER TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY ASSEMBLY TO "CDI10" WITH ADMIN OPTION;
GRANT GRANT ANY PRIVILEGE TO "CDI10" WITH ADMIN OPTION;
GRANT EXPORT FULL DATABASE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY EVALUATION CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT IMPORT FULL DATABASE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY OUTLINE TO "CDI10" WITH ADMIN OPTION;
GRANT EXEMPT DML REDACTION POLICY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE DATABASE LINK TO "CDI10" WITH ADMIN OPTION;
GRANT DROP PUBLIC SYNONYM TO "CDI10" WITH ADMIN OPTION;
GRANT CHANGE NOTIFICATION TO "CDI10" WITH ADMIN OPTION;
GRANT DROP PROFILE TO "CDI10" WITH ADMIN OPTION;
GRANT EXEMPT ACCESS POLICY TO "CDI10" WITH ADMIN OPTION;
GRANT MANAGE SCHEDULER TO "CDI10" WITH ADMIN OPTION;
GRANT READ ANY FILE GROUP TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY SQL TRANSLATION PROFILE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP PUBLIC DATABASE LINK TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY INDEXTYPE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY SQL PROFILE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER SYSTEM TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY DIMENSION TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY ASSEMBLY TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY DIRECTORY TO "CDI10" WITH ADMIN OPTION;
GRANT ENQUEUE ANY QUEUE TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY EVALUATION CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY ASSEMBLY TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY TYPE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE CLUSTER TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT EXECUTE ANY EVALUATION CONTEXT TO "CDI10" WITH ADMIN OPTION;
GRANT RESUMABLE TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE ANY LIBRARY TO "CDI10" WITH ADMIN OPTION;
GRANT DROP ANY EDITION TO "CDI10" WITH ADMIN OPTION;
GRANT CREATE PROCEDURE TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ANY OPERATOR TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER RESOURCE COST TO "CDI10" WITH ADMIN OPTION;
GRANT ALTER ROLLBACK SEGMENT TO "CDI10" WITH ADMIN OPTION;
GRANT PURGE DBA_RECYCLEBIN TO "CDI10" WITH ADMIN OPTION;

-- Les rôles suivant ne peuvent pas etre appliqués directement :
--GRANT SYSKM TO "CDI10" WITH ADMIN OPTION;;
--GRANT SYSBACKUP TO "CDI10" WITH ADMIN OPTION;
--GRANT SYSDBA TO "CDI10" WITH ADMIN OPTION;
--GRANT SYSOPER TO "CDI10" WITH ADMIN OPTION;
--GRANT SYSDG TO "CDI10" WITH ADMIN OPTION;

-- Lister Privilèges Systèmes des ROLES d'un USER :
SELECT grantee "Bénéficiaire", Privilege "Privilege Systeme Accordé", admin_option FROM dba_sys_privs WHERE grantee in 
	(SELECT granted_role FROM dba_role_privs WHERE grantee = 'CDI10' UNION SELECT granted_role FROM dba_role_privs WHERE grantee in 
	(SELECT granted_role FROM DBA_ROLE_PRIVS WHERE grantee = 'CDI10')) ORDER BY 1 DESC;  
-- Lister Privilèges Objets des ROLES d'un USER :
SELECT grantee "Bénéficiaire", Privilege "Privilege Object Accordé", table_name "Nom Objet", grantor "Proprietaire Objet" FROM dba_tab_privs WHERE grantee in 
	(SELECT granted_role FROM dba_role_privs WHERE grantee = 'CDI10' UNION SELECT granted_role FROM dba_role_privs WHERE grantee in 
	(SELECT granted_role FROM DBA_ROLE_PRIVS WHERE grantee = 'CDI10'));


/*Liste des Privilège système + Description :
CLUSTERS	
CREATE CLUSTER	Création de clusters dans le schéma
CREATE ANY CLUSTER	Création de clusters dans n'importe quel schéma
ALTER ANY CLUSTER	Modification de clusters dans n'importe quel schéma
DROP ANY CLUSTER	Suppression de clusters dans n'importe quel schéma

CONTEXTS	
CREATE ANY CONTEXT	Créations de tous context
DROP ANY CONTEXT	Suppression de tous context

DATABASE	
ALTER DATABASE	Modification de la base
ALTER SYSTEM	Autorise l'instruction ALTER SYSTEM
AUDIT SYSTEM	Autorise les instructions AUDIT sql_statements

DATABASE LINKS:	 
CREATE DATABASE LINK	Création de liens de base de données dans le schéma
CREATE PUBLIC DATABASE LINK	Création de liens de base de données pour le groupe PUBLIC
DROP PUBLIC DATABASE LINK	Suppression de liens de base de données pour le groupe PUBLIC

DEBUGGING	
DEBUG CONNECT SESSION	Connexion dans la session en cours au débugger utilisant le protocol Java Debug Wire Protocol (JDWP)
DEBUG ANY PROCEDURE	Deboguage de tout code PL/SQL ou Java dans n'importe quel objet de la base

DIMENSIONS	
CREATE DIMENSION	Création de dimentions dans le schéma
CREATE ANY DIMENSION	Création de dimentions dans n'importe quel schéma
ALTER ANY DIMENSION	Modification de dimentions dans n'importe quel schéma
DROP ANY DIMENSION	Suppression de dimentions dans n'importe quel schéma

DIRECTORIES	
CREATE ANY DIRECTORY	Création d'objets DIRECTORY
DROP ANY DIRECTORY	Suppression d'objets DIRECTORY

INDEXTYPES	
CREATE INDEXTYPE	Création d'indextype dans le schéma
CREATE ANY INDEXTYPE	Création d'indextype dans n'importe quel schéma
ALTER ANY INDEXTYPE	Modification d'indextype dans n'importe quel schéma
DROP ANY INDEXTYPE	Suppression d'indextype dans n'importe quel schéma
EXECUTE ANY INDEXTYPE	Reférence un indextype dans n'importe quel schéma

INDEXS	
CREATE ANY INDEX	Création d'index dans n'importe quel schéma
ALTER ANY INDEX	Modification d'index dans n'importe quel schéma
DROP ANY INDEX	Suppression d'index dans n'importe quel schéma
QUERY REWRITE	Autorise la réécriture via une vue matérialisée dans le schéma
GLOBAL QUERY REWRITE	Autorise la réécriture via une vue matérialisée dans n'importe quel schéma

LIBRARIES	
CREATE LIBRARY	Création de librairies de fonctions/procédures externes dans le schéma
CREATE ANY LIBRARY	Création de librairies de fonctions/procédures externes dans n'importe quel schéma
DROP ANY LIBRARY	Suppression de librairies de fonctions/procédures externes dans n'importe quel schéma

MATERIALIZED VIEWS	
CREATE MATERIALIZED VIEW	Création de vues matérialisées dans le schéma
CREATE ANY MATERIALIZED VIEW	Création de vues matérialisées dans n'importe quel schéma
ALTER ANY MATERIALIZED VIEW	Modification de vues matérialisées dans n'importe quel schéma
DROP ANY MATERIALIZED VIEW	Suppression de vues matérialisées dans n'importe quel schéma
QUERY REWRITE	Autorise la réécriture via une vue matérialisée dans le schéma
GLOBAL QUERY REWRITE	Autorise la réécriture via une vue matérialisée dans n'importe quel schéma
ON COMMIT REFRESH	Création de vues matérialisées de type refresh-on-commit sur n'importe quelle table
FLASHBACK ANY TABLE	Autorise une requête FlashBack sur n'importe quelle table, vue ou vue matérialisée dans n'importe quel schéma

OPERATORS	
CREATE OPERATOR	Création d'un opérateur dans le schéma
CREATE ANY OPERATOR	Création d'un opérateur dans n'importe quel schéma
DROP ANY OPERATOR	Suppression d'un opérateur dans n'importe quel schéma
EXECUTE ANY OPERATOR	Référence un opérateur dans n'importe quel schéma

OUTLINES	
CREATE ANY OUTLINE	Création d' outlines publics
ALTER ANY OUTLINE	Modification d' outlines publics
DROP ANY OUTLINE	Suppression d' outlines publics

PROCEDURES	
CREATE PROCEDURE	Création de fonctions, procédures et packages dans le schéma
CREATE ANY PROCEDURE	Création de fonctions, procédures et packages dans n'importe quel schéma
ALTER ANY PROCEDURE	Modification de fonctions, procédures et packages dans n'importe quel schéma
DROP ANY PROCEDURE	Suppression de fonctions, procédures et packages dans n'importe quel schéma
EXECUTE ANY PROCEDURE	Exécution de fonctions, procédures et package de n'importe quel schéma

PROFILS	
CREATE PROFILE	Création de profils
ALTER PROFILE	Modification de profils
DROP PROFILE	Suppression de profils

ROLES	
CREATE ROLE	Création de rôles
ALTER ANY ROLE	Modification de n'importe quel rôle
DROP ANY ROLE	Suppression de n'importe quel rôle
GRANT ANY ROLE	Assignation de n'importe quel rôle

ROLLBACK SEGMENTS	
CREATE ROLLBACK SEGMENT	Création de segments de rollback
ALTER ROLLBACK SEGMENT	Modification de segments de rollback
DROP ROLLBACK SEGMENT	Suppression de segments de rollback

SEQUENCES	
CREATE SEQUENCE	Création de séquences dans le schéma
CREATE ANY SEQUENCE	Création de séquences dans n'importe quel schéma
ALTER ANY SEQUENCE	Modification de n'importe quelle séquence
DROP ANY SEQUENCE	Suppression de séquences dans n'importe quel schéma
SELECT ANY SEQUENCE	Interrogation de séquences dans n'importe quel schéma

SESSIONS	
CREATE SESSION	Connexion à la base
ALTER RESOURCE COST	Application de coûts pour les ressources de la session
ALTER SESSION	Permet l'instruction ALTER SESSION
RESTRICTED SESSION	Connexion restreinte à l'instance

SYNONYMS	
CREATE SYNONYM	Création de synonymes dans le schéma
CREATE ANY SYNONYM	Création de synonymes dans n'importe quel schéma
CREATE PUBLIC SYNONYM	Création de synonymes publics
DROP ANY SYNONYM	Suppression de synonymes dans le schéma
DROP PUBLIC SYNONYM	Suppression de synonymes publics

TABLES	
CREATE TABLE	Création de tables dans le schéma
CREATE ANY TABLE	Création de tables dans n'importe quel schéma
ALTER ANY TABLE	Modification de tables ou vues dans n'importe quel schéma
BACKUP ANY TABLE	Autorise l'utilisation de l'outil Export
DELETE ANY TABLE	Suppression de lignes des tables de n'importe quel schéma
DROP ANY TABLE	Suppression ou troncature de tables dans n'importe quel schéma
INSERT ANY TABLE	Insertion de lignes dans les tables de n'importe quel schéma
LOCK ANY TABLE	Vérouillage des tables ou vues de n'importe quel schéma
SELECT ANY TABLE	Interrogation des tables, vues ou vues matérialisées de n'importe quel schéma
FLASHBACK ANY TABLE	Autorise les requêtes FlashBack sur n'importe quelle table de n'importe quel schéma
UPDATE ANY TABLE	Mise à jour de lignes dans les tables de n'importe quel schéma

TABLESPACES	
CREATE TABLESPACE	Création de tablespace
ALTER TABLESPACE	Modification de tablespace
DROP TABLESPACE	Suppression de tablespace
MANAGE TABLESPACE	Autorise la mise en ligne/hors ligne des tablespace
UNLIMITED TABLESPACE	Quota illimité sur le tablespace

TRIGGERS	
CREATE TRIGGER	Création de déclencheurs dans le schéma
CREATE ANY TRIGGER	Création de déclencheurs dans n'importe quel schéma
ALTER ANY TRIGGER	Activation, désactivation, compilation de déclencheurs dans n'importe quel schéma
DROP ANY TRIGGER	Suppression de déclencheurs dans n'importe quel schéma
ADMINISTER DATABASE TRIGGER	Création de déclencheurs de base de données

TYPES	
CREATE TYPE	Création d'objets et de corps d'objets dans le schéma
CREATE ANY TYPE	Création d'objets et de corps d'objets dans n'importe quel schéma
ALTER ANY TYPE	Modification d'objets et de corps d'objets dans n'importe quel schéma
DROP ANY TYPE	Suppression d'objets et de corps d'objets dans n'importe quel schéma
EXECUTE ANY TYPE	Utilisation d'objets et de corps d'objets dans n'importe quel schéma
UNDER ANY TYPE	Création de sous-types sous des types non finaux

VIEWS	
CREATE VIEW	Création de vues dans le schéma
CREATE ANY VIEW	Création de vues dans n'importe quel schéma
DROP ANY VIEW	Suppression de vues dans n'importe quel schéma
UNDER ANY VIEW	Création de sous-vues sous n'importe quelle vue objet

Autres	
ANALYZE ANY	Analyse de tables, clusters et index dans n'importe quel schéma
AUDIT ANY	Audit de n'importe quel objet de n'importe quel schéma
COMMENT ANY TABLE	Pose de commentaires sur les tables et vues de n'importe quel schéma
FORCE ANY TRANSACTION	Force le commit ou rollback de n'importe quelle transaction distibuée douteuse
FORCE TRANSACTION	Force le commit ou rollback de n'importe quelle transaction distibuée douteuse
GRANT ANY OBJECT PRIVILEGE	Assigne n'importe quel privilège objet
GRANT ANY PRIVILEGE	Assigne n'importe quel privilège système
RESUMABLE	Active l'allocation d'espace pour les instructions résumables
SELECT ANY DICTIONARY	Interrogation de n'importe quel objet dans le dictionnaire du schéma SYS
SYSDBA	Autorise les opérations STRTUP et SHUTDOWN
		ALTER DATABASE: open, mount, back up, ou changement du jeu de caractères
		CREATE DATABASE 
		ARCHIVELOG et RECOVERY 
		CREATE SPFILE
		Inclue le privilège RESTRICTED SESSION
SYSOPER	Autorise les opérations STARTUP et SHUTDOWN
		ALTER DATABASE OPEN | MOUNT | BACKUP
		ARCHIVELOG et RECOVERY
		CREATE SPFILE
		Inclue le privilège RESTRICTED SESSION

Liste des privilèges objet + Description :
TABLES	
ALTER	Modifier la définition d'une table
DELETE	Supprimer des lignes de la table
DEBUG	Accès via un debugger
INDEX	Création d'un index sur la table
INSERT	Insertion de lignes dans la table
REFERENCES	Création d'une contrainte d'intégrité
SELECT	Interrogation d'une table
UPDATE	Mise à jour de la table

VIEWS	
DEBUG	Accès via un debugger
DELETE	Suppression de lignes
INSERT	Insertion de lignes
REFERENCES	Définition de contrainte d'intégrité
SELECT	Interrogation de la vue
UNDER	Création d'une sous-vue
UPDATE	Mise à jour de la vue

SEQUENCES	
ALTER	Modification de la définition d'une séquence
SELECT	Interrogation d'une séquence

PROCEDURES	
DEBUG	Accès via un debugger
EXECUTE	Compilation, exécution d'une procédure, d'une fonction ou d'un package

MATERIALIZED VIEWS	
ON COMMIT REFRESH	Création d'une vue matérialisée de type refresh-on-commit sur la table
QUERY REWRITE	Vue matérialisée en query rewrite
SELECT	Interrogation d'une vue matérialisée

DIRECTORIES	
READ	Droits de lecture sur le répertoire
WRITE	Droits d'écriture sur le répertoire

LIBRARIES	
EXECUTE	Utilisation d'un objet et de ses méthodes

OBJECT TYPES	
DEBUG	Accès via un debugger
EXECUTE	Utilisation d'un objet et de ses méthodes
UNDER	Création d'un sous-type

INDEXTYPES	
EXECUTE	Utilisation d'un indextype

OPERATORS	
EXECUTE	Utilisation d'un opérateur
*/
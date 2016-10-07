/*==============================================================*/
/* DROITS D'ACCES POUR LA BDD                                 	*/
/*==============================================================*/
/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  26/07/2016 16:37:46                      */
/*==============================================================*/

/* http://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqljgrant.html */

-- TABLESPACE
CREATE SMALLFILE TABLESPACE ARIANE 
    DATAFILE 
        'TBSP_Ariane.DBF' SIZE 104857600 	REUSE 
		AUTOEXTEND ON NEXT 104857600 MAXSIZE UNLIMITED 
    DEFAULT NOCOMPRESS 
    ONLINE 
    SEGMENT SPACE MANAGEMENT AUTO 
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE;
	

-- USER SQL (EN MAJUSCULE)
CREATE USER FREDERIC IDENTIFIED BY afpa2016
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ALTER USER "FREDERIC"
	DEFAULT TABLESPACE "ARIANE"
	TEMPORARY TABLESPACE "TEMP";
ACCOUNT UNLOCK ;


-- QUOTAS
ALTER USER "FREDERIC" QUOTA UNLIMITED ON ARIANE;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON APEX_1851336378250219;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON APEX_5457999048253711;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON EXAMPLE;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON SYSAUX;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON SYSTEM;
--ALTER USER "FREDERIC" QUOTA UNLIMITED ON TEMP;
ALTER USER "FREDERIC" QUOTA UNLIMITED ON USERS;


-- ROLES
ALTER USER "FREDERIC" DEFAULT ROLE "DBA","DV_MONITOR","CTXAPP","DV_AUDIT_CLEANUP","SPATIAL_CSW_ADMIN","APEX_GRANTS_FOR_NEW_USERS_ROLE","WFS_USR_ROLE","EM_EXPRESS_ALL","WM_ADMIN_ROLE","OLAP_USER","OLAP_XS_ADMIN","DV_SECANALYST","CSW_USR_ROLE","XS_CACHE_ADMIN","GDS_CATALOG_SELECT","SCHEDULER_ADMIN","PROVISIONER","AUDIT_ADMIN","XDB_WEBSERVICES_OVER_HTTP","DV_REALM_RESOURCE","AQ_ADMINISTRATOR_ROLE","DELETE_CATALOG_ROLE","XDB_WEBSERVICES","DV_PUBLIC","LBAC_DBA","XFILES_USER","OPTIMIZER_PROCESSING_RATE","RECOVERY_CATALOG_USER","DV_DATAPUMP_NETWORK_LINK","GSMUSER_ROLE","XFILES_ADMINISTRATOR","GATHER_SYSTEM_STATISTICS","LOGSTDBY_ADMINISTRATOR","GSM_POOLADMIN_ROLE","DV_ADMIN","HS_ADMIN_ROLE","XS_SESSION_ADMIN","DV_GOLDENGATE_ADMIN","IMP_FULL_DATABASE","DV_XSTREAM_ADMIN","DV_PATCH_ADMIN","DATAPUMP_EXP_FULL_DATABASE","EJBCLIENT","HS_ADMIN_EXECUTE_ROLE","JMXSERVER","OLAP_DBA","ADM_PARALLEL_EXECUTE_TASK","JAVAIDPRIV","SELECT_CATALOG_ROLE","JAVADEBUGPRIV","CONNECT","DATAPUMP_IMP_FULL_DATABASE","SODA_APP","OEM_MONITOR","APEX_ADMINISTRATOR_ROLE","GSMADMIN_ROLE","AQ_USER_ROLE","JAVAUSERPRIV","XDB_SET_INVOKER","RECOVERY_CATALOG_OWNER","JAVA_ADMIN","DBFS_ROLE","PDB_DBA","DV_GOLDENGATE_REDO_ACCESS","CDB_DBA","JAVASYSPRIV","HS_ADMIN_SELECT_ROLE","AUDIT_VIEWER","RESOURCE","DV_OWNER","XDB_WEBSERVICES_WITH_PUBLIC","EXECUTE_CATALOG_ROLE","DV_ACCTMGR","DV_REALM_OWNER","EXP_FULL_DATABASE","DV_STREAMS_ADMIN","JAVA_DEPLOY","SPATIAL_WFS_ADMIN","XS_NAMESPACE_ADMIN","XS_RESOURCE","ORDADMIN","AUTHENTICATEDUSER","CAPTURE_ADMIN","OEM_ADVISOR","XDBADMIN","EM_EXPRESS_BASIC";


-- SYSTEM PRIVILEGES
GRANT DEBUG ANY PROCEDURE TO "FREDERIC" WITH ADMIN OPTION;
GRANT GRANT ANY PRIVILEGE TO "FREDERIC" WITH ADMIN OPTION;
GRANT GRANT ANY ROLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER ANY SQL TUNING SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER RESOURCE MANAGER TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER SQL TUNING SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY SEQUENCE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER DATABASE LINK TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY ASSEMBLY TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY SQL TRANSLATION PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY EVALUATION CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY MINING MODEL TO "FREDERIC" WITH ADMIN OPTION;
GRANT DELETE ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE SESSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE RULE TO "FREDERIC" WITH ADMIN OPTION;
GRANT BECOME USER TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT INSERT ANY MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY SQL PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT FORCE ANY TRANSACTION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DELETE ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY SEQUENCE TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY EDITION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE EXTERNAL JOB TO "FREDERIC" WITH ADMIN OPTION;
GRANT EM EXPRESS CONNECT TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY MATERIALIZED VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT FLASHBACK ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY RULE SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT BACKUP ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE CREDENTIAL TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY LIBRARY TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY OUTLINE TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ASSEMBLY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER KEY MANAGEMENT TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY CLUSTER TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY CLASS TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CREDENTIAL TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY RULE SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY SEQUENCE TO "FREDERIC" WITH ADMIN OPTION;
GRANT UNDER ANY TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT MANAGE TABLESPACE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY OPERATOR TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY OPERATOR TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXEMPT IDENTITY POLICY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE TABLESPACE TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY TRANSACTION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DELETE ANY MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE TO "FREDERIC" WITH ADMIN OPTION;
GRANT LOCK ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE EVALUATION CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADVISOR TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE PUBLIC DATABASE LINK TO "FREDERIC" WITH ADMIN OPTION;
GRANT ANALYZE ANY TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY RULE TO "FREDERIC" WITH ADMIN OPTION;
GRANT INSERT ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ROLLBACK SEGMENT TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY JOB TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER USER TO "FREDERIC" WITH ADMIN OPTION;
GRANT QUERY REWRITE TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE PUBLIC SYNONYM TO "FREDERIC" WITH ADMIN OPTION;
GRANT GLOBAL QUERY REWRITE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY CLUSTER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY RULE TO "FREDERIC" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER RESOURCE MANAGER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY SYNONYM TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY SYNONYM TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY MINING MODEL TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE SYNONYM TO "FREDERIC" WITH ADMIN OPTION;
GRANT SET CONTAINER TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROGRAM TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXEMPT REDACTION POLICY TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ON COMMIT REFRESH TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE SEQUENCE TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT COMMENT ANY MINING MODEL TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER SQL TUNING SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY INDEXTYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT KEEP DATE TIME TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY INDEX TO "FREDERIC" WITH ADMIN OPTION;
GRANT RESTRICTED SESSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DEQUEUE ANY QUEUE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ANALYZE ANY DICTIONARY TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY INDEXTYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT TRANSLATE ANY SQL TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER ANY SQL TUNING SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXEMPT DDL REDACTION POLICY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE USER TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY OPERATOR TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY ROLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY LIBRARY TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CLUSTER TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY RULE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER TABLESPACE TO "FREDERIC" WITH ADMIN OPTION;
GRANT UNDER ANY VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY ASSEMBLY TO "FREDERIC" WITH ADMIN OPTION;
GRANT GRANT ANY PRIVILEGE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY TRIGGER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXPORT FULL DATABASE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY MEASURE FOLDER TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY EVALUATION CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT FLASHBACK ARCHIVE ADMINISTER TO "FREDERIC" WITH ADMIN OPTION;
GRANT IMPORT FULL DATABASE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY OUTLINE TO "FREDERIC" WITH ADMIN OPTION;
GRANT COMMENT ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXEMPT DML REDACTION POLICY TO "FREDERIC" WITH ADMIN OPTION;
GRANT READ ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE DATABASE LINK TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP PUBLIC SYNONYM TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP USER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CHANGE NOTIFICATION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE MINING MODEL TO "FREDERIC" WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY MATERIALIZED VIEW TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE RULE SET TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXEMPT ACCESS POLICY TO "FREDERIC" WITH ADMIN OPTION;
GRANT MANAGE SCHEDULER TO "FREDERIC" WITH ADMIN OPTION;
GRANT READ ANY FILE GROUP TO "FREDERIC" WITH ADMIN OPTION;
GRANT FORCE TRANSACTION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY CUBE BUILD PROCESS TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY SQL TRANSLATION PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP PUBLIC DATABASE LINK TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY INDEXTYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY SQL PROFILE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER SYSTEM TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY ROLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY CUBE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY TRIGGER TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY ASSEMBLY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY DIRECTORY TO "FREDERIC" WITH ADMIN OPTION;
GRANT ENQUEUE ANY QUEUE TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY EVALUATION CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY ASSEMBLY TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY TYPE TO "FREDERIC" WITH ADMIN OPTION;
GRANT REDEFINE ANY TABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE CLUSTER TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT EXECUTE ANY EVALUATION CONTEXT TO "FREDERIC" WITH ADMIN OPTION;
GRANT RESUMABLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE ANY LIBRARY TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP ANY EDITION TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE PROCEDURE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER DATABASE TO "FREDERIC" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE TO "FREDERIC" WITH ADMIN OPTION;
GRANT GRANT ANY ROLE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY RULE TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE CUBE DIMENSION TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ANY OPERATOR TO "FREDERIC" WITH ADMIN OPTION;
GRANT CREATE CUBE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER RESOURCE COST TO "FREDERIC" WITH ADMIN OPTION;
GRANT DROP TABLESPACE TO "FREDERIC" WITH ADMIN OPTION;
GRANT ALTER ROLLBACK SEGMENT TO "FREDERIC" WITH ADMIN OPTION;
GRANT PURGE DBA_RECYCLEBIN TO "FREDERIC" WITH ADMIN OPTION;

-- Les rôles suivant ne peuvent pas etre appliqués directement :
--GRANT SYSKM TO "FREDERIC" WITH ADMIN OPTION;;
--GRANT SYSBACKUP TO "FREDERIC" WITH ADMIN OPTION;
--GRANT SYSDBA TO "FREDERIC" WITH ADMIN OPTION;
--GRANT SYSOPER TO "FREDERIC" WITH ADMIN OPTION;
--GRANT SYSDG TO "FREDERIC" WITH ADMIN OPTION;

/*==============================================================*/
/* CREATION DE LA BDD                                       	*/
/*==============================================================*/
/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  27/07/2016 10:00:00                      */
/* Classement par ordre d'INSERTion dans la BDD                 */
/*==============================================================*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

/*==============================================================*/
/* Table : COLLABORATEURS                                       */
/*																*/
/*==============================================================*/
create table COLLABORATEURS 
(
   COL_MATRICULE        NUMBER(4)            not null,
   COL_COL_MATRICULE    NUMBER(4)					,
   COL_SEXE             CHAR(1)              not null,
   COL_ETATCIVIL        CHAR(4)              not null,
   COL_NOM              VARCHAR2(250)         not null,
   COL_PRENOM           VARCHAR2(250)         not null,
   COL_DATENAISSANCE    DATE   				NOT NULL,
   COL_ADRESSE1         VARCHAR2(250)         not null,
   COL_ADRESSE2         VARCHAR2(250)         not null,
   COL_VILLE            VARCHAR2(250)         not null,
   COL_CP               VARCHAR2(25)          not null,
   COL_TELEPHONE        VARCHAR2(25)         not null,
   COL_STATUT           VARCHAR2(250)          not null,
   COL_ANCIENNETE       VARCHAR2(250)			,
   COL_CENTRESINTERETS  VARCHAR2(250)
);
/*
ALTER TABLE COLLABORATEURS 
  ADD (
        COL_DATENAISSANCE             DATE   NOT NULL
		--, autres attributs a ajouter ?
      );
*/
alter table COLLABORATEURS
   add constraint PK_COLLABORATEURS primary key (COL_MATRICULE);
create index ACCUEILLIR_FK on COLLABORATEURS (   COL_COL_MATRICULE ASC	); --Relation Reflexive

/*==============================================================*/
/* Table : SALAIRES                                             */
/*																*/
/* Historisation de chaque fiche de salaire.					*/
/* Un trigger verifiera si l'augmentation ne depasse pas :		*/
/* - le salaire de base indiqué dans le contrat OCCUPER_FONCTION*/
/* - majoré d'un pourcentage defini par l''entreprise (ici 20%)	*/
/*==============================================================*/
create table SALAIRES 
(
   SALAIRE_ID           NUMBER(6)            not null,
   COL_MATRICULE        NUMBER(4),
   SALAIRE_MENSUEL      NUMBER(7,2)          not null,
   SALAIRE_DATE         DATE                 not null
);
alter table SALAIRES
   add constraint PK_SALAIRES primary key (SALAIRE_ID);
create index REMUNERER_FK on SALAIRES (   COL_MATRICULE ASC	);

/*==============================================================*/
/* Table : LIBFONCTIONS                                         */
/*																*/
/* Type de fonctions que peuvent occuper les collaborateurs : 	*/
/* Responsable de projet, Analyste responsable d’application, 	*/
/* Développeur, Technicien support, Commercial, Secrétaire		*/
/* Technico-commercial, ... 									*/
/*==============================================================*/
create table LIBFONCTIONS 
(
   FONCTION_ID          NUMBER(6)            not null,
   FONCTION_LIBELLE     VARCHAR2(250)         not null
);
alter table LIBFONCTIONS
   add constraint PK_LIBFONCTIONS primary key (FONCTION_ID);

/*==============================================================*/
/* Table Relationnelle : OCCUPERFONCTIONS                       */
/*																*/
/* Historique des fonctions occupées par un collaborateur		*/
/*==============================================================*/
create table OCCUPERFONCTIONS 
(
   COL_MATRICULE        NUMBER(4)            not null,
   FONCTION_ID          NUMBER(6)            not null,
   COL_TYPECONTRAT      CHAR(3)              not null,
   COL_DATEEMBAUCHE     DATE                 not null,
   COL_DATEFINCONTRAT   DATE,
   COL_SALAIREBASE      NUMBER(7,2)          not null
);
alter table OCCUPERFONCTIONS
   add constraint PK_OCCUPERFONCTIONS primary key (COL_MATRICULE, FONCTION_ID);

/*==============================================================*/
/* Table : LIBDOMACTIVITES                                      */
/*																*/
/* Libéllés liés aux domaines d'activités						*/
/*==============================================================*/
create table LIBDOMACTIVITES 
(
   CLI_DOMAINEID        NUMBER(6)            not null,
   CLI_DOMAINEACTIVITE  VARCHAR2(250)        not null
);
alter table LIBDOMACTIVITES
   add constraint PK_LIBDOMACTIVITES primary key (CLI_DOMAINEID);
   
/*==============================================================*/
/* Table : CLIENTS                                              */
/*																*/
/*==============================================================*/
create table CLIENTS 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   CLI_NOM              VARCHAR2(250)         not null,
   CLI_RAISONSOCIALE    VARCHAR2(250),
   CLI_TYPE             CHAR(2),		--Pr/Pu > Privé / Public
   CLI_ADRESSE          VARCHAR2(250),
   CLI_TELEPHONE        VARCHAR2(250),
   CLI_CHIFFREAFFAIRE   NUMBER(10),		--Exprimé en millier d''euros
   CLI_EFFECTIFS        NUMBER(7),
   CLI_NATURE           VARCHAR2(250)	--principale/secondaire/ancienne
);
alter table CLIENTS
   add constraint PK_CLIENTS primary key (CLI_NUMCLIENT);
   
/*==============================================================*/
/* Table Relationnelle : CLIDOMAINE                             */
/*																*/
/* Repertorie les differents domaines d'activites pour chaque   */
/* client														*/
/*==============================================================*/
create table CLIDOMAINE 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   CLI_DOMAINEID        NUMBER(6)            not null
);
alter table CLIDOMAINE
   add constraint PK_CLIDOMAINE primary key (CLI_NUMCLIENT, CLI_DOMAINEID);
   
/*==============================================================*/
/* Table Relationnelle : CLICOMMENTER                           */
/*																*/
/* Commentaires des commerciaux specifique aux clients 			*/
/*==============================================================*/
create table CLICOMMENTER 
(
   COL_MATRICULE        NUMBER(4)            not null,
   CLI_NUMCLIENT        NUMBER(4)            not null,
   COMCLI_COMCLIENT     VARCHAR2(250)        not null,
   COMCLI_DATETIME      DATE                 not null
);
alter table CLICOMMENTER
   add constraint PK_CLICOMMENTER primary key (COL_MATRICULE, CLI_NUMCLIENT);
   
/*==============================================================*/
/* Table : PROJETS                                              */
/*																*/
/*==============================================================*/
create table PROJETS 
(
   PROJET_CODE          NUMBER(4)            not null,
   CLI_NUMCLIENT        NUMBER(4),
   PROJET_LIBELLECOURT  VARCHAR2(250)         not null,
   PROJET_LIBELLELONG   VARCHAR2(250)         not null,
   PROJET_TYPE          CHAR(1)              not null,	--Forfait / Assistance / Régie
   PROJET_CYCLEVIE      VARCHAR2(250)         not null,	--complet, etudes de l''existant, développement, ...
   PROJET_SECTEURACTIVITE VARCHAR2(250)         not null,
   PROJET_DATEPREVUEDEBUT DATE                 not null,
   PROJET_DATEPREVUEFIN DATE                 not null,
   PROJET_DATEREELLEDEBUT DATE,
   PROJET_DATERELLEFIN  DATE,
   PROJET_NBRCOLLABMAX  NUMBER(3),
   PROJET_CHARGEGLOBALEESTIMEE NUMBER(5)     not null,	--En heures
   PROJET_REMARQUEESTIMATION VARCHAR2(250),
   PROJET_THEMETECHNIQUE VARCHAR2(250)
);
alter table PROJETS
   add constraint PK_PROJETS primary key (PROJET_CODE);
create index RELATION_1_FK on PROJETS (   CLI_NUMCLIENT ASC	);

/*==============================================================*/
/* Table Relationnelle : CONTACTS                               */
/*																*/
/*==============================================================*/
create table CONTACTS 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   PROJET_CODE          NUMBER(4)            not null,
   CON_FONCTION         VARCHAR2(250)         not null,
   CON_NOM              VARCHAR2(250)         not null,
   CON_PRENOM           VARCHAR2(250)
);
alter table CONTACTS
   add constraint PK_CONTACTS primary key (CLI_NUMCLIENT, PROJET_CODE);

/*==============================================================*/
/* Table : DOCUMENTS                                            */
/*																*/
/* Documents associés projets - Rédigé par collaborateur interne*/
/*==============================================================*/
create table DOCUMENTS 
(
   DOC_ID               NUMBER(6)            not null,
   COL_MATRICULE        NUMBER(4),
   DOC_TITRE            VARCHAR2(250),
   DOC_RESUME           VARCHAR2(250),
   DOC_DATEDIFFUSION    DATE
);
alter table DOCUMENTS
   add constraint PK_DOCUMENTS primary key (DOC_ID);
create index REDIGER_FK on DOCUMENTS (	   COL_MATRICULE ASC	);

/*==============================================================*/
/* Table Relationnelle : REFERERDOC                             */
/*																*/
/*==============================================================*/
create table REFERERDOC 
(
   DOC_ID               NUMBER(6)            not null,
   PROJET_CODE          NUMBER(4)            not null
);
alter table REFERERDOC
   add constraint PK_REFERERDOC primary key (DOC_ID, PROJET_CODE);

/*==============================================================*/
/* Table Relationnelle : PROCOMMENTER                           */
/*																*/
/* Commentaires des commerciaux specifique au projet du client	*/
/*==============================================================*/
create table PROCOMMENTER 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   COL_MATRICULE        NUMBER(4)            not null,
   PROJET_CODE          NUMBER(4)            not null,
   COMPRO_COMPROJET     VARCHAR2(250)        not null,
   COMPRO_DATETIME      DATE                 not null
);
alter table PROCOMMENTER
   add constraint PK_PROCOMMENTER primary key (CLI_NUMCLIENT, COL_MATRICULE, PROJET_CODE);

/*==============================================================*/
/* Table : LIBETAPES                                            */
/*																*/
/* Activités ou étapes du processus : Analyse des besoins, 		*/
/* Conception, Programmation, Tests unitaires, 					*/
/* Tests d’intégration, Tests de recette et installation, 		*/
/* Management du projet, Gestion de configuration, 				*/
/* Formation spécifique au projet, Divers						*/
/*==============================================================*/
create table LIBETAPES 
(
   STEP_ID              NUMBER(6)            not null,
   STEP_LIBELLE         VARCHAR2(250)         not null
);
alter table LIBETAPES
   add constraint PK_LIBETAPES primary key (STEP_ID);

/*==============================================================*/
/* Table : ETAPES                                               */
/*																*/
/*==============================================================*/
create table ETAPES 
(
   CHARGE_NUMLOT        NUMBER(6)            not null,	--PK : PROJET_CODE+SEQUENCE
   STEP_ID              NUMBER(6)			not null,	--FK : LIBETAPES
   PROJET_CODE          NUMBER(4)			not null,	--FK : PROJETS
   CHARGE_ESTIMEEINITIAL NUMBER(6)            not null,
   CHARGE_REELLESPROD   NUMBER(6),
   CHARGE_DATEDEBUT     DATE                 not null,
   CHARGE_DATEFIN       DATE,
   CHARGE_VALIDATION    NUMBER(6)
);
alter table ETAPES
   add constraint PK_ETAPES primary key (CHARGE_NUMLOT);
create index RELATION_4_FK on ETAPES (   STEP_ID ASC	);
create index COMPOSER_FK on ETAPES (   PROJET_CODE ASC	);

/*==============================================================*/
/* Table : INTERVENIR  (ternaire)                               */
/*																*/
/*==============================================================*/
create table INTERVENIR 
(
   INT_NUMINTERVENTION  NUMBER(6)            not null, 	--PK
   FONCTION_ID          NUMBER(6),						--FK : LIBFONCTIONS
   CHARGE_NUMLOT        NUMBER(6),						--FK : ETAPES
   COL_MATRICULE        NUMBER(4),						--FK : COLLABORATEURS
   INT_DOMAINEINTER     VARCHAR2(250),
   INT_TYPEACTIVITE     VARCHAR2(250),
   INT_DATEDEBUT        DATE                 not null,
   INT_DATEFIN          DATE
);
alter table INTERVENIR
   add constraint PK_INTERVENIR primary key (INT_NUMINTERVENTION);
create index APPELER_FK on INTERVENIR (   COL_MATRICULE ASC		);
create index RELATION_10_FK on INTERVENIR (   FONCTION_ID ASC	);
create index CIBLER_FK on INTERVENIR (   CHARGE_NUMLOT ASC		);

/*==============================================================*/
/* Table : LIBRETEXP                                            */
/*																*/
/* Libellés permettant d'ajouter de nouvelles technologie en 	*/
/* retour d'experience.											*/
/*==============================================================*/
create table LIBRETEXP 
(
   RETEXP_ID            NUMBER(6)             not null,
   RETEXP_LIBELLE       VARCHAR2(250)         not null
);
alter table LIBRETEXP
   add constraint PK_LIBRETEXP primary key (RETEXP_ID);
   
/*==============================================================*/
/* Table : COLLABORER  (binaire)                                */
/*																*/
/*==============================================================*/
create table COLLABORER 
(
   COLAB_ID             NUMBER(20)            not null,	--PK
   PROJET_CODE          NUMBER(4),			 not null,	--FK : PROJETS
   COL_MATRICULE        NUMBER(4),			 not null,	--FK : COLLABORATEURS
   COLAB_DATE_INTEGRATION DATE               not null,
   COLAB_EVOLUTION_FONCTION VARCHAR2(250),
   /* Un collaborateur n’interviendra jamais sur 2 projets simultanément.			*/
   /* Des évolutions de fonctions sont nécessaires à leur évolution de carrière.	*/
   /* Ils peuvent donc être amenés à titre d’essai à intervenir sur un projet avec	*/
   /* une fonction n’étant pas encore la leur. 										*/
   /* Un collaborateur ne peut cumuler plusieurs fonctions en même temps.			*/
   COLAB_CHEF_PROJET    SMALLINT             not null,	--BOOL
   /* Un developpeur, par evolution de fonction, peux etre designé chef de projet.	*/
   /* Dans ce cas, ce booleen lui permettra d'avoir les droits de faire des retours */
   /* d'experiences sur le projet en question.										*/
   COLAB_PARTICIPE_TOUJOURS SMALLINT         not null	--BOOL
   /* 	Si TRUE : impossible d''attribuer un nouveau projet au collaborateur
		Si FALSE : Le collaborateur ne travail plus sur ce projet
		> Requete : select * where ''participe_tjs'' = true
		> Algo :  if requete == null : collaborateur peux etre designe sur un projet'; */
);
alter table COLLABORER
   add constraint PK_COLLABORER primary key (COLAB_ID);
create index COLLABORER_FK on COLLABORER (	COL_MATRICULE ASC	);
create index PARTICIPER_FK on COLLABORER (	PROJET_CODE ASC		);

/*==============================================================*/
/* Table Relationnelle : RETOURSEXP                             */
/*																*/
/* Le retour d’expérience est une notion pouvant concerner 		*/
/* plusieurs projets (des normes, des techniques, …) et un 		*/
/* projet peut avoir des retours d’expérience à propos de 		*/
/* plusieurs sujets. Pour chaque projet, le CP enregistrera les */
/* informations techniques du projet telles que les langages de */
/* développement, les plates-formes, les bases de données et les*/
/* outils employés, la taille (en ligne de code). Avec ce type 	*/
/* d’information, un chef de projet peut par exemple chercher 	*/
/* tous les projets qui portent sur un domaine application 		*/
/* spécifique, tous ceux qui ont utilisé un système de gestion	*/
/*  de base de données (SGBD) ou un langage de développement 	*/
/* particulier, ou encore tous ceux dont le produit développé	*/
/*  était destiné à une plateforme spécifique.					*/
/*==============================================================*/
create table RETOURSEXP 
(
   EXP_ID				NUMBER(20)           not null,	--PK
   CHARGE_NUMLOT        NUMBER(6)            not null,	--FK : ETAPES
   COLAB_ID             NUMBER(6)            not null,	--FK : COLLABORATEURS
   RETEXP_ID            NUMBER(6)            not null,	--FK : LIBRETEXP
   EXP_DATETIME         DATE                 not null, 	
   EXP_DESCRIPTION      VARCHAR2(250)        not null	
);
alter table RETOURSEXP
   add constraint PK_RETOURSEXP primary key (EXP_ID);
--   add constraint PK_RETOURSEXP primary key (CHARGE_NUMLOT, COLAB_ID, RETEXP_ID); 


   
/*==============================================================*/
/* AJOUT DES CLEFS ETRANGERES		                            */
/*==============================================================*/
alter table CLICOMMENTER
   add constraint FK_CLICOMME_CLICOMMEN_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table CLICOMMENTER
   add constraint FK_CLICOMME_CLICOMMEN_CLIENTS foreign key (CLI_NUMCLIENT)
      references CLIENTS (CLI_NUMCLIENT);

alter table CLIDOMAINE
   add constraint FK_CLIDOMAI_CLIDOMAIN_CLIENTS foreign key (CLI_NUMCLIENT)
      references CLIENTS (CLI_NUMCLIENT);

alter table CLIDOMAINE
   add constraint FK_CLIDOMAI_CLIDOMAIN_LIBDOMAC foreign key (CLI_DOMAINEID)
      references LIBDOMACTIVITES (CLI_DOMAINEID);

alter table COLLABORATEURS
   add constraint FK_COLLABOR_ACCUEILLI_COLLABOR foreign key (COL_COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table COLLABORER
   add constraint FK_COLLABOR_COLLABORE_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table COLLABORER
   add constraint FK_COLLABOR_PARTICIPE_PROJETS foreign key (PROJET_CODE)
      references PROJETS (PROJET_CODE);

alter table CONTACTS
   add constraint FK_CONTACTS_CONTACTS_CLIENTS foreign key (CLI_NUMCLIENT)
      references CLIENTS (CLI_NUMCLIENT);

alter table CONTACTS
   add constraint FK_CONTACTS_CONTACTS2_PROJETS foreign key (PROJET_CODE)
      references PROJETS (PROJET_CODE);

alter table DOCUMENTS
   add constraint FK_DOCUMENT_REDIGER_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table ETAPES
   add constraint FK_ETAPES_COMPOSER_PROJETS foreign key (PROJET_CODE)
      references PROJETS (PROJET_CODE);

alter table ETAPES
   add constraint FK_ETAPES_RELATION__LIBETAPE foreign key (STEP_ID)
      references LIBETAPES (STEP_ID);

alter table INTERVENIR
   add constraint FK_INTERVEN_APPELER_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table INTERVENIR
   add constraint FK_INTERVEN_CIBLER_ETAPES foreign key (CHARGE_NUMLOT)
      references ETAPES (CHARGE_NUMLOT);

alter table INTERVENIR
   add constraint FK_INTERVEN_RELATION__LIBFONCT foreign key (FONCTION_ID)
      references LIBFONCTIONS (FONCTION_ID);

alter table OCCUPERFONCTIONS
   add constraint FK_OCCUPERF_OCCUPERFO_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table OCCUPERFONCTIONS
   add constraint FK_OCCUPERF_OCCUPERFO_LIBFONCT foreign key (FONCTION_ID)
      references LIBFONCTIONS (FONCTION_ID);

alter table PROCOMMENTER
   add constraint FK_PROCOMME_PROCOMMEN_CLIENTS foreign key (CLI_NUMCLIENT)
      references CLIENTS (CLI_NUMCLIENT);

alter table PROCOMMENTER
   add constraint FK_PROCOMME_PROCOMMEN_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

alter table PROCOMMENTER
   add constraint FK_PROCOMME_PROCOMMEN_PROJETS foreign key (PROJET_CODE)
      references PROJETS (PROJET_CODE);

alter table PROJETS
   add constraint FK_PROJETS_RELATION__CLIENTS foreign key (CLI_NUMCLIENT)
      references CLIENTS (CLI_NUMCLIENT);

alter table REFERERDOC
   add constraint FK_REFERERD_REFERERDO_DOCUMENT foreign key (DOC_ID)
      references DOCUMENTS (DOC_ID);

alter table REFERERDOC
   add constraint FK_REFERERD_REFERERDO_PROJETS foreign key (PROJET_CODE)
      references PROJETS (PROJET_CODE);

alter table RETOURSEXP
   add constraint FK_RETOURSE_RETOURSEX_ETAPES foreign key (CHARGE_NUMLOT)
      references ETAPES (CHARGE_NUMLOT);

alter table RETOURSEXP
   add constraint FK_RETOURSE_RETOURSEX_COLLABOR foreign key (COLAB_ID)
      references COLLABORER (COLAB_ID);

alter table RETOURSEXP
   add constraint FK_RETOURSE_RETOURSEX_LIBRETEX foreign key (RETEXP_ID)
      references LIBRETEXP (RETEXP_ID);

alter table SALAIRES
   add constraint FK_SALAIRES_REMUNERER_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

/*==============================================================*/
/* AJOUT DES SEQUENCES				                            */
/*==============================================================*/  
	  
create sequence S_COLLABORATEURS;

create sequence S_COLLABORER;

create sequence S_DOCUMENTS;

create sequence S_INTERVENIR;

create sequence S_LIBDOMACTIVITES;

create sequence S_LIBETAPES;

create sequence S_LIBFONCTIONS;

create sequence S_LIBRETEXP;

create sequence S_SALAIRES;

create sequence S_CLIENTS;

CREATE SEQUENCE S_PROJETS INCREMENT BY 1 START WITH 1 MAXVALUE 99 MINVALUE 1 CYCLE;

CREATE SEQUENCE S_ETAPES INCREMENT BY 1 START WITH 1 MAXVALUE 99 MINVALUE 1 CYCLE;

create sequence S_RETOURSEXP;

/* INFORMATIONS

Les triggers doivent etre compilés et non executé (icone fichier avec fleche verte : "Executer un script (F5)"

OLD représente la valeur avant modification
OLD n'est renseignée que pour les ordres DELETE et UPDATE. Elle n'a aucune signification pour un ordre INSERT, puisqu'aucune ancienne valeur n'existe 

NEW représente la nouvelle valeur
NEW n'est renseignée que pour les ordres INSERT et UPDATE. Elle n'a aucune signification pour un ordre DELETE, puisqu'aucune nouvelle valeur n'existe 
*/
------------------------------------------------------------------------------------------------------

/* COLLABORATEURS */

---CONTRAINTE A ENTRER MANUELLEMENT-------------------------------------------------------------------
-- L'ajout de contrainte se fait par clic droit sur la table > contrainte > Ajouter la verification...
UPPER(COL_ETATCIVIL) IN ('M.', 'MR', 'MME', 'MLLE')
UPPER(COL_SEXE) IN ('M', 'F')
--alter table "CDI10"."COLLABORATEURS" add constraint CHECK_ETATCIVIL check(UPPER(COL_ETATCIVIL) IN ('M.', 'MR', 'MME', 'MLLE')) ENABLE
--alter table "CDI10"."COLLABORATEURS" add constraint CHECK_SEXE check(UPPER(COL_SEXE) IN ('M', 'F')) ENABLE
------------------------------------------------------------------------------------------------------

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
  COL_AGE NUMBER(3,2);
BEGIN     
    -- Calcul la difference (années) entre la date actuelle et date de naissance :
    SELECT trunc(months_between(SYSDATE, to_date(:NEW.COL_DATENAISSANCE))/365) INTO COL_AGE FROM dual;
    
    -- Detection des personnes mineures :
    IF (COL_AGE < 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Avoir un âge négatif est interdit !'); 
    END IF; 
    IF (COL_AGE < 16) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Ce collaborateur est encore mineur !'); 
    END IF;     
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

/* VERIFICATION */
SELECT * from ALL_constraints where table_name = 'COLLABORATEURS';
SELECT * from ALL_triggers where table_name = 'COLLABORATEURS';

select * from USER_TRIGGERS;
--select * from DBA_TRIGGERS;


/*==============================================================*/
/* JEU D'INSERTION POUR LA BDD                                 	*/
/*==============================================================*/
/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  26/07/2016 16:37:46                      */
/*==============================================================*/

/* https://docs.oracle.com/cd/B14117_01/appdev.101/b10807/13_elems025.htm */
/* 
INSERT INTO bonus SELECT ename, job, sal, comm FROM emp
   WHERE comm > sal * 0.25;
...
INSERT INTO emp (empno, ename, job, sal, comm, deptno)
   VALUES (4160, 'STURDEVIN', 'SECURITY GUARD', 2045, NULL, 30);
...
INSERT INTO dept
   VALUES (my_deptno, UPPER(my_dname), 'CHICAGO');
*/
-----------------------------------------------------------------BEGIN
/* COLLABORATEURS */
--DELETE FROM COLLABORATEURS WHERE COL_MATRICULE > 0;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY'; --AJOUT DATE NAISSANCE
INSERT INTO COLLABORATEURS (COL_MATRICULE,COL_SEXE,COL_ETATCIVIL,COL_NOM,COL_PRENOM,COL_DATENAISSANCE,COL_ADRESSE1,COL_ADRESSE2,COL_VILLE,COL_CP,COL_TELEPHONE,COL_STATUT,COL_ANCIENNETE,COL_CENTRESINTERETS)
  VALUES (1601,'F','MME','Poulain','Amélie','30/12/1980','56 rue des Trois Frères',' ','Paris','75005','0972461483','MARIEE','15','Se meler de la vie des autres');
INSERT INTO COLLABORATEURS (COL_MATRICULE,COL_COL_MATRICULE,COL_SEXE,COL_ETATCIVIL,COL_NOM,COL_PRENOM,COL_DATENAISSANCE,COL_ADRESSE1,COL_ADRESSE2,COL_VILLE,COL_CP,COL_TELEPHONE,COL_STATUT,COL_ANCIENNETE,COL_CENTRESINTERETS) 
  VALUES (1602,1602,'M','MR','Kiok','Michael','30/12/1980','69 rue de la pignolle',' ','Berlin','12627','49123456789','c' || '''' || 'est complixe !','52','Aime prendre des chevaux et sa chienne Cessy');
	UPDATE COLLABORATEURS SET COL_STATUT = 'C'|| '''' ||'est compliqué' WHERE COL_MATRICULE = 1602;
	UPDATE COLLABORATEURS SET COL_COL_MATRICULE = 1601 WHERE COL_MATRICULE = 1602;
INSERT INTO COLLABORATEURS (COL_MATRICULE,COL_SEXE,COL_ETATCIVIL,COL_NOM,COL_PRENOM,COL_DATENAISSANCE,COL_ADRESSE1,COL_ADRESSE2,COL_VILLE,COL_CP,COL_TELEPHONE,COL_STATUT,COL_ANCIENNETE,COL_CENTRESINTERETS)
  VALUES (1603,'F','MME','Croft','Lara','30/12/1980','Manoir Croft','Restricted Area','Etat-Unis','INCONNU','INCONNU','CELIB','20','Augmenter son tour de poitrine');
INSERT INTO COLLABORATEURS (COL_MATRICULE,COL_COL_MATRICULE,COL_SEXE,COL_ETATCIVIL,COL_NOM,COL_PRENOM,COL_DATENAISSANCE,COL_ADRESSE1,COL_ADRESSE2,COL_VILLE,COL_CP,COL_TELEPHONE,COL_STATUT,COL_ANCIENNETE,COL_CENTRESINTERETS)
  VALUES (1604,1602,'M','MR','Castor','Père','30/12/1980','Dans un arbre','Dans son canapé','Foret','54000','Par pigeon','VEUF','87','Raconter des histoires');
SELECT * FROM CDI10.COLLABORATEURS ORDER BY COL_MATRICULE;
-----------------------------------------------------------------OK
/* SALAIRES */
-- --SALAIRE_ID n'est pas obligatoire car géré par un TRIGGER
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO SALAIRES (SALAIRE_ID,COL_MATRICULE,SALAIRE_MENSUEL,SALAIRE_DATE)
  VALUES (S_SALAIRES.nextval, 1601, '1300,48', '2016/07/27 14:53:45');  
INSERT INTO SALAIRES VALUES (S_SALAIRES.nextval, 1602, '1500,00', '2016/07/27 14:55:45');
--INSERT INTO SALAIRES VALUES (S_SALAIRES.nextval, 1602, '1500,00', '2016/07/27 14:55:45');
--DELETE FROM SALAIRES WHERE COL_MATRICULE=1602 AND SALAIRE_ID > 2;
INSERT INTO SALAIRES VALUES (S_SALAIRES.nextval, 1603, '9000,00', '2016/07/27 14:56:45');
INSERT INTO SALAIRES VALUES (S_SALAIRES.nextval, 1604, '600,00', '2016/07/27 14:57:45');
--DELETE FROM SALAIRES WHERE SALAIRE_ID = 5;
SELECT * FROM CDI10.SALAIRES ORDER BY SALAIRE_DATE;
-----------------------------------------------------------------OK
/* LIBFONCTIONS */
INSERT INTO LIBFONCTIONS (FONCTION_ID,FONCTION_LIBELLE)
 VALUES (S_LIBFONCTIONS.nextval, 'Developpeur');  
 -- d'autres ajouts a faire pour alimenter la base ! =)
SELECT * FROM CDI10.LIBFONCTIONS;
-----------------------------------------------------------------OK
/* OCCUPERFONCTIONS */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO OCCUPERFONCTIONS (COL_MATRICULE,FONCTION_ID,COL_TYPECONTRAT,COL_DATEEMBAUCHE,COL_DATEFINCONTRAT,COL_SALAIREBASE)
 VALUES (1601, 1, 'CDD', '2016/07/28 09:00:00', '2017/07/28 09:00:00', '1300,48');  
 -- d'autres ajouts a faire pour alimenter la base ! =)
SELECT * FROM CDI10.OCCUPERFONCTIONS;
-----------------------------------------------------------------OK
/* LIBDOMACTIVITES */
INSERT INTO LIBDOMACTIVITES (CLI_DOMAINEID,CLI_DOMAINEACTIVITE)
 VALUES (S_LIBDOMACTIVITES.nextval, 'Agro-Alimentaire');  
 -- d'autres ajouts a faire pour alimenter la base ! =)
SELECT * FROM CDI10.LIBDOMACTIVITES;
-----------------------------------------------------------------OK
/* CLIENTS */
INSERT INTO CLIENTS (CLI_NUMCLIENT,CLI_NOM,CLI_RAISONSOCIALE,CLI_TYPE,CLI_ADRESSE,CLI_TELEPHONE,CLI_CHIFFREAFFAIRE,CLI_EFFECTIFS,CLI_NATURE)
 VALUES (1601, 'NaturalFood', 'SARL', 'Pr', '20 rue de la cambrousse 00000 Neverland', '0123456789',10,35,'principale');  
 -- Creer aussi directement la liaison avec son domaine d'activite ! > CLIDOMAINE
SELECT * FROM CDI10.CLIENTS;
-----------------------------------------------------------------OK
/* CLIDOMAINE */
INSERT INTO CLIDOMAINE (CLI_NUMCLIENT,CLI_DOMAINEID)
 VALUES (1601, 1);  
 -- d'autres ajouts a faire pour alimenter la base ! =)
SELECT * FROM CDI10.CLIDOMAINE; 
-----------------------------------------------------------------OK
/* CLICOMMENTER */
--SELECT COL_MATRICULE FROM CDI10.COLLABORATEURS ORDER BY COL_MATRICULE;
--SELECT CLI_NUMCLIENT FROM CDI10.CLIENTS;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO CLICOMMENTER (COL_MATRICULE,CLI_NUMCLIENT,COMCLI_COMCLIENT,COMCLI_DATETIME) VALUES 
	(1601,1601,'Je me fourni en concombre et gros navet la bas !','2016/04/21 11:45:10');
INSERT INTO CLICOMMENTER (COL_MATRICULE,CLI_NUMCLIENT,COMCLI_COMCLIENT,COMCLI_DATETIME) VALUES 
	(1602,1601,'Ils ne possedent que des vaches, dommage...','2016/05/24 13:45:20');
INSERT INTO CLICOMMENTER (COL_MATRICULE,CLI_NUMCLIENT,COMCLI_COMCLIENT,COMCLI_DATETIME) VALUES 
	(1603,1601,'Ne possède aucune relique... :/','2016/06/27 13:45:30');
INSERT INTO CLICOMMENTER (COL_MATRICULE,CLI_NUMCLIENT,COMCLI_COMCLIENT,COMCLI_DATETIME) VALUES 
	(1604,1601,'Laissez moi vous raconter cette histoire...','2016/07/29 13:45:40');
SELECT * FROM CDI10.CLICOMMENTER;
-----------------------------------------------------------------OK
/* PROJETS */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO PROJETS (CLI_NUMCLIENT,PROJET_LIBELLECOURT,PROJET_LIBELLELONG,PROJET_TYPE,
	PROJET_CYCLEVIE,PROJET_SECTEURACTIVITE,PROJET_DATEPREVUEDEBUT,PROJET_DATEPREVUEFIN,PROJET_CHARGEGLOBALEESTIMEE) 
	VALUES (1601,'Site E-Commerce','Presentation produits et ventes','F',
			'COMPLET','Commerce','2016/07/29 11:35:00','2016/10/29 11:35:00',500);
UPDATE PROJETS SET PROJET_DATEREELLEDEBUT = '2016/08/01 00:00:00' WHERE PROJET_CODE = 1601;
SELECT * FROM CDI10.PROJETS;
-----------------------------------------------------------------OK
/* CONTACTS */
SELECT * FROM CDI10.CLIENTS;
SELECT * FROM CDI10.PROJETS;
INSERT INTO CONTACTS (CLI_NUMCLIENT,PROJET_CODE,CON_FONCTION,CON_NOM,CON_PRENOM) 
	VALUES (1601,1601,'Roi du Nord','Snow','Jon');
SELECT * FROM CDI10.CONTACTS;
-----------------------------------------------------------------OK
/* DOCUMENTS */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO DOCUMENTS (DOC_ID,COL_MATRICULE,DOC_TITRE,DOC_RESUME,DOC_DATEDIFFUSION) 
	VALUES (S_DOCUMENTS.nextval,1601,'Le roi est mort ! Vive le roi !','Roi des sandales et des premiers sommes','2016/10/29 11:35:00');
INSERT INTO DOCUMENTS (COL_MATRICULE,DOC_TITRE,DOC_RESUME,DOC_DATEDIFFUSION)
	VALUES (1601, 'Cher journal', 'Notes concernant les voisins...','2016/07/27 15:23:45');  
-- Il faut aussi créer directement la relation entre le projet et le document : REFERERDOC
SELECT * FROM CDI10.DOCUMENTS;
-----------------------------------------------------------------OK
/* REFERERDOC */
SELECT * FROM CDI10.DOCUMENTS;
SELECT * FROM CDI10.PROJETS;
INSERT INTO CONTACTS (DOC_ID,PROJET_CODE) VALUES (1,1601);
SELECT * FROM CDI10.CONTACTS;
-----------------------------------------------------------------OK
/* PROCOMMENTER */
SELECT * FROM CDI10.CLIENTS;
SELECT * FROM CDI10.COLLABORATEURS ORDER BY COL_MATRICULE;
SELECT * FROM CDI10.PROJETS;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO PROCOMMENTER (CLI_NUMCLIENT,COL_MATRICULE,PROJET_CODE,COMPRO_COMPROJET,COMPRO_DATETIME) 
	VALUES (1601,1601,1601,'Que va devenir Arya ?','2016/08/02 15:23:45');
SELECT * FROM CDI10.PROCOMMENTER;
-----------------------------------------------------------------OK
/* LIBETAPES */
INSERT INTO LIBETAPES (STEP_LIBELLE) VALUES ('ETUDES');
-- Section pouvant etre alimenté pour jeu d'essai !
SELECT * FROM CDI10.LIBETAPES;
-----------------------------------------------------------------OK
/* ETAPES */
SELECT * FROM CDI10.LIBETAPES;
SELECT * FROM CDI10.PROJETS;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO ETAPES (STEP_ID,PROJET_CODE,CHARGE_ESTIMEEINITIAL,CHARGE_DATEDEBUT) 
	VALUES (1,1601,11,'2016/08/02 10:00:00');
UPDATE ETAPES SET CHARGE_REELLESPROD = 12, CHARGE_DATEFIN = '2016/08/04 15:23:45', CHARGE_VALIDATION = 12 WHERE CHARGE_NUMLOT = 160101;
SELECT * FROM CDI10.ETAPES;
-----------------------------------------------------------------OK
/* INTERVENIR */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO INTERVENIR (FONCTION_ID,CHARGE_NUMLOT,COL_MATRICULE,INT_DATEDEBUT) VALUES (1,160101,1601,'2016/08/02 10:30:00');
UPDATE INTERVENIR SET INT_DOMAINEINTER='DEV',INT_TYPEACTIVITE='Debug',INT_DATEFIN='2016/08/02 11:30:00' WHERE CHARGE_NUMLOT = 160101;
SELECT * FROM CDI10.INTERVENIR;
-----------------------------------------------------------------OK
/* LIBRETEXP */
INSERT INTO LIBRETEXP (RETEXP_LIBELLE) VALUES ('SGBD');
-- Section pouvant etre alimenté pour jeu d'essai !
SELECT * FROM CDI10.LIBRETEXP;
-----------------------------------------------------------------OK
/* COLLABORER */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO COLLABORER (PROJET_CODE,COL_MATRICULE,COLAB_DATE_INTEGRATION,COLAB_EVOLUTION_FONCTION,COLAB_CHEF_PROJET,COLAB_PARTICIPE_TOUJOURS) 
			   VALUES (1601,1601,'2016/08/01 00:00:00','Responsable Bureau Etudes',1,1);
UPDATE COLLABORER SET COLAB_PARTICIPE_TOUJOURS=0 WHERE COLAB_ID = 1;
SELECT * FROM CDI10.COLLABORER;
-----------------------------------------------------------------OK
/* RETOURSEXP */
SELECT * FROM CDI10.LIBRETEXP;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
INSERT INTO RETOURSEXP (CHARGE_NUMLOT,COLAB_ID,RETEXP_ID,EXP_DATETIME,EXP_DESCRIPTION) 
			   VALUES (160101,1601,1,'2016/08/01 05:00:00','ORACLE');
SELECT * FROM CDI10.RETOURSEXP;
-----------------------------------------------------------------OK
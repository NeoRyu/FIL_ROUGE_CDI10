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
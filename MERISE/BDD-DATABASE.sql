/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  03/08/2016 11:32:04                      */
/*==============================================================*/


alter table CLICOMMENTER
   drop constraint FK_CLICOMME_CLICOMMEN_COLLABOR;

alter table CLICOMMENTER
   drop constraint FK_CLICOMME_CLICOMMEN_CLIENTS;

alter table CLIDOMAINE
   drop constraint FK_CLIDOMAI_CLIDOMAIN_CLIENTS;

alter table CLIDOMAINE
   drop constraint FK_CLIDOMAI_CLIDOMAIN_LIBDOMAC;

alter table COLLABORATEURS
   drop constraint FK_COLLABOR_ACCUEILLI_COLLABOR;

alter table COLLABORER
   drop constraint FK_COLLABOR_COLLABORE_COLLABOR;

alter table COLLABORER
   drop constraint FK_COLLABOR_PARTICIPE_PROJETS;

alter table CONTACTS
   drop constraint FK_CONTACTS_CONTACTS_CLIENTS;

alter table CONTACTS
   drop constraint FK_CONTACTS_CONTACTS2_PROJETS;

alter table DOCUMENTS
   drop constraint FK_DOCUMENT_REDIGER_COLLABOR;

alter table ETAPES
   drop constraint FK_ETAPES_COMPOSER_PROJETS;

alter table ETAPES
   drop constraint FK_ETAPES_RELATION__LIBETAPE;

alter table INTERVENIR
   drop constraint FK_INTERVEN_APPELER_COLLABOR;

alter table INTERVENIR
   drop constraint FK_INTERVEN_CIBLER_ETAPES;

alter table INTERVENIR
   drop constraint FK_INTERVEN_RELATION__LIBFONCT;

alter table OCCUPERFONCTIONS
   drop constraint FK_OCCUPERF_OCCUPERFO_COLLABOR;

alter table OCCUPERFONCTIONS
   drop constraint FK_OCCUPERF_OCCUPERFO_LIBFONCT;

alter table PROCOMMENTER
   drop constraint FK_PROCOMME_PROCOMMEN_CLIENTS;

alter table PROCOMMENTER
   drop constraint FK_PROCOMME_PROCOMMEN_COLLABOR;

alter table PROCOMMENTER
   drop constraint FK_PROCOMME_PROCOMMEN_PROJETS;

alter table PROJETS
   drop constraint FK_PROJETS_RELATION__CLIENTS;

alter table REFERERDOC
   drop constraint FK_REFERERD_REFERERDO_DOCUMENT;

alter table REFERERDOC
   drop constraint FK_REFERERD_REFERERDO_PROJETS;

alter table RETOURSEXP
   drop constraint FK_RETOURSE_EXPCOL_COLLABOR;

alter table RETOURSEXP
   drop constraint FK_RETOURSE_EXPETA_ETAPES;

alter table RETOURSEXP
   drop constraint FK_RETOURSE_EXPLIB_LIBRETEX;

alter table SALAIRES
   drop constraint FK_SALAIRES_REMUNERER_COLLABOR;

alter table CLICOMMENTER
   drop primary key cascade;

drop table CLICOMMENTER cascade constraints;

alter table CLIDOMAINE
   drop primary key cascade;

drop table CLIDOMAINE cascade constraints;

alter table CLIENTS
   drop primary key cascade;

drop table CLIENTS cascade constraints;

drop index ACCUEILLIR_FK;

alter table COLLABORATEURS
   drop primary key cascade;

drop table COLLABORATEURS cascade constraints;

drop index PARTICIPER_FK;

drop index COLLABORER_FK;

alter table COLLABORER
   drop primary key cascade;

drop table COLLABORER cascade constraints;

alter table CONTACTS
   drop primary key cascade;

drop table CONTACTS cascade constraints;

drop index REDIGER_FK;

alter table DOCUMENTS
   drop primary key cascade;

drop table DOCUMENTS cascade constraints;

drop index COMPOSER_FK;

drop index RELATION_4_FK;

alter table ETAPES
   drop primary key cascade;

drop table ETAPES cascade constraints;

drop index CIBLER_FK;

drop index RELATION_10_FK;

drop index APPELER_FK;

alter table INTERVENIR
   drop primary key cascade;

drop table INTERVENIR cascade constraints;

alter table LIBDOMACTIVITES
   drop primary key cascade;

drop table LIBDOMACTIVITES cascade constraints;

alter table LIBETAPES
   drop primary key cascade;

drop table LIBETAPES cascade constraints;

alter table LIBFONCTIONS
   drop primary key cascade;

drop table LIBFONCTIONS cascade constraints;

alter table LIBRETEXP
   drop primary key cascade;

drop table LIBRETEXP cascade constraints;

alter table OCCUPERFONCTIONS
   drop primary key cascade;

drop table OCCUPERFONCTIONS cascade constraints;

alter table PROCOMMENTER
   drop primary key cascade;

drop table PROCOMMENTER cascade constraints;

drop index RELATION_1_FK;

alter table PROJETS
   drop primary key cascade;

drop table PROJETS cascade constraints;

alter table REFERERDOC
   drop primary key cascade;

drop table REFERERDOC cascade constraints;

alter table RETOURSEXP
   drop primary key cascade;

drop table RETOURSEXP cascade constraints;

drop index REMUNERER_FK;

alter table SALAIRES
   drop primary key cascade;

drop table SALAIRES cascade constraints;

drop sequence S_COLLABORATEURS;

drop sequence S_COLLABORER;

drop sequence S_DOCUMENTS;

drop sequence S_INTERVENIR;

drop sequence S_LIBDOMACTIVITES;

drop sequence S_LIBETAPES;

drop sequence S_LIBFONCTIONS;

drop sequence S_LIBRETEXP;

drop sequence S_RETOURSEXP;

drop sequence S_SALAIRES;

create sequence S_COLLABORATEURS;

create sequence S_COLLABORER;

create sequence S_DOCUMENTS;

create sequence S_INTERVENIR;

create sequence S_LIBDOMACTIVITES;

create sequence S_LIBETAPES;

create sequence S_LIBFONCTIONS;

create sequence S_LIBRETEXP;

create sequence S_RETOURSEXP;

create sequence S_SALAIRES;

/*==============================================================*/
/* Table : CLICOMMENTER                                         */
/*==============================================================*/
create table CLICOMMENTER 
(
   COL_MATRICULE        NUMBER(4)            not null,
   CLI_NUMCLIENT        NUMBER(4)            not null,
   COMCLI_COMCLIENT     VARCHAR2(100)        not null,
   COMCLI_DATETIME      DATE                 not null
);

comment on table CLICOMMENTER is
'Commentaires des commerciaux specifique aux clients';

alter table CLICOMMENTER
   add constraint PK_CLICOMMENTER primary key (COL_MATRICULE, CLI_NUMCLIENT);

/*==============================================================*/
/* Table : CLIDOMAINE                                           */
/*==============================================================*/
create table CLIDOMAINE 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   CLI_DOMAINEID        NUMBER(6)            not null
);

comment on table CLIDOMAINE is
'Repertorie les differents domaines d''activites pour chaque client';

alter table CLIDOMAINE
   add constraint PK_CLIDOMAINE primary key (CLI_NUMCLIENT, CLI_DOMAINEID);

/*==============================================================*/
/* Table : CLIENTS                                              */
/*==============================================================*/
create table CLIENTS 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   CLI_NOM              VARCHAR2(25)         not null,
   CLI_RAISONSOCIALE    VARCHAR2(100),
   CLI_TYPE             CHAR(2),
   CLI_ADRESSE          VARCHAR2(100),
   CLI_TELEPHONE        VARCHAR2(10),
   CLI_CHIFFREAFFAIRE   NUMBER(10),
   CLI_EFFECTIFS        NUMBER(7),
   CLI_NATURE           VARCHAR2(10)
);

comment on column CLIENTS.CLI_CHIFFREAFFAIRE is
'Exprimé en millier d''euros';

alter table CLIENTS
   add constraint PK_CLIENTS primary key (CLI_NUMCLIENT);

/*==============================================================*/
/* Table : COLLABORATEURS                                       */
/*==============================================================*/
create table COLLABORATEURS 
(
   COL_MATRICULE        NUMBER(4)            not null,
   COL_COL_MATRICULE    NUMBER(4),
   COL_SEXE             CHAR(1)              not null,
   COL_ETATCIVIL        CHAR(3)              not null,
   COL_NOM              VARCHAR2(20)         not null,
   COL_PRENOM           VARCHAR2(20)         not null,
   COL_DATENAISSANCE    DATE                 not null,
   COL_ADRESSE1         VARCHAR2(25)         not null,
   COL_ADRESSE2         VARCHAR2(25)         not null,
   COL_VILLE            VARCHAR2(10)         not null,
   COL_CP               VARCHAR2(5)          not null,
   COL_TELEPHONE        VARCHAR2(10)         not null,
   COL_STATUT           VARCHAR2(3)          not null,
   COL_ANCIENNETE       VARCHAR2(10),
   COL_CENTRESINTERETS  VARCHAR2(25)
);

alter table COLLABORATEURS
   add constraint PK_COLLABORATEURS primary key (COL_MATRICULE);

/*==============================================================*/
/* Index : ACCUEILLIR_FK                                        */
/*==============================================================*/
create index ACCUEILLIR_FK on COLLABORATEURS (
   COL_COL_MATRICULE ASC
);

/*==============================================================*/
/* Table : COLLABORER                                           */
/*==============================================================*/
create table COLLABORER 
(
   COLAB_ID             NUMBER(6)            not null,
   PROJET_CODE          NUMBER(4),
   COL_MATRICULE        NUMBER(4),
   COLAB_DATE_INTEGRATION DATE                 not null,
   COLAB_EVOLUTION_FONCTION VARCHAR2(15),
   COLAB_CHEF_PROJET    SMALLINT             not null,
   COLAB_PARTICIPE_TOUJOURS SMALLINT             not null
);

comment on column COLLABORER.COLAB_EVOLUTION_FONCTION is
'Le plan qualité de la société impose qu’un collaborateur n’interviendra jamais sur 2 projets simultanément et que des évolutions de fonctions sont nécessaires à leur évolution de carrière. Ils peuvent donc être amenés à titre d’essai à intervenir sur un projet avec une fonction n’étant pas encore la leur. Un collaborateur ne peut cumuler plusieurs fonctions en même temps.';

comment on column COLLABORER.COLAB_CHEF_PROJET is
'Un Developpeur, par Evolution de fonction, peux etre designé chef de projet. Dans ce cas, ce booleen lui permettra d''avoir les droits de faire des retours d''experiences sur le projet en question.';

comment on column COLLABORER.COLAB_PARTICIPE_TOUJOURS is
'Si TRUE : impossible d''attribuer un nouveau projet au collaborateur
Si FALSE : Le collaborateur ne travail plus sur ce projet
> Requete : select * where ''participe_tjs'' = true
> Algo :  if requete == null : collaborateur peux etre designe sur un projet';

alter table COLLABORER
   add constraint PK_COLLABORER primary key (COLAB_ID);

/*==============================================================*/
/* Index : COLLABORER_FK                                        */
/*==============================================================*/
create index COLLABORER_FK on COLLABORER (
   COL_MATRICULE ASC
);

/*==============================================================*/
/* Index : PARTICIPER_FK                                        */
/*==============================================================*/
create index PARTICIPER_FK on COLLABORER (
   PROJET_CODE ASC
);

/*==============================================================*/
/* Table : CONTACTS                                             */
/*==============================================================*/
create table CONTACTS 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   PROJET_CODE          NUMBER(4)            not null,
   CON_FONCTION         VARCHAR2(20)         not null,
   CON_NOM              VARCHAR2(20)         not null,
   CON_PRENOM           VARCHAR2(20),
   CON_DUREE            NUMBER(3,2)
);

alter table CONTACTS
   add constraint PK_CONTACTS primary key (CLI_NUMCLIENT, PROJET_CODE);

/*==============================================================*/
/* Table : DOCUMENTS                                            */
/*==============================================================*/
create table DOCUMENTS 
(
   DOC_ID               NUMBER(6)            not null,
   COL_MATRICULE        NUMBER(4),
   DOC_TITRE            VARCHAR2(100),
   DOC_RESUME           VARCHAR2(100),
   DOC_DATEDIFFUSION    DATE
);

comment on table DOCUMENTS is
'Documents associés au projet
> Rédigés par les collaborateurs internes';

alter table DOCUMENTS
   add constraint PK_DOCUMENTS primary key (DOC_ID);

/*==============================================================*/
/* Index : REDIGER_FK                                           */
/*==============================================================*/
create index REDIGER_FK on DOCUMENTS (
   COL_MATRICULE ASC
);

/*==============================================================*/
/* Table : ETAPES                                               */
/*==============================================================*/
create table ETAPES 
(
   CHARGE_NUMLOT        NUMBER(6)            not null,
   STEP_ID              NUMBER(6),
   PROJET_CODE          NUMBER(4),
   CHARGE_ESTIMEEINITIAL NUMBER(6)            not null,
   CHARGE_REELLESPROD   NUMBER(6),
   CHARGE_DATEDEBUT     DATE                 not null,
   CHARGE_DATEFIN       DATE,
   CHARGE_VALIDATION    NUMBER(6)
);

alter table ETAPES
   add constraint PK_ETAPES primary key (CHARGE_NUMLOT);

/*==============================================================*/
/* Index : RELATION_4_FK                                        */
/*==============================================================*/
create index RELATION_4_FK on ETAPES (
   STEP_ID ASC
);

/*==============================================================*/
/* Index : COMPOSER_FK                                          */
/*==============================================================*/
create index COMPOSER_FK on ETAPES (
   PROJET_CODE ASC
);

/*==============================================================*/
/* Table : INTERVENIR                                           */
/*==============================================================*/
create table INTERVENIR 
(
   INT_NUMINTERVENTION  NUMBER(6)            not null,
   FONCTION_ID          NUMBER(6),
   CHARGE_NUMLOT        NUMBER(6),
   COL_MATRICULE        NUMBER(4),
   INT_DOMAINEINTER     VARCHAR2(20),
   INT_TYPEACTIVITE     VARCHAR2(20),
   INT_DATEDEBUT        DATE                 not null,
   INT_DATEFIN          DATE,
   INT_DUREE            DATE
);

alter table INTERVENIR
   add constraint PK_INTERVENIR primary key (INT_NUMINTERVENTION);

/*==============================================================*/
/* Index : APPELER_FK                                           */
/*==============================================================*/
create index APPELER_FK on INTERVENIR (
   COL_MATRICULE ASC
);

/*==============================================================*/
/* Index : RELATION_10_FK                                       */
/*==============================================================*/
create index RELATION_10_FK on INTERVENIR (
   FONCTION_ID ASC
);

/*==============================================================*/
/* Index : CIBLER_FK                                            */
/*==============================================================*/
create index CIBLER_FK on INTERVENIR (
   CHARGE_NUMLOT ASC
);

/*==============================================================*/
/* Table : LIBDOMACTIVITES                                      */
/*==============================================================*/
create table LIBDOMACTIVITES 
(
   CLI_DOMAINEID        NUMBER(6)            not null,
   CLI_DOMAINEACTIVITE  VARCHAR2(100)        not null
);

comment on table LIBDOMACTIVITES is
'Libelle des domaines d''activités';

alter table LIBDOMACTIVITES
   add constraint PK_LIBDOMACTIVITES primary key (CLI_DOMAINEID);

/*==============================================================*/
/* Table : LIBETAPES                                            */
/*==============================================================*/
create table LIBETAPES 
(
   STEP_ID              NUMBER(6)            not null,
   STEP_LIBELLE         VARCHAR2(25)         not null
);

comment on table LIBETAPES is
'Activités ou étapes du processus :

analyse des besoins
Conception
Programmation
Tests unitaires
Tests d’intégration
Tests de recette et installation
Management du projet
Gestion de configuration
Formation spécifique au projet
Divers';

alter table LIBETAPES
   add constraint PK_LIBETAPES primary key (STEP_ID);

/*==============================================================*/
/* Table : LIBFONCTIONS                                         */
/*==============================================================*/
create table LIBFONCTIONS 
(
   FONCTION_ID          NUMBER(6)            not null,
   FONCTION_LIBELLE     VARCHAR2(15)         not null
);

comment on table LIBFONCTIONS is
'Type de fonctions que peuvent occuper les collaborateurs : 

*Fonctions :

Responsable de projet
Analyste responsable d’application
Développeur
Technicien support
Commercial
Technico-commercial
Secrétaire';

alter table LIBFONCTIONS
   add constraint PK_LIBFONCTIONS primary key (FONCTION_ID);

/*==============================================================*/
/* Table : LIBRETEXP                                            */
/*==============================================================*/
create table LIBRETEXP 
(
   RETEXP_ID            NUMBER(6)            not null,
   RETEXP_LIBELLE       VARCHAR2(25)         not null
);

comment on table LIBRETEXP is
'Llibelles permettant d''ajouter de nouvelles technologie en retour d''expreience.';

alter table LIBRETEXP
   add constraint PK_LIBRETEXP primary key (RETEXP_ID);

/*==============================================================*/
/* Table : OCCUPERFONCTIONS                                     */
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

comment on table OCCUPERFONCTIONS is
'Historique des fonctions occupées par un collaborateur';

alter table OCCUPERFONCTIONS
   add constraint PK_OCCUPERFONCTIONS primary key (COL_MATRICULE, FONCTION_ID);

/*==============================================================*/
/* Table : PROCOMMENTER                                         */
/*==============================================================*/
create table PROCOMMENTER 
(
   CLI_NUMCLIENT        NUMBER(4)            not null,
   COL_MATRICULE        NUMBER(4)            not null,
   PROJET_CODE          NUMBER(4)            not null,
   COMPRO_COMPROJET     VARCHAR2(100)        not null,
   COMPRO_DATETIME      DATE                 not null
);

comment on table PROCOMMENTER is
'Commentaires des commerciaux specifique au projet du client';

alter table PROCOMMENTER
   add constraint PK_PROCOMMENTER primary key (CLI_NUMCLIENT, COL_MATRICULE, PROJET_CODE);

/*==============================================================*/
/* Table : PROJETS                                              */
/*==============================================================*/
create table PROJETS 
(
   PROJET_CODE          NUMBER(4)            not null,
   CLI_NUMCLIENT        NUMBER(4),
   PROJET_LIBELLECOURT  VARCHAR2(10)         not null,
   PROJET_LIBELLELONG   VARCHAR2(50)         not null,
   PROJET_TYPE          CHAR(1)              not null,
   PROJET_CYCLEVIE      VARCHAR2(10)         not null,
   PROJET_SECTEURACTIVITE VARCHAR2(25)         not null,
   PROJET_DATEPREVUEDEBUT DATE                 not null,
   PROJET_DATEPREVUEFIN DATE                 not null,
   PROJET_DATEREELLEDEBUT DATE,
   PROJET_DATERELLEFIN  DATE,
   PROJET_NBRCOLLABMAX  NUMBER(3),
   PROJET_CHARGEGLOBALEESTIMEE NUMBER(5)            not null,
   PROJET_REMARQUEESTIMATION VARCHAR2(100),
   PROJET_THEMETECHNIQUE VARCHAR2(100)
);

comment on column PROJETS.PROJET_TYPE is
'Forfait / Assistance / Régie';

comment on column PROJETS.PROJET_CYCLEVIE is
'complet, etudes de l''existant, développement, ...';

comment on column PROJETS.PROJET_CHARGEGLOBALEESTIMEE is
'En heures';

alter table PROJETS
   add constraint PK_PROJETS primary key (PROJET_CODE);

/*==============================================================*/
/* Index : RELATION_1_FK                                        */
/*==============================================================*/
create index RELATION_1_FK on PROJETS (
   CLI_NUMCLIENT ASC
);

/*==============================================================*/
/* Table : REFERERDOC                                           */
/*==============================================================*/
create table REFERERDOC 
(
   DOC_ID               NUMBER(6)            not null,
   PROJET_CODE          NUMBER(4)            not null
);

alter table REFERERDOC
   add constraint PK_REFERERDOC primary key (DOC_ID, PROJET_CODE);

/*==============================================================*/
/* Table : RETOURSEXP                                           */
/*==============================================================*/
create table RETOURSEXP 
(
   EXP_ID               NUMBER(20)           not null,
   CHARGE_NUMLOT        NUMBER(6),
   COLAB_ID             NUMBER(6),
   RETEXP_ID            NUMBER(6),
   EXP_DATETIME         DATE                 not null,
   EXP_DESCRIPTION      VARCHAR2(250)        not null
);

comment on column RETOURSEXP.EXP_DATETIME is
'Permet de faire plusieurs entrées dans la BDD pour une meme etape d''un projet';

alter table RETOURSEXP
   add constraint PK_RETOURSEXP primary key (EXP_ID);

/*==============================================================*/
/* Table : SALAIRES                                             */
/*==============================================================*/
create table SALAIRES 
(
   SALAIRE_ID           NUMBER(6)            not null,
   COL_MATRICULE        NUMBER(4),
   SALAIRE_MENSUEL      NUMBER(7,2)          not null,
   SALAIRE_DATE         DATE                 not null
);

comment on table SALAIRES is
'Historisation de chaque fiche de salaire.

Un trigger servira a verifier si l''augmentation ne depasse pas :
 - le salaire de base indiqué dans le contrat ( OCCUPER_FONCTIONS )
 - majoré d''un pourcentage defini par l''entreprise ( ici 20% )';

alter table SALAIRES
   add constraint PK_SALAIRES primary key (SALAIRE_ID);

/*==============================================================*/
/* Index : REMUNERER_FK                                         */
/*==============================================================*/
create index REMUNERER_FK on SALAIRES (
   COL_MATRICULE ASC
);

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
   add constraint FK_RETOURSE_EXPCOL_COLLABOR foreign key (COLAB_ID)
      references COLLABORER (COLAB_ID);

alter table RETOURSEXP
   add constraint FK_RETOURSE_EXPETA_ETAPES foreign key (CHARGE_NUMLOT)
      references ETAPES (CHARGE_NUMLOT);

alter table RETOURSEXP
   add constraint FK_RETOURSE_EXPLIB_LIBRETEX foreign key (RETEXP_ID)
      references LIBRETEXP (RETEXP_ID);

alter table SALAIRES
   add constraint FK_SALAIRES_REMUNERER_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);


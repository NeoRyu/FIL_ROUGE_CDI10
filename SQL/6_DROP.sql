/*==============================================================*/
/* DESTRUCTION DE LA BDD                                       */
/*==============================================================*/
/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  26/07/2016 16:37:46                      */
/*==============================================================*/

/* http://stackoverflow.com/questions/15630771/check-table-exist-or-not-before-create-it-in-oracle */


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
   drop constraint FK_RETOURSE_RETOURSEX_ETAPES;

alter table RETOURSEXP
   drop constraint FK_RETOURSE_RETOURSEX_COLLABOR;

alter table RETOURSEXP
   drop constraint FK_RETOURSE_RETOURSEX_LIBRETEX;

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

drop sequence S_SALAIRES;

drop sequence S_CLIENTS;

drop sequence S_PROJETS;

drop sequence S_ETAPES;

drop sequence S_RETOURSEXP;

----

DROP PROCEDURE ChefProjet_Attribuer;

DROP PROCEDURE ChefProjet_Retirer;

--

DROP VIEW VUE_PROFESSION;


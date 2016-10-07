-- C:\Users\User> TASKKILL /IM sqldeveloper64W.exe /F /T

/* SALAIRES */
-- DROP
alter table SALAIRES drop constraint FK_SALAIRES_REMUNERER_COLLABOR;
drop sequence S_SALAIRES;
alter table SALAIRES drop primary key cascade;
drop table SALAIRES cascade constraints;
drop trigger TRIGGER_SALAIRES;

-- CREATE TABLE
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
alter table SALAIRES
   add constraint FK_SALAIRES_REMUNERER_COLLABOR foreign key (COL_MATRICULE)
      references COLLABORATEURS (COL_MATRICULE);

-- SEQUENCE	  
create sequence S_SALAIRES;
-- TRIGGER
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
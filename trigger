CREATE DATABASE trigerE
use trigerE
--tabel linnad
create table linnad(
linnId int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null);
--tabel logi
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT);

--Insert Triger
Create TRIGGER linnaLisamine
on linnad
for insert
As
insert into logi(kuupaev, andmed)
Select
getdate(), inserted.linnanimi
from inserted;
--kontrllimiseks tuleb lisada uus linn tabelisse
insert into linnad (linnanimi, rahvaarv)
values('Narva', 50000);
Select * from linnad;
Select * from logi;

--kustutame triger
drop trigger linnaLisamine;

Create TRIGGER linnaLisamine
on linnad
for insert
As
insert into logi(kuupaev, andmed)
Select
getdate(),
CONCAT ('lisarud linn: ', inserted.linnanimi,
' | rahvaarv: ', inserted.rahvaarv, ' id: ', inserted.linnId)
from inserted;

--delete trigger
Create TRIGGER linnakustutamine
on linnad
for delete
As
insert into logi(kuupaev, andmed)
Select
getdate(),
CONCAT ('kustutatud linn: ', deleted.linnanimi,
' | rahvaarv: ', deleted.rahvaarv, ' id: ', deleted.linnId)
from deleted ;

delete from linnad where linnId=1;
Select * from linnad;
Select * from logi;

--UPDATE TRIGGER
CREATE TRIGGER linnaUuendamine
on linnad
For update
as
insert into logi(kuupaev, andmed)
select
GETDATE(),
CONCAT (' vana linna andmed: ', d.linnanimi,
' | ', d.rahvaarv, ' | id: ', d.linnId,
' vana linna andmed: ', i.linnanimi,
' | ', i.rahvaarv, ' | id: ', i.linnId)
from deleted  d inner join inserted i
on d.linnId=i.linnId

--kontrollimiseks uuendame linna andmed
select * from linnad
UPDATE linnad Set linnanimi = 'Tapa uus', rahvaarv= 25
Where linnId=2;
select * from linnad;
select * from logi;

--lisame kasutajanimi logi tabelisse

Alter table logi add kasutaja varchar(40);
--INSERT, DELETE Trigger
Create TRIGGER linnaLisamineKustutamine
on linnad
for insert, DELETE
As
begin
SET NOCOUNT ON;
insert into logi(kuupaev, andmed, kasutaja)
Select
getdate(),
CONCAT ('lisarud linn: ', inserted.linnanimi,
' | rahvaarv: ', inserted.rahvaarv, ' id: ', inserted.linnId),
SYSTEM_USER
from inserted

UNION ALL

SELECT
getdate(),
CONCAT ('kustutatud linn: ', deleted.linnanimi,
' | rahvaarv: ', deleted.rahvaarv, ' id: ', deleted.linnId),
SYSTEM_USER
from deleted ;


end;

DiSABle TRIGGER linnaLisamine on linnad;
DISABLE TRIGGER linnaLkustutamine ON linnad;

insert into linnad (linnanimi, rahvaarv)
values('Paldiski', 50000);

Delete from linnad Where linnId=5
select * from linnad
Select * from logi

CREATE TABLE maakond(
maakondId int primary key identity (1,1),
maakondNimi varchar (25) UNIQUE);

--Foreign key tables
ALTER TABLE linnad ADD maakondId int;
Select * from linnad 
Alter table linnad ADD CONSTRAINT fk_maakond
Foreign key (maakondId) References maakond(maakondId);

INSERT INTO maakond
VALUES ('Harjumaa'),('Pärnumaa'),('Virumaa');

SELECT * from maakond;
INSERT INTO linnad(linnanimi,rahvaarv, maakondID)
Values ('Tallinn', 60000, 1), ('Rakvere', 15000, 3);

SELECT * from linnad, maakond
WHERE linnad.maakondId=maakond.maakondId;
--sama päring inner joiniga 
SELECT * from linnad inner join maakond
ON linnad.maakondId=maakond.maakondId;

--trigger , mis jälgib kaks seostatud tabelit 
Create TRIGGER c
on linnad
for insert
As
insert into logi(kuupaev, andmed, kasutaja)
Select
getdate(),
CONCAT ('lisatud linn: ', inserted.linnanimi, ', ', inserted.rahvaarv, ', ', m.maakondNimi),
System_User
from inserted inner join maakond m
ON inserted.maakondId=m.maakondId;

insert into linnad (linnanimi,rahvaarv,maakondId)
VALUES ('pärnu', 10000, 2)

select * from logi;
select * from linnad;

--trigger mis jälgib andmeye kustutamine seotud tabelitte põhjal
Create TRIGGER linnaLisaminekustutamine2
on linnad
for insert
As
insert into logi(kuupaev, andmed, kasutaja)
Select
getdate(),
CONCAT ('kustutatud linn:', deleted.linnanimi, ', ', deleted.rahvaarv, ', ', m.maakondNimi),
System_User
from deleted inner join maakond m
ON deleted.maakondId=m.maakondId;

DELETE FROM linnad where linnId=1;

select * from logi;



--trigger, mis jälgib andmete uuendamine kahes tabelis
Create TRIGGER linnaUuendamine2
on linnad
for UPDATE
As
insert into logi(kuupaev, andmed, kasutaja)
Select
getdate(),
CONCAT ('vana linna andmed: ', deleted.linnanimi, ', ', deleted.rahvaarv, ', ', m1.maakondNimi,
' ||uue linna andmed: ', inserted.linnaNimi, ', ', inserted.rahvaarv, ', ', m2.maakondNimi),
System_User
from deleted 
inner join inserted on deleted.linnId=inserted.linnId
inner join maakond m1 on deleted.maakondId=m1.maakondId
inner join maakond m2 ON inserted.maakondId=m2.maakondId;


select * from linnad
select * from maakond

UPdatE linnad set maakondId=1 where linnId=5;

select * from logi;

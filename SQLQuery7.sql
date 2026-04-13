CREATE DATABASE AUTOSMS
USE AUTOSMS

CREATE TABLE auto(
autoId int primary key identity (1,1),
autoNr int,
omanik varchar(30),
mark varchar(30),
aasta date);
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT,
kasutaja varchar(40));

--Lisamine Triger
CREATE TRIGGER AutoLisamine
ON auto
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT('Lisatud autoNr: ', inserted.autoNr,' | omanik: ', inserted.omanik,
' | mark: ', inserted.mark,' | aasta: ', inserted.aasta,' | id: ', inserted.autoId),
    SYSTEM_USER
FROM inserted;

INSERT INTO auto (autoNr, omanik, mark, aasta)
VALUES 
(12345, 'Ivan Ivanov', 'Toyota', '2018-05-10'),
(67890, 'Maria Petrova', 'BMW', '2020-03-15'),
(54321, 'John Smith', 'Audi', '2017-11-20'),
(98765, 'Anna Kovalenko', 'Mercedes', '2022-07-01');

SELECT * FROM auto;
SELECT * FROM logi;

--kustutamine triger
CREATE TRIGGER autoKustutamine
ON auto
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT('Kustutatud autoNr: ', deleted.autoNr,' | omanik: ', deleted.omanik,
' | mark: ', deleted.mark,' | aasta: ', deleted.aasta,' | id: ', deleted.autoId),
    SYSTEM_USER
FROM deleted;

DELETE FROM auto WHERE autoId = 1;
SELECT * FROM auto;
SELECT * FROM logi;

CREATE TRIGGER autoUuendamine
ON auto
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT('Vana andmed -> autoNr: ', d.autoNr,' | omanik: ', d.omanik,
' | mark: ', d.mark,' | aasta: ', d.aasta,' | id: ', d.autoId,
' || Uued andmed -> autoNr: ', i.autoNr,' | omanik: ', i.omanik,' | mark: ', i.mark,
' | aasta: ', i.aasta,' | id: ', i.autoId),
    SYSTEM_USER
FROM deleted d
INNER JOIN inserted i ON d.autoId = i.autoId;

UPDATE auto
SET mark = 'Tesla', aasta = '2023-01-01'
WHERE autoId = 2;

SELECT * FROM auto;
SELECT * FROM logi;
CREATE DATABASE SamsonovTel
use SamsonovTel

CREATE TABLE telefon(
telefonID INT PRIMARY KEY,
tootaja VARCHAR(50) not null,
telefonMudel VARCHAR (50),
hind money,
v_aasta int,
oSystem VARCHAR(10)
);

select * from telefon

ALTER TABLE telefon ALTER COLUMN oSystem varchar(30);

insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (1, 'Spice', 'Spice M-6900 Knight', 49.99, 2011, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (2, 'Sony', 'Sony Ericsson T68i', 99.99, 2002, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (3, 'Sharp', 'Sharp Aquos SH80F', 4.99, 2011, 'Android 2.3');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (4, 'Samsung', 'Samsung D900', 15.99, 2006, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (5, 'Spice', 'Spice M-4262', 29.99, 2011, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (6, 'BLU', 'BLU Vivo 4.65 HD', 39.99, 2013, 'Android 4.0');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (7, 'Motorola', 'Motorola T720i', 39.99, 2002, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (8, 'Huawei', 'Huawei Y9s', 35, 2019, 'Android 9.0, EMUI 9.1');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (9, 'verykool', 'verykool s5014 Atlas', 9.99, 2015, 'Android 4.4.2');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (10, 'Gionee', 'Gionee Pioneer P5L', 2.99, 2014, 'Android 5.1, Amigo 3.1');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (11, 'BLU', 'BLU Neo XL', 19.99, 2016, 'Android 5.1');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (12, 'Xiaomi', 'Xiaomi Mi 9 SE', 24.99, 2019, 'Android 9.0, up to Android 11, MIUI 12.5');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (13, 'Nokia', 'Nokia C6', 24.99, 2010, 'Symbian 9.4, Series 60 rel. 5');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (14, 'Vodafone', 'Vodafone 858 Smart', 3.79, 2011, 'Android 2.2');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (15, 'Huawei', 'Huawei nova 6 SE', 49.99, 2019, 'Android 10, EMUI 10, no Google Play Services');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (16, 'Samsung', 'Samsung A697 Sunburst', 89.99, 2010, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (17, 'BLU', 'BLU Grand M2', 1.99, 2017, 'Android 7.0');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (18, 'Lava', 'Lava A72', 59.99, 2016, 'Android 5.1, up to 6.0');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (19, 'Modu', 'Modu T', 5.99, 2010, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (20, 'vivo', 'vivo X50 Pro+', 3.99, 2020, 'Android 10, Funtouch 10.5');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (21, 'Vodafone', 'Vodafone Smart V8', 4.29, 2017, 'Android 7.1.1');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (22, 'Plum', 'Plum Glow', 2.49, 2013, 'Android 2.3.5');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (23, 'alcatel', 'alcatel OT-117', 8.49, 2011, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (24, 'Samsung', 'Samsung L600', 34.99, 2007, 'Feature phone');
insert into telefon (telefonid, tootaja, telefonmudel, hind, v_aasta, oSystem) values (25, 'Vertu', 'Vertu Constellation Quest', 59.99, 2010, 'Symbian OS');

--Select Kuvab ainult 2 veergu tabelist
SELECT  tootaja, telefonMudel from telefon;

SELECT  tootaja, telefonMudel AS mudel FROM telefon;
--sorteerimine 
--ASC kasvavas järjekorras

SELECT tootaja, telefonMudel AS mudel, hind
FROM telefon
ORDER BY hind;


--DESC kahanevas järjekorras
SELECT tootaja, telefonMudel AS mudel, hind
FROM telefon
ORDER BY hind DESC;

--võrdlemine >, <, =, >=, <=
SELECT telefonMudel, hind
FROM telefon
WHERE hind >35; -- leiab mudelid hinnaga suurem kui 25

--leia mudeli vahemuks 10-25 euro
SELECT telefonMudel, hind
FROM telefon
WHERE hind BETWEEN 10 and 25
ORDER BY hind;

--sama päring ilma between
SELECT telefonMudel, hind
FROM telefon
WHERE hind >=10 AND hind<=25
ORDER BY hind;

--distinct ?! näitab ainult üks kordus
SELECT DISTINCT oSystem FROM telefon;

--võrdlemine tekstiga LIKE
SELECT tootaja, telefonMudel 
FROM telefon
WHERE tootaja LIKE 'Sony';

--IN kuvab vastavus loetelus - соответстиве перечислению
SELECT tootaja, telefonMudel 
FROM telefon
WHERE tootaja IN ('Sony', 'Samsung', 'Apple');

--sama päring ilma IN
SELECT tootaja, telefonMudel 
FROM telefon
WHERE tootaja like 'Sony' OR tootaja LIKE 'Samsung' OR tootaja LIKE 'Apple';

--leia mudelid mis algavad S tähega
--% tähendab üks kõik üalju sümbolit
SELECT tootaja, telefonMudel 
FROM telefon
WHERE telefonMudel LIKE 'S%';
--sisaldab s täht '%s%';


--agregaat-funktsioonid: AVG, MAX, MIN, SUM, COUNT
--keskmine väljastamise aasta
SELECT AVG(v_aasta) AS 'keskmine Aasta'
FROM telefon;

--telefonide üldkogus
SELECT COUNT (*) AS 'üldkogus'
FROM telefon;
--keeruline variant funktsiooniga
--telefonide üldkogus iga tootaja kohta
SELECT tootaja, COUNT (*) AS 'üldkogus'
FROM telefon
GROUP BY tootaja;

--top 6
SELECT TOP 6 tootaja, hind
FROM telefon
ORDER BY hind DESC
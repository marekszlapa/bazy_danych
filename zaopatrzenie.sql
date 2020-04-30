CREATE SCHEMA zaopatrzenie;

CREATE TABLE zaopatrzenie.Miejscowosci(
	KodPocztowy VARCHAR(6) NOT NULL PRIMARY KEY,
	Miasto VARCHAR(30)
);

CREATE TABLE zaopatrzenie.Dostawcy(
	Dostawca VARCHAR(40) NOT NULL PRIMARY KEY,
	Ulica VARCHAR(40),
	NumerBudynku VARCHAR(5),
	NumerMieszkania VARCHAR(5),
	KodPocztowy VARCHAR(6),
	FOREIGN KEY (KodPocztowy) REFERENCES zaopatrzenie.Miejscowosci(KodPocztowy)
);
	
CREATE TABLE zaopatrzenie.Produkty(
	NazwaProduktu VARCHAR(30) NOT NULL PRIMARY KEY,
	CenaNetto MONEY,
	CenaBrutto MONEY
);

CREATE TABLE zaopatrzenie.Dostawy(
	ID INT NOT NULL PRIMARY KEY,
	Dostawca VARCHAR(40),
	NazwaProduktu VARCHAR(30),
	FOREIGN KEY (Dostawca) REFERENCES zaopatrzenie.Dostawcy(Dostawca),
	FOREIGN KEY (NazwaProduktu) REFERENCES zaopatrzenie.Produkty(NazwaProduktu)
);

INSERT INTO zaopatrzenie.Miejscowosci VALUES
('31-435','Kraków'),
('31-342','Kraków'),
('04-242','Lublin'),
('30-243','Tarnów'),
('35-434','Nowy Targ');

--SELECT * FROM zaopatrzenie.Miejscowosci;

INSERT INTO zaopatrzenie.Dostawcy VALUES
('Makarony Polskie','Turystyczna','40','','31-435'),
('Polskie przetwory','Wojska Polskiego','44a','','31-342'),
('Lubelski Makaron','Piłsudskiego','332a','','04-242'),
('Przetwory pomidorowe','Rolnicza','22','4','30-243'),
('Małopolskie smaki','Mickiewicza','223','77','35-434');

--SELECT * FROM zaopatrzenie.Dostawcy;

INSERT INTO zaopatrzenie.Produkty VALUES
('Makaron Nitki','130','150'),
('Keczup pikantny','200','220'),
('Sos pomidorowy','89','110');

--SELECT * FROM zaopatrzenie.Produkty;

INSERT INTO zaopatrzenie.Dostawy VALUES
(1,'Makarony Polskie','Makaron Nitki'),
(2,'Polskie przetwory','Keczup pikantny'),
(3,'Polskie przetwory','Sos pomidorowy'),
(4,'Lubelski Makaron','Makaron Nitki'),
(5,'Przetwory pomidorowe','Keczup pikantny'),
(6,'Małopolskie smaki','Sos pomidorowy');

--SELECT * FROM zaopatrzenie.Dostawy;
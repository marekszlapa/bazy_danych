--firma
CREATE DATABASE BD1;
CREATE SCHEMA FIRMA;

--pracownicy
CREATE TABLE firma.pracownicy(
	id_pracownika INT PRIMARY KEY NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	imie VARCHAR(50) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon VARCHAR(12)
);

--godziny
CREATE TABLE firma.godziny(
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL
);

--pensje
CREATE TABLE firma.pensje(
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(50),
	kwota MONEY NOT NULL,
	id_premii INT NOT NULL
);

--premie
CREATE TABLE firma.premie(
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(50),
	kwota MONEY NOT NULL
);

--ALTER TABLE godziny
ALTER TABLE firma.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES firma.pracownicy(id_pracownika);

--ALTER TABLE pensje
ALTER TABLE firma.pensje
ADD FOREIGN KEY (id_premii) REFERENCES firma.premie(id_premii);

--insert to pracownicy
INSERT INTO firma.pracownicy
VALUES(1,'Jan','Kowalski','Bielsko-Biała ul. Kościelna 8','+48241366012');
INSERT INTO firma.pracownicy
VALUES(2,'Jakub','Nowak','Bielsko-Biała ul. Rybia 2','+48711710254');
INSERT INTO firma.pracownicy
VALUES(3,'Mikołaj','Kozak','Bielsko-Biała ul. Chrobrego 13','+48499492247');
INSERT INTO firma.pracownicy
VALUES(4,'Dariusz','Knut','Bielsko-Biała ul. Wrocławska 69','+48126481212');
INSERT INTO firma.pracownicy
VALUES(5,'Robert','Wachowicz','Bielsko-Biała ul. Kwiatowa 23','+48852033774');
INSERT INTO firma.pracownicy
VALUES(6,'Angelika','Bułka','Bielsko-Biała ul. Wiejska 2','+48304161023');
INSERT INTO firma.pracownicy
VALUES(7,'Tadeusz','Knot','Bielsko-Biała ul. Nocna 12','+48797017934');
INSERT INTO firma.pracownicy
VALUES(8,'Marek','Wąski','Bielsko-Biała ul. Czarnowiejska 13','+48683751721');
INSERT INTO firma.pracownicy
VALUES(9,'Dawid','Mreński','Bielsko-Biała ul. Skośna 43','+48280947791');
INSERT INTO firma.pracownicy
VALUES(10,'Karol','Pudzianowski','Bielsko-Biała ul. Wielka 23','+48750048694');

--insert to godziny
INSERT INTO firma.godziny
VALUES(1,'2020-02-21',6,1);
INSERT INTO firma.godziny
VALUES(2,'2020-02-22',6,1);
INSERT INTO firma.godziny
VALUES(3,'2020-02-23',8,1);
INSERT INTO firma.godziny
VALUES(4,'2020-02-24',8,1);
INSERT INTO firma.godziny
VALUES(5,'2020-02-25',4,1);
INSERT INTO firma.godziny
VALUES(6,'2020-02-21',12,7);
INSERT INTO firma.godziny
VALUES(7,'2020-02-22',2,7);
INSERT INTO firma.godziny
VALUES(8,'2020-02-23',2,7);
INSERT INTO firma.godziny
VALUES(9,'2020-02-24',6,7);
INSERT INTO firma.godziny
VALUES(10,'2020-02-25',8,7);

--insert to premie
INSERT INTO firma.premie
VALUES(1,'Brak',0.00);
INSERT INTO firma.premie
VALUES(2,'Motywacyjna',200.00);
INSERT INTO firma.premie
VALUES(3,'Dodatkowe obowiązki',150.00);
INSERT INTO firma.premie
VALUES(4,'Osiągnięcia',120.00);
INSERT INTO firma.premie
VALUES(5,'Innowacja',500.00);
INSERT INTO firma.premie
VALUES(6,'Pomoc współpracownikom',150.00);
INSERT INTO firma.premie
VALUES(7,'Narażenie życia',800.00);
INSERT INTO firma.premie
VALUES(8,'Owocna współpraca',125.00);
INSERT INTO firma.premie
VALUES(9,'Wyjątkowe osiągnięcia',240.00);
INSERT INTO firma.premie
VALUES(10,'Praca w weekendy',400.00);

--insert to pensje
INSERT INTO firma.pensje
VALUES(1,'Dyrektor',8000.00,1);
INSERT INTO firma.pensje
VALUES(2,'Wicedyrektor',6500.00,1);
INSERT INTO firma.pensje
VALUES(3,'Nauczyciel z wychowawstwem',5000.00,3);
INSERT INTO firma.pensje
VALUES(4,'Nauczyciel',4000.00,2);
INSERT INTO firma.pensje
VALUES(5,'Sprzątaczka',2500.00,6);
INSERT INTO firma.pensje
VALUES(6,'Woźny',2200.00,6);
INSERT INTO firma.pensje
VALUES(7,'Kucharka',2700.00,10);
INSERT INTO firma.pensje
VALUES(8,'Konserwator',3200.00,3);
INSERT INTO firma.pensje
VALUES(9,'Pielęgniarka szkolna',1500.00,2);
INSERT INTO firma.pensje
VALUES(10,'Sekretarka',3400.00,3);


--SELECT * FROM firma.name;
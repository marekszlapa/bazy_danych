CREATE SCHEMA stomatologia;

CREATE TABLE stomatologia.Pracownicy(
	IDPracownika VARCHAR(6) NOT NULL PRIMARY KEY,
	Imie VARCHAR(25) NOT NULL,
	Nazwisko VARCHAR(40) NOT NULL
);

CREATE TABLE stomatologia.Pacjenci(
	IDPacjenta VARCHAR(6) NOT NULL PRIMARY KEY,
	Imie VARCHAR(25) NOT NULL,
	Nazwisko VARCHAR(40) NOT NULL
);

CREATE TABLE stomatologia.Zabiegi(
	IDZabiegu VARCHAR(4) NOT NULL PRIMARY KEY,
	NazwaZabiegu VARCHAR(35)
);

CREATE TABLE stomatologia.Wizyty(
	DataWizyty DATE NOT NULL,
	GodzinaWizyty TIME NOT NULL,
	IDPacjenta VARCHAR(6),
	IDZabiegu VARCHAR(4),
	IDPracownika VARCHAR(6),
	PRIMARY KEY (DataWizyty, GodzinaWizyty)
	FOREIGN KEY (IDPacjenta) REFERENCES stomatologia.Pacjenci(IDPacjenta),
	FOREIGN KEY (IDZabiegu) REFERENCES stomatologia.Zabiegi(IDZabiegu),
	FOREIGN KEY (IDPracownika) REFERENCES stomatologia.Pracownicy(IDPracownika),
);

INSERT INTO stomatologia.Pracownicy VALUES
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1034','Marek','Potocki'),
('S1045','Anna','Jabłońska');

--SELECT * FROM stomatologia.Pracownicy

INSERT INTO stomatologia.Pacjenci VALUES
('P100','Anna','Jeleń'),
('P105','Jarosław','Nicpoń'),
('P108','Joanna','Nosek'),
('P120','Jan','Kałuża'),
('P123','Olga','Nowacka'),
('P130','Jerzy','Lis');

--SELECT * FROM stomatologia.Pacjenci

INSERT INTO stomatologia.Zabiegi VALUES
('Z496','Lakowanie'),
('Z500','Borowanie'),
('Z503','Usuwanie kamienia');

--SELECT * FROM stomatologia.Zabiegi

INSERT INTO stomatologia.Wizyty VALUES
('2020-03-12','10:00','P100','Z500','S1011'),
('2020-03-12','13:00','P105','Z496','S1011'),
('2020-03-12','15:00','P123','Z503','S1034'),
('2020-03-14','10:00','P108','Z500','S1011'),
('2020-03-16','17:00','P108','Z503','S1024'),
('2020-03-18','09:00','P120','Z500','S1045'),
('2020-03-20','08:00','P130','Z496','S1034');

--SELECT * FROM stomatologia.Wizyty
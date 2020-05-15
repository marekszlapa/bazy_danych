--1.
--CREATE DATABASE firma;
--2.
CREATE SCHEMA ksiegowosc;
--3.
CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika VARCHAR(6) PRIMARY KEY NOT NULL,
	imie VARCHAR(25),
	nazwisko VARCHAR(40) NOT NULL,
	adres VARCHAR(90) NOT NULL,
	telefon VARCHAR(12)
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Lista pracownikow';

CREATE TABLE ksiegowosc.godziny(
	id_godziny VARCHAR(3) PRIMARY KEY NOT NULL,
	data DATE,
	liczba_godzin SMALLINT,
	id_pracownika VARCHAR(6) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Godziny';

CREATE TABLE ksiegowosc.pensja(
	id_pensji VARCHAR(3) PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(40),
	kwota MONEY NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensja IS 'Pensje';

CREATE TABLE ksiegowosc.premia(
	id_premii VARCHAR(3) PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(40),
	kwota MONEY NOT NULL
);
COMMENT ON TABLE ksiegowosc.premia IS 'Premie';

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INT PRIMARY KEY NOT NULL,
	data DATE,
	id_pracownika VARCHAR(6) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny VARCHAR(3) REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji VARCHAR(3) REFERENCES ksiegowosc.pensja(id_pensji),
	id_premii VARCHAR(3) REFERENCES ksiegowosc.premia(id_premii)
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Wynagrodzenia pracownikow';

--4.
INSERT INTO ksiegowosc.pracownicy VALUES 
('e176','Aleksandra','Wróblewska','Kraków ul. Wrocławska 273','+48576846574'),
('e2234','Ignacy','Dębski','Kraków ul. Machośska 42','+48194362547'),
('e3352','Melania','Pawłowska','Kraków ul. Kopia 32','+48928374617'),
('e4432','Anna','Nowak','Kraków ul. Jutrzenki 232','+48483950382'),
('e532','Stanisław','Witkowski','Kraków ul. Pawia 76','+48576849382'),
('e64','Kinga','Morawska','Kraków ul. Solecka 65','+48574620578'),
('e753','Grzegorz','Włodarczyk','Kraków ul. Sądecka 43','+48928563746'),
('e8234','Oliwia','Wrona','Kraków ul. Świeta 82','+48819364758'),
('e954','Joanna','Wiśniewska','Kraków ul. Bernarda 254','+48113432657'),
('e10567','Alan','Wróbel','Kraków ul. Chrobrego 743','+48678445234');

--SELECT * FROM ksiegowosc.pracownicy;

INSERT INTO ksiegowosc.godziny VALUES 
('h01','2020-05-10',99,'e176'),
('h02','2020-05-11',170,'e2234'),
('h03','2020-05-12',185,'e3352'),
('h04','2020-05-13',152,'e4432'),
('h05','2020-05-14',142,'e532'),
('h06','2020-05-15',121,'e64'),
('h07','2020-05-16',99,'e753'),
('h08','2020-05-18',85,'e8234'),
('h09','2020-05-19',167,'e954'),
('h10','2020-05-20',151,'e10567');

--SELECT * FROM ksiegowosc.godziny;

INSERT INTO ksiegowosc.pensja VALUES 
('p01','Dyrektor',8000),
('p02','Doradca',4200),
('p03','Dyrektor finansów',6000),
('p04','Urzędnik',3300),
('p05','Sekretarka',2800),
('p06','Sprzątaczka',900),
('p07','Kucharka',2500),
('p08','Kierownik',3000),
('p09','Kierownik',4500),
('p10','Stażysta',800);

--SELECT * FROM ksiegowosc.pensja;

INSERT INTO ksiegowosc.premia VALUES 
('b01','Brak',0),
('b02','Motywacyjna',500),
('b03','Za osiągnięcia',800),
('b04','Za innowacja',1100),
('b05','Za narażenie życia',1500),
('b06','Za wyjątkowe osiągnięcia',600),
('b07','Za pracę w weekendy',450),
('b08','Jubileuszowa',150),
('b09','Za pochwały',100),
('b10','Za nadgodziny',250);

--SELECT * FROM ksiegowosc.premia;

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(1,'2020-05-10','e176','h01','p01','b01'),
(2,'2020-05-11','e2234','h02','p02','b02'),
(3,'2020-05-14','e3352','h03','p03','b10'),
(4,'2020-05-10','e4432','h04','p04','b07'),
(5,'2020-05-18','e532','h05','p04','b04'),
(6,'2020-05-17','e64','h06','p05','b02'),
(7,'2020-05-14','e753','h07','p09','b01'),
(8,'2020-05-13','e8234','h08','p10','b01'),
(9,'2020-05-16','e954','h09','p10','b01'),
(10,'2020-05-12','e10567','h10','p10','b01');

--SELECT * FROM ksiegowosc.wynagrodzenie;

--5.
--a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--b
SELECT wy.id_pracownika FROM ksiegowosc.wynagrodzenie wy, ksiegowosc.pensja pe 
WHERE pe.id_pensji = wy.id_pensji AND pe.kwota > MONEY(1000);
--c
SELECT wy.id_pracownika FROM ksiegowosc.wynagrodzenie wy, ksiegowosc.pensja pe, ksiegowosc.premia pr
WHERE pe.id_pensji = wy.id_pensji AND pr.id_premii = wy.id_premii AND pr.kwota = MONEY(0) AND pe.kwota > MONEY(2000);
--d
SELECT * FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
--e
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';
--f
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.pracownicy pr, ksiegowosc.godziny god
WHERE pr.id_pracownika = god.id_pracownika AND liczba_godzin > 160;
--g
SELECT imie, nazwisko FROM ksiegowosc.pracownicy pr, ksiegowosc.pensja pe, ksiegowosc.wynagrodzenie wy
WHERE wy.id_pracownika = pr.id_pracownika AND wy.id_pensji = pe.id_pensji AND pe.kwota >= MONEY(1500) AND pe.kwota <= MONEY(3000);
--h
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.pracownicy pra, ksiegowosc.godziny god, ksiegowosc.premia pr, ksiegowosc.wynagrodzenie wy
WHERE wy.id_pracownika = pra.id_pracownika AND wy.id_godziny = god.id_godziny AND wy.id_premii = pr.id_premii AND liczba_godzin > 160 AND pr.kwota = MONEY(0);
--i
SELECT pr.id_pracownika, imie, nazwisko, kwota AS pensja FROM ksiegowosc.pracownicy pr, ksiegowosc.pensja pe, ksiegowosc.wynagrodzenie wy
WHERE wy.id_pensji = pe.id_pensji AND wy.id_pracownika = pr.id_pracownika
ORDER BY pensja;
--j
SELECT pra.id_pracownika, imie, nazwisko, pe.kwota AS pensja, pr.kwota AS premia FROM ksiegowosc.pracownicy pra, ksiegowosc.pensja pe, ksiegowosc.wynagrodzenie wy, ksiegowosc.premia pr 
WHERE wy.id_pensji = pe.id_pensji AND wy.id_pracownika = pra.id_pracownika AND wy.id_premii = pr.id_premii
ORDER BY pensja DESC, premia DESC;
--k
SELECT COUNT(id_pracownika) AS ilosc_pracownikow, stanowisko FROM ksiegowosc.pensja pe, ksiegowosc.wynagrodzenie wy
WHERE wy.id_pensji = pe.id_pensji
GROUP BY stanowisko;
--l
SELECT AVG(kwota::numeric)::money AS srednia_placa, MIN(kwota) AS minimalna_placa, MAX(kwota) AS maksymalna_placa FROM ksiegowosc.pensja pe
WHERE pe.stanowisko = 'Kierownik';
--m
SELECT SUM(pe.kwota::numeric)::money + SUM(pr.kwota::numeric)::money AS suma_wynagrodzen FROM ksiegowosc.wynagrodzenie wy, ksiegowosc.pensja pe, ksiegowosc.premia pr
WHERE wy.id_pensji = pe.id_pensji AND wy.id_premii = pr.id_premii;
--n
SELECT stanowisko, SUM(pe.kwota::numeric)::money + SUM(pr.kwota::numeric)::money AS suma_wynagrodzen FROM ksiegowosc.wynagrodzenie wy, ksiegowosc.pensja pe, ksiegowosc.premia pr
WHERE wy.id_pensji = pe.id_pensji AND wy.id_premii = pr.id_premii
GROUP BY stanowisko;
--o
SELECT stanowisko, COUNT(wy.id_premii) AS liczba_premii FROM ksiegowosc.wynagrodzenie wy, ksiegowosc.pensja pe, ksiegowosc.premia pr
WHERE wy.id_pensji = pe.id_pensji AND wy.id_premii = pr.id_premii AND pr.kwota != MONEY(0)
GROUP BY stanowisko
--p
--modyfikacja lub usunięcie na tabeli "pracownicy" narusza klucz obcy "godziny_id_pracownika_fkey" tabeli "godziny"
--nie da się usunąć pracownikow z tabeli ksiegowosc.pracownicy, ponieważ odnosi się do niej tabela ksiegowosc.wynagrodzenie.
--DELETE FROM ksiegowosc.pracownicy pr USING ksiegowosc.pensja pe, ksiegowosc.wynagrodzenie wy
--WHERE wy.id_pracownika =  pr.id_pracownika AND wy.id_pensji = pe.id_pensji AND pe.kwota < MONEY(1200);

--da sie co najwyzej usunac wynagrodzenia z tabeli ksiegowosc.wynagrodzenia, w którch kwota(pensja) < 1200zl
DELETE FROM ksiegowosc.wynagrodzenie wy USING ksiegowosc.pensja pe 
WHERE wy.id_pensji = pe.id_pensji AND pe.kwota < MONEY(1200)
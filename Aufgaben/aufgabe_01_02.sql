CREATE TABLE Kunden (
	kd_nr SMALLINT(5) UNSIGNED ZEROFILL PRIMARY KEY AUTO_INCREMENT,
	vorname VARCHAR(30),
	nachname VARCHAR(30),
	strasse VARCHAR(25),
	plz TINYINT(5),
	ort VARCHAR(50),
	vorwahl VARCHAR(50),
	telefon SMALLINT(6),
	geburtsdatum DATE NOT NULL,
	ledig TINYINT(1)
);

CREATE TABLE Auftrag(
	auft_nr INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	bestelldat DATE, lieferdat DATE, CONSTRAINT CHK_date_check_1 CHECK(bestelldat > lieferdat),
	zahlungsziel DATE, CONSTRAINT CHK_date_check_2 CHECK(zahlungsziel < bestelldat AND zahlungsziel < lieferdat),
	zahleingang TINYINT(1),
	mahnung ENUM('0','1','2','3') DEFAULT '0'
);

CREATE TABLE Artikel(
	art_nr SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	artikelbezeichnung VARCHAR(100),
	einzelpreis DOUBLE(8,2),
	gewicht_in_kg DOUBLE(5,2)
);

CREATE TABLE Hersteller(
	herst_nr TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	herstellerbezeichnung VARCHAR(30)
);

CREATE TABLE Kategorie(
	kat_nr TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	kategoriebezeichnung VARCHAR(30)
);

ALTER TABLE Kunden
 ADD rabatt FLOAT DEFAULT '0.03',
 letzter DATETIME AUTO_INCREMENT;
 
ALTER TABLE Kunden
 CHANGE strasse VARCHAR(35),
 rabatt DOUBLE(4,2);
 
ALTER TABLE Kunden MODIFY letzter letzter_Zugriff;
ALTER TABLE Artikel ADD INDEX(artikelbezeichnung);
ALTER TABLE Kunden RENAME TO kunde;
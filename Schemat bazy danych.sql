CREATE TABLE uczestnik
    ( id_uczestnika    INT 
       CONSTRAINT  id_uczestnika_nn NOT NULL
    , imie	    VARCHAR(25) 
	, nazwisko	    VARCHAR(25) 
	, stanowisko	VARCHAR(50) 
    );
GO

ALTER TABLE uczestnik ADD CONSTRAINT id_ucze_pk PRIMARY KEY (id_uczestnika) ;
GO


CREATE TABLE miejsce
    ( id_miejsca    INT 
       CONSTRAINT  id_miejsca_nn NOT NULL
    , miejscowosc	VARCHAR(40) 
	, ulica	    VARCHAR(50) 
	, numer    INT
	, placowka    VARCHAR(50) 
	, sala     TINYINT
    );
GO

ALTER TABLE miejsce ADD CONSTRAINT id_miej_pk PRIMARY KEY (id_miejsca) ;
GO

CREATE TABLE dziedzina
    ( id_dziedziny    INT 
       CONSTRAINT  id_dziedziny_nn NOT NULL
	, opis	    VARCHAR(50) 
    );
GO

ALTER TABLE dziedzina ADD CONSTRAINT id_dzie_pk PRIMARY KEY (id_dziedziny) ;
GO  

CREATE TABLE oferta 
    ( id_oferty    INT 
       CONSTRAINT  id_oferty_nn NOT NULL 
    , nazwa    VARCHAR(50)
	, data_rozp   SMALLDATETIME 
    , data_zak    SMALLDATETIME
	, cena  MONEY 
	, id_dziedziny INT
, CONSTRAINT     id_oferty_pk 
        	     PRIMARY KEY (id_oferty)
    ) ; 
GO
ALTER TABLE oferta ADD CONSTRAINT ofer_dzie_fk FOREIGN KEY (id_dziedziny) REFERENCES dziedzina(id_dziedziny);
GO

CREATE TABLE pracownik
    ( id_pracownika    INT 
       CONSTRAINT  id_pracownika_nn NOT NULL
    , imie	    VARCHAR(25) 
	, nazwisko	    VARCHAR(25) 
	, id_dziedziny INT 
    );
GO

ALTER TABLE pracownik ADD CONSTRAINT id_prac_pk PRIMARY KEY (id_pracownika) ;
GO
ALTER TABLE pracownik ADD CONSTRAINT prac_dzie_fk FOREIGN KEY (id_dziedziny) REFERENCES dziedzina (id_dziedziny);
GO

CREATE TABLE kurs 
    ( id_kursu    INT 
       CONSTRAINT  id_kursu_nn NOT NULL 
		,id_oferty INT
		,id_miejsca    INT 
		,id_pracownika    INT 
		,CONSTRAINT id_kursu_pk
        	     PRIMARY KEY (id_kursu)

    ) ; 
GO

ALTER TABLE kurs ADD CONSTRAINT kur_miej_fk FOREIGN KEY (id_miejsca) REFERENCES miejsce(id_miejsca);
GO
 
ALTER TABLE kurs ADD CONSTRAINT kur_prac_fk FOREIGN KEY (id_pracownika) REFERENCES pracownik(id_pracownika);
GO 

ALTER TABLE kurs ADD CONSTRAINT kur_ofer_fk FOREIGN KEY (id_oferty) REFERENCES oferta(id_oferty);
GO

CREATE TABLE ocena 
    ( ocena    FLOAT 
    , id_uczestnika       INT 
	 CONSTRAINT  id_uczestnika_nn NOT NULL 
	, id_kursu    INT  
	 CONSTRAINT  id_kursu_nn NOT NULL 
    ) ; 
GO

ALTER TABLE ocena ADD CONSTRAINT ocena_uczestnik_fk FOREIGN KEY (id_uczestnika) REFERENCES uczestnik(id_uczestnika);
GO

ALTER TABLE ocena ADD CONSTRAINT ocena_kurs_fk FOREIGN KEY (id_kursu) REFERENCES kurs(id_kursu);
GO

ALTER TABLE ocena ADD CONSTRAINT ocena_kurs_ucze_pk PRIMARY KEY (id_uczestnika, id_kursu);
GO

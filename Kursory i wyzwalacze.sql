--Procedura z zadeklarowanym kursorem, umożliwiającym wyświetlenie wszystkich zajęć 
--uruchomionych w zadanym w parametrze roku.
--CREATE PROCEDURE ZajeciaRoku
--@rok int
--AS
--DECLARE @nazwa varchar(50),
--@data_rozp smalldatetime,
--@data_zak smalldatetime,
--@il int

--SET @il=1;
--DECLARE dane_zajec1 CURSOR 
--FORWARD_ONLY
--FOR SELECT nazwa, data_rozp, data_zak 
--FROM oferta
--WHERE YEAR(data_rozp)=@rok;
--OPEN dane_zajec1;
--FETCH NEXT FROM dane_zajec1 
--INTO @nazwa, @data_rozp, @data_zak;
--PRINT 'Dane zajec z roku' + ' ' + convert(varchar(4),@rok)
--WHILE @@FETCH_STATUS = 0
--BEGIN
--IF @nazwa != null
--PRINT 'Dane zajec' + convert(varchar(3),@il) + ':' + @nazwa + '-' + YEAR(@data_rozp) + '-' + YEAR(@data_zak) + ';';
--SET @il+=1;
--FETCH NEXT FROM dane_zajec1
--INTO @nazwa, @data_rozp, @data_zak;
--END
--PRINT 'W roku' + ' ' + convert(varchar(4),@rok) + ' ' + 'pojawilo sie w ofercie' + ' ' + convert(varchar(4),@il-1) + ' ' +'szkolen.'
--CLOSE dane_zajec1;
--DEALLOCATE dane_zajec1;
--EXEC ZajeciaRoku 2017;

--Uruchamiany dla poleceń update i delete, zapisujący wprowadzone zmiany w dodatkowej 
--tabeli wraz z rodzajem tych zmian i ich godziną.
--CREATE TABLE audyt
--    ( id_uczestnika int
--	, nazwisko VARCHAR(25)
--	, akcja VARCHAR(50)
--	, czas datetime
--    )

--CREATE TRIGGER DodajUczestnika
--ON uczestnik
--FOR INSERT
--AS
--BEGIN
--SET NOCOUNT ON;
--DECLARE @id_uczestnika int
--DECLARE @calosc varchar(50)
--DECLARE @akcja varchar(50)
--SELECT @id_uczestnika=id_uczestnika
--from inserted
--SELECT @calosc=(SELECT imie + '' + nazwisko 
--FROM inserted)
--SELECT @akcja='Wiersz wprowadzony'
--INSERT INTO audyt(id_uczestnika, nazwisko, akcja, czas)
--VALUES (@id_uczestnika, @calosc, @akcja, GETDATE())
--END

--INSERT INTO uczestnik VALUES 
--        ( 31
--        , 'Marian'
--        , 'Dolek'
--        , 'finansista'
--        );

--CREATE TRIGGER UsunUczestnika
--ON uczestnik
--AFTER DELETE
--AS
--BEGIN
--DECLARE @id_uczestnika int
--DECLARE @calosc varchar(50)
--DECLARE @akcja varchar(500)
--SET @akcja='Wiersz usuniêty'
--INSERT INTO audyt(id_uczestnika, nazwisko, akcja, czas)
--SELECT d.id_uczestnika, d.imie + ' ' + d.nazwisko, @akcja, GETDATE()
--FROM deleted d
--END

--DELETE FROM uczestnik where id_uczestnika = 31
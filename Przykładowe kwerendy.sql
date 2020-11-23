--1 Wyswietlenie unikatowych stanowisk uczestnik�w
--select distinct stanowisko
--from uczestnik


--2 Zbi�r uczestnik�w uporz�dkowanych rosn�co wzgl�dem nazwiska, kt�rych stanowisko ko�czy
--si� cz�onem 'tyk'
--select imie, nazwisko, stanowisko
--from uczestnik
--where stanowisko like '%tyk'
--order by nazwisko asc

--3 Wy�wietlenie ilo�ci pracownik�w o�rodka
--select COUNT(*) 
--as ilosc
--from pracownik

--4 Wy�wietlenie �rednich ocen z poszczeg�lnych kurs�w, posortowanych ocen� malej�co
--SELECT Round(AVG(o.ocena),2) srednia, ofe.nazwa 
--FROM ocena o INNER JOIN kurs k 
--INNER JOIN oferta ofe 
--ON ofe.id_oferty=k.id_oferty
--ON o.id_kursu=k.id_kursu 
--GROUP BY ofe.nazwa

--5 Wy�wietlenie 5 najwy�szych ocen uczestnik�w (ka�dy uczestnik mo�e wyst�pi� co nawy�ej
--jeden raz)
--SELECT DISTINCT TOP 5 WITH TIES 
--u.imie, u.nazwisko, o.ocena, ofe.nazwa
--FROM uczestnik u 
--INNER JOIN  ocena o 
--INNER JOIN kurs k 
--INNER JOIN oferta ofe
--ON ofe.id_oferty=k.id_oferty
--ON k.id_kursu=o.id_kursu
--ON u.id_uczestnika=o.id_uczestnika 
--ORDER BY ocena desc

--6 Wy�wietlenie malej�co ze wzgl�du na nazwisko uczestnik�w i pracownik�w o tych samych
--imionach
--(select p.imie, p.nazwisko from uczestnik u,
--pracownik p where p.imie=u.imie)
--union 
--(select u.imie, u.nazwisko from uczestnik u,
--pracownik p where p.imie=u.imie)
--order by nazwisko desc

--7 Wy�wietlenie miejsc, w kt�rch aktualnie nie odbywa si� �aden kurs
--select miejscowosc, ulica, sala
--from miejsce
--where id_miejsca not in(select id_miejsca from kurs)

--8 Wy�wietlenie ofert, kt�re rozpoczynaja sie w przedziale miesi�c przed i miesi�c po 
--bie��cej dacie, uporz�dkowanych rosn�co dat� rozpocz�cia
--select nazwa, month(data_rozp) as miesiac
--from oferta
--where month(data_rozp) between datepart(mm, getdate())-1 and  datepart(mm,getdate())+1
--order by data_rozp asc


--9 Wy�wietlenie uczestnik�w o imieniu Piotr i ich stanowisk wielkimi literami,
--uporz�dkowanych malej�co nazwiskami
--select nazwisko, UPPER(stanowisko) as stan
--from uczestnik
--where imie = 'Piotr'
--order by nazwisko desc

--10 Wy�wietlenie nazwy oferty oraz dnia tygodnia rozpocz�cia i zako�czenia
--select nazwa, DATENAME(dw, data_rozp) as data_rozpoczecia, 
--DATENAME(dw, data_zak) as data_zakonczenia
--from oferta

--11 Lista ofert, kt�rych nazwa zaczyna si� na X-Z, rozpoczynaj�cych si� w 2018 roku
--select * from oferta
--where nazwa like '[X-Z]%' 
--and year(data_rozp) = 2018

--12 Wyswietlenie prowadzacych kursy w danej dziedzinie
--SELECT p.imie, p.nazwisko, d.opis FROM pracownik p 
--INNER JOIN dziedzina d 
--ON p.id_dziedziny=d.id_dziedziny 
--WHERE d.opis='zdrowie'

--13 Wy�wietlenie wszystkich pierwszych liter nazwisk pracownik�w i obliczenie ilu
--pracownik�w ma nazwisko rozpoczynaj�ce si� na dan� liter�
--SELECT 
--SUBSTRING(imie,1,1) as PierwszaLitera,
--COUNT(*) as LiczbaPracownikow
--FROM pracownik
--GROUP BY SUBSTRING(imie,1,1)

--14 Wy�wietlenie miejsc, w kt�rych jest planowany wi�cej ni� jeden kurs
--SELECT miejscowosc 
--FROM miejsce
--GROUP BY miejscowosc
--HAVING COUNT(*)>1

--15 Wy�wietlenie ceny oferty najdro�szej, najta�czej i �redniej
--select MIN(cena) as mini,
--MAX(cena) as maxi,
--round(AVG(cena),0) as sr 
--FROM oferta
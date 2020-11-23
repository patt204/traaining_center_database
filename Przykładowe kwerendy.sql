--1 Wyswietlenie unikatowych stanowisk uczestników
--select distinct stanowisko
--from uczestnik


--2 Zbiór uczestników uporz¹dkowanych rosn¹co wzglêdem nazwiska, których stanowisko koñczy
--siê cz³onem 'tyk'
--select imie, nazwisko, stanowisko
--from uczestnik
--where stanowisko like '%tyk'
--order by nazwisko asc

--3 Wyœwietlenie iloœci pracowników oœrodka
--select COUNT(*) 
--as ilosc
--from pracownik

--4 Wyœwietlenie œrednich ocen z poszczególnych kursów, posortowanych ocen¹ malej¹co
--SELECT Round(AVG(o.ocena),2) srednia, ofe.nazwa 
--FROM ocena o INNER JOIN kurs k 
--INNER JOIN oferta ofe 
--ON ofe.id_oferty=k.id_oferty
--ON o.id_kursu=k.id_kursu 
--GROUP BY ofe.nazwa

--5 Wyœwietlenie 5 najwy¿szych ocen uczestników (ka¿dy uczestnik mo¿e wyst¹piæ co nawy¿ej
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

--6 Wyœwietlenie malej¹co ze wzglêdu na nazwisko uczestników i pracowników o tych samych
--imionach
--(select p.imie, p.nazwisko from uczestnik u,
--pracownik p where p.imie=u.imie)
--union 
--(select u.imie, u.nazwisko from uczestnik u,
--pracownik p where p.imie=u.imie)
--order by nazwisko desc

--7 Wyœwietlenie miejsc, w którch aktualnie nie odbywa siê ¿aden kurs
--select miejscowosc, ulica, sala
--from miejsce
--where id_miejsca not in(select id_miejsca from kurs)

--8 Wyœwietlenie ofert, które rozpoczynaja sie w przedziale miesi¹c przed i miesi¹c po 
--bie¿¹cej dacie, uporz¹dkowanych rosn¹co dat¹ rozpoczêcia
--select nazwa, month(data_rozp) as miesiac
--from oferta
--where month(data_rozp) between datepart(mm, getdate())-1 and  datepart(mm,getdate())+1
--order by data_rozp asc


--9 Wyœwietlenie uczestników o imieniu Piotr i ich stanowisk wielkimi literami,
--uporz¹dkowanych malej¹co nazwiskami
--select nazwisko, UPPER(stanowisko) as stan
--from uczestnik
--where imie = 'Piotr'
--order by nazwisko desc

--10 Wyœwietlenie nazwy oferty oraz dnia tygodnia rozpoczêcia i zakoñczenia
--select nazwa, DATENAME(dw, data_rozp) as data_rozpoczecia, 
--DATENAME(dw, data_zak) as data_zakonczenia
--from oferta

--11 Lista ofert, których nazwa zaczyna siê na X-Z, rozpoczynaj¹cych siê w 2018 roku
--select * from oferta
--where nazwa like '[X-Z]%' 
--and year(data_rozp) = 2018

--12 Wyswietlenie prowadzacych kursy w danej dziedzinie
--SELECT p.imie, p.nazwisko, d.opis FROM pracownik p 
--INNER JOIN dziedzina d 
--ON p.id_dziedziny=d.id_dziedziny 
--WHERE d.opis='zdrowie'

--13 Wyœwietlenie wszystkich pierwszych liter nazwisk pracowników i obliczenie ilu
--pracowników ma nazwisko rozpoczynaj¹ce siê na dan¹ literê
--SELECT 
--SUBSTRING(imie,1,1) as PierwszaLitera,
--COUNT(*) as LiczbaPracownikow
--FROM pracownik
--GROUP BY SUBSTRING(imie,1,1)

--14 Wyœwietlenie miejsc, w których jest planowany wiêcej ni¿ jeden kurs
--SELECT miejscowosc 
--FROM miejsce
--GROUP BY miejscowosc
--HAVING COUNT(*)>1

--15 Wyœwietlenie ceny oferty najdro¿szej, najtañczej i œredniej
--select MIN(cena) as mini,
--MAX(cena) as maxi,
--round(AVG(cena),0) as sr 
--FROM oferta
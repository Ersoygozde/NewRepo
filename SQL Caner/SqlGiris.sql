/*
SQL NED�R? (Structured Query Language)
Sql bir veritaban� sorgulama dilidir. Sql ile veritaban�na yeni tablolar, kay�tlar ekleyip silebilir, var olanlar �zerinde duzenlemeler ve filtrelemeler yapabiliriz. 

Sql ile Oracle, db2, Sybase, Informix, Microsoft Sql Server, MS Access gibi veritaban� y�netim sistemlerinde �al��abiliriz. Sql, standart bir veritaban� sorgu dilidir, b�t�n geli�mi� veritaban� uygulamalar�nda kullan�l�r. 

T-SQL (Transact SQL)	PL-SQL

SQL'de kullan�lan komutlar 3 ana ba�l�kta toplan�r.

DDL(data definition language)
Create, alter, drop

DML (data manipulation language)
Select, Delete, Update, Insert 

DCL (data control language)
Grant, Deny, Revoke
*/

--Sql Server bir RDBMS (Relational DataBase Management System)

--Select �fadesi
--t�m sutunlar� getir
Select * from Employees
Select * from Customers

--belirli sutunlar� getir
Select CustomerID,CompanyName,City,Fax 
from Customers

--WHERE (filtreleme)
Select *
from Customers
where Country='Canada'

--Birim fiyat�(UnitPrice) 40 dolardan fazla olan �r�nler hangileridir?
Select *
from Products
where UnitPrice>40

--Hangi sipari�lerin i�erisinde 11 numaral� �r�nden al�nm��t�r?
Select * from [Order Details]
where ProductID=11

--s�tun isimlendirme
Select EmployeeID,FirstName+' '+LastName as NameSurname,Address
from Employees

Select EmployeeID,FirstName+' '+LastName as [Name Surname],Address
from Employees

Select EmployeeID,FirstName+' '+LastName NameSurname,Address
from Employees

--1 numaral� tedarik�iye (supplier) ait olan urunler hangileridir?
Select * from Products
where SupplierID=1

--AND , OR, NOT Mant�ksal Operat�rleri
--5 numaral� personelin 1998 y�l�ndan itibaren ald��� sipari�leri listeleyelim.

Select *
from Orders
where EmployeeID=5 AND OrderDate>'01/01/1998'

--Berlindeki veya Amerikadaki �reticileri listelemek istiyoruz.
select *
from Suppliers
where Country='USA'or City='Berlin'

--1 veya 2 nolu �reticilerin 20$ dan pahal� olan �r�nlerini listeleyelim.
select *
from Products
where (SupplierID=1 OR SupplierID=2) AND UnitPrice>20

--Kay�tlar� employeeID ye g�re artan ve azalan olarak s�ralama:
select * from Orders
order by EmployeeID asc

select * from Orders
order by EmployeeID desc

--Stok miktar� (UintsInStock) 50 den fazla olan �r�nleri s�ralayal�m.
select * 
from Products
where UnitsInStock>50
order by UnitsInStock desc

--Between ... And
--iki de�er aral���ndaki t�m kay�tlar� getirir
Select * from Customers
where CustomerID BETWEEN 'ALFKI' AND 'CACTU'

--L�KE ifadesi
--Sutundaki de�erlerin joker karakterler kullanarak olu�turdu�umuz bir arama kosulu ile kar��la�t�r�lmas�n� sa�lar.
--Joker Karakter: %(herhangi uzunlukta karakter), [], -
select * from Customers
where CompanyName LIKE '%hungry%'

/*
lIKE 'K%' --k ile ba�layan t�m kay�tlar
LIKE 'Tr%'--Tr ile ba�layan t�m kay�tlar
lIKE ' en' --toplam 3 karakter olan ve son iki karakteri en olan
LIKE '[CK]%' --C veya K ile ba�layan t�m kay�tlar
LIKE '[S-V]ing' --ing ile biten ve ilk harfi s ile v aras�nda olan d�rt harfli t�m kay�tlar
*/

--Bir listedeki elemanlar�n aramas� (IN)

--Japonya ve Italyadaki �reticileri listeleyiniz
Select *
from Suppliers
where Country='Japan' or Country='Italy'
--verilen listede olanlar
Select *
from Suppliers
where Country IN ('Japan','Italy')

--verilen listede olmayanlar
Select *
from Suppliers
where Country  NOT IN ('Japan','Italy')

--Bo� de�erlerin g�r�nt�lenmesi (NULL)
--Herhangi bir alana bir de�er girilmezse ve alan i�in herhangi bir varsay�lan de�er yoksa bu alan�n de�eri NULL olur. Null de�eri bo�luk '' ve 0 (s�f�r) dan farkl�d�r.
--IS NULL

Select * from Suppliers
where region IS NULL

Select * from Suppliers
where region IS NOT NULL

--Benzersiz kay�tlar�n g�r�nt�lenmesi
--Hangi �lkelerden �reticilerle �al��t���m�z� g�rmek istiyoruz.

select DISTINCT Country from Suppliers

--birden fazla alan i�in s�ralama yap�labilir:
Select ProductID,ProductName,CategoryID,UnitPrice
from Products
order by CategoryID desc, UnitPrice asc


--
Select * from Suppliers
Select * from Orders
Select * from Products
Select * from Customers
Select * from [Order Details]


--Adres bilgisi i�erisinde St. ge�en tedarikcileri listeleyiniz.
Select *
from Suppliers
where Address LIKE '%St.%'
--VINET id li m��teri yapm�� oldu�u t�m siparisleri listeleyiniz.
Select *
from Orders
where CustomerID='VINET'

--Londra veya Tokyo da bulunan tedarik�ilerden region bilgisi null olanlar� listeleyiniz.
Select *
from Suppliers
where City IN ('London','Tokyo') AND Region IS NULL

--Birim fiyat� 10 dolar ile 45 dolar aras�nda olan �r�nlerden kategorisi 2 olanlar� listeleyiniz.
Select *
from Products
where CategoryID=2 AND (UnitPrice BETWEEN 10 AND 45)
order by UnitPrice

--Stoklar� t�kenen �r�nleri listeleyiniz.
Select *
from Products
where UnitsInStock=0

--Kategori Idsi 5 olan Birim fiyat� 20 ile 35 dolara aras�nda olan ve �r�n ad� i�erisinde 'gute' karakterleri ge�en kay�tlar� listeleyiniz.

Select *
from Products
Where CategoryID=5 AND (UnitPrice BETWEEN 20 AND 35) AND ProductName LIKE '%gute%'

--Matematiksel ��lemler
Select 10+5
Select 'Caner '+'Mollao�lu'

select * from [Order Details]

--Birim Fiyat ile Miktar �arp�larak �r�n bazl� olarak toplam maliyet hesaplan�yor.

Select OrderID,ProductID,(UnitPrice*Quantity) as TotalCost
from [Order Details]
order by TotalCost desc

--TotalCost 15000 dolardan fazla olan sipari�leri listele.
Select OrderID,ProductID,(UnitPrice*Quantity) as TotalCost
from [Order Details]
where (UnitPrice*Quantity)>15000
order by TotalCost desc

--STRING FONKSIYONLARI
Select LTRIM('            �stanbul E�itim Akademi')
Select RTRIM('�stanbul E�itim Akademi            ')
Select UPPER('�stanbul E�itim Akademi')
Select LOWER ('�STANBUL');

SELECT LEFT(CompanyName,4) FROM Customers
SELECT UPPER(RIGHT(CompanyName,4)) FROM Customers
SELECT SUBSTRING('�stanbul E�itim Akademi',2,10)
SELECT SUBSTRING(LastName,1,3) AS ID
from Employees
SELECT REVERSE('�stanbul E�itim Akademi')
SELECT REPLACE('�stanbul E�itim Akademi','E�itim','Deneme')
SELECT REPLACE('�stanbul E�itim Akademi',' ','')

SELECT 10+15
SELECT '10'+'15'
SELECT CAST('12' AS INT) +  CAST('54' AS INT) [Toplam Sonu�]

--MATH METODLARI
SELECT COS(23)
SELECT TAN(23)
SELECT ABS(-23)
SELECT SQRT(49)
SELECT POWER(2,5)

SELECT AVG(UnitPrice)
from Products
SELECT MIN(UnitPrice)
from Products
SELECT MAX(UnitPrice)
from Products

--DATETIME FONKS�YONLARI
Select GETDATE()
Select YEAR(GETDATE())
Select MONTH(GETDATE())
Select DAY(GETDATE())

Select DATENAME(DW,'06.24.1985') --dayofweek
Select DATENAME(M,'06.24.1985')--month
Select DATENAME(D,'06.24.1985') --day

Select DATEDIFF(YEAR,'06.24.1985',GETDATE())
Select DATEDIFF(MONTH,'06.24.1985',GETDATE())
Select DATEDIFF(DAY,'06.24.1985',GETDATE())

Select DATEADD(DAY,15,GETDATE())
Select DATEADD(MINUTE,-15,GETDATE())	

--15 hafta sonra bug�n hangi g�ne denk gelmektedir.
Select DATENAME(DW,(DATEADD(WEEK,15,GETDATE())))

select * from Employees
--�al��anlar i�in n.davolio@istanbulegitimakademi.com format�nda mail adresleri olu�turulacakt�r. Ad Soyad ve Mail Adresi olarak g�r�nt�leyiniz.

SELECT FirstName+' '+LastName as [Ad Soyad], LOWER(LEFT(FirstName,1)+'.'+LastName)+'@istanbulegitimakademi.com' as [E-mail]
FROM Employees

--�r�nlerin adlar�n�, fiyatlar�n� ve %20 kdv li fiyatlar�n� raporlay�n�z.

--�al��anlar�n ad, soyad ve ya�lar�n� g�r�nt�leyiniz.

--Ortalama fiyattan pahal� olan �r�nler hangileridir.
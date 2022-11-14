
--FIRST TASK

CREATE DATABASE Company

USE Company

--Employees table-i olsun. Employees  -in Name, SurName, Position, Salary Column-lari olsun. 
CREATE TABLE Employees
(
Id int primary key identity,
Name nvarchar(100),
Surname nvarchar(100),
Position nvarchar(100),
Salary money
)

INSERT INTO Employees(Id,Name,Surname,Position,Salary)
VALUES
(1,'Sema','Mayilova','Senior Frontend Developer',2500),
(2,'Shahnigar','Kazimli','Senior Fullstack Developer',2500),
(3,'Irade','Feyzullayeva','Lead Fullstack Developer',2800),
(4,'Medine','Novruzova','Junior FrontEnd Developer',2000),
(5, 'Rufet' 'Quluzade','Middle Backend Developer',1800),
(6,'Faiq','Aliyev','Middle Backend Developer',2000),
(7,'Mayil','Kerimov','Junior Backend Developer',1700),


-- 1. Ortalama maaşı çıxarmalısınız
SELECT Avg(Salary) From Employees 


--2.Ortalama maaşdan yuxarı maaş alan işçilərin ad soyadını və maaşını yazdırmalısız
SELECT Name,Surname,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) 'Average Salary' FROM Employees)

--3.Max, Min maaşları çıxarmalı
SELECT Min(Salary) FROM Employees 
SELECT Max(Salary) FROM Employees 

DROP DATABASE Company


--SECOND TASK

CREATE DATABASE Market

USE Market

--Icinde Products Table-i yaradin.Product table-inda Id,Name,Price columnlari olsun
CREATE TABLE Products
(
Id int primary key identity,
Name nvarchar(100),
Price int
)

--Products table-na yeni bir Brand columnu elave edin
ALTER Table Products Add Brand nvarchar(100)

--Products table-a value-lar insert edin (10-15 dene product datasi kifayetdir)
INSERT INTO Products(Id,Name,Price,Brand)
VALUES 
(1,'Iphone 11 pro max',80,'Apple'),
(2,'Iphone 12 pro max',18,'Apple'),
(3,'Iphone 13 pro max',24,'Apple'),
(4,'Iphone 14 pro max',35,'Apple'),
(5,'Galaxy S20 FE',15,'Samsung'),
(6,'Galaxy S21',12,'Samsung'),
(7,'Galaxy S21 Ultra',21,'Samsung'),
(8,'Galaxy S21 FE',13,'Samsung'),
(9,'Galaxy S22',16,'Samsung'),
(10,'12 Pro',7,'Xiaomi'),
(11,'Mi 11',90,'Xiaomi'),
(12,'Redmi Note 10 Pro',6,'Xiaomi'),
(13,'Poco X3 NFC',55,'Xiaomi'),
(14,'Legion Y70',40,'Lenovo'),
(15,'K13',30,'Lenovo')
(16,'K13 Pro',50,'Lenovo')
(17,'K13 Note',10,'Lenovo')

--Qiymeti Productlarin price-larinin average-den kicik olan Products datalarinin siyahisini getiren query yazin
SELECT * FROM Products WHERE Price < (SELECT AVG(Price) FROM Products)

--Qiymeti 10-dan yuxari olan Product datalarinin siyahisini getiren query yazin
SELECT * FROM Products WHERE Price > 10

--Brand uzunlugu 5-den boyuk olan Productlarin siyahisini getiren query.
--Gelen datalarda Mehsulun adi ve Brand adi 1 columnda gorsensin ve Column adi ProductInfo olsun 
SELECT (Name + ' ' + Brand) 'ProductInfo' FROM Products WHERE LEN(Brand) > 5

DROP DATABASE Market



--THIRD TASK

--Employees (Id,FullName,Salary,DepartmentId, Email) ve Departments(Id, Name) table-lariniz 
--olsun ve aralarinda one to many bir relation qurun.
-- - Employee FullName - NULL OLA BILMEZ ,  uzunlugu 3-den boyuk olmaldir
-- - Department Name - uzunlugu 2-den boyuk olamlidir, null ola bilmez
-- - Email Null Ola Bilmez Ve Tekrar Olunmasin

CREATE DATABASE Depemp

USE DEPEMP

CREATE TABLE Departments(
Id int primary key identity,
Name nvarchar(25) NOT NULL CHECK(LEN(Name)>2)
)

CREATE TABLE Employees(
Id int primary key identity,
FullName nvarchar(100) NOT NULL CHECK(LEN(FullName) > 3),
Salary int CHECK(Salary >= 0),
DepartmentId int foreign key references Departments(Id),
Email nvarchar(50) NOT NULL UNIQUE
)

insert into Departments(Name)
values('Programming'),
('Graphic Design'),
('Marketing'),
('Accountant'),
('Human Resource')

insert into Employees(Fullname,Salary,DepartmentId,Email)
values('Elon Musk',3500,4,'elomask@gmail.com'),
('Mark Zuckerberg',4500,2,'markzuckerberg@icloud.com'),
('Jeff bezos',3590,3,'jeffbezos@mail.ru'),
('Steve Jobs',1000,1,'stevejobs@icloud.com'),
('Tim Cook',7500,5,'timcook@outlook.com')

DROP DATABASE Depemp

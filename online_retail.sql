create database online_retail;
use online_retail;


create table segment(
InvoiceNo varchar(50) not null,
StockCode varchar(50) not null,
Description varchar(50) not null,
Quantity varchar(50)  not null ,
InvoiceDate varchar(50) not null,
UnitPrice varchar(50) not null,
CustomerID varchar(50) not null,
Country varchar(50) not null);

drop table segment;

select * from segment;
select count(*) from segment;

-- max quantity
select max(Quantity) from segment;

-- count quantity
select sum(quantity) from segment;

-- total number of uk 
select count(*) from segment where country='United Kingdom';




SELECT Quantity, UnitPrice, (Quantity + Unitprice) AS total
FROM segment;

select sum(Quantity + Unitprice) from segment;
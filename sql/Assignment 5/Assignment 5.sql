-- CÂU 1:

SELECT `Name`
FROM product
WHERE `Name` LIKE '%Saddle%';

-- CÂU 2:
SELECT `Name`
FROM product
WHERE `Name` LIKE '%Bot%';

-- CÂU 3:
SELECT `Name`,(SELECT min(ListPrice) FROM product WHERE ProductSubcategoryID =3)AS gia_re_nhat
FROM product
WHERE ProductSubcategoryID=3;

-- JOIN nhiều bảng 
-- Câu 1: 
DROP VIEW IF EXISTS dia_chi;
CREATE VIEW dia_chi AS
SELECT a.`Name` AS Country ,b.`Name`AS Province
FROM countryregion a 
INNER JOIN stateprovince b 
ON a.CountryRegionCode = b.CountryRegionCode;


SELECT *
FROM dia_chi;


-- câu 2:
DROP VIEW IF EXISTS dia_chi_2;
CREATE VIEW dia_chi_2 AS
SELECT a.`Name` AS Country ,b.`Name`AS Province
FROM countryregion a 
LEFT JOIN stateprovince b 
ON a.CountryRegionCode = b.CountryRegionCode
WHERE a.`Name` IN ('Germany','Canada');


SELECT *
FROM dia_chi_2;

-- câu 3:

SELECT b.SalesOrderID,b.OrderDate,b.SalesPersonID,a.SalesPersonID AS BusinessEntityID,a.Bonus,a.SalesYTD
FROM salesperson a
INNER JOIN salesorderheader b 
ON a.SalesPersonID=b.SalesPersonID;


-- cau 4:
SELECT b.SalesOrderID,b.OrderDate,c.Title AS Jobtitle,a.Bonus,a.SalesYTD
FROM  salesorderheader b 
LEFT JOIN salesperson a
ON a.SalesPersonID=b.SalesPersonID
LEFT JOIN employee c
ON b.ContactID=c.ContactID;



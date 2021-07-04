-- CÂU 1:

SELECT `Name`
FROM product
WHERE `Name` LIKE '%Saddle%';

-- CÂU 2:
SELECT `Name`
FROM product
WHERE `Name` LIKE '%Bo%';

-- CÂU 3:
SELECT `Name`,(SELECT min(ListPrice) FROM product WHERE ProductSubcategoryID =3)AS gia_re_nhat
FROM product
WHERE ProductSubcategoryID=3;

-- JOIN nhiều bảng 
-- Câu 1: 








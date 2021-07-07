-- câu 1:
DROP PROCEDURE IF EXISTS lay_acc;
DELIMITER $$
CREATE PROCEDURE lay_acc (IN in_department_name VARCHAR(50))
BEGIN 
	SELECT a.FullName
    FROM  `account` a
    RIGHT JOIN department b 
    ON a.DepartmentID =b.DepartmentID
    WHERE b. DepartmentName = in_department_name;
END$$
DELIMITER ;


CALL lay_acc('Sale');

-- câu 2:: Tạo store để in ra số lượng account trong mỗi group 
DROP PROCEDURE IF EXISTS so_acc;
delimiter $$
CREATE PROCEDURE so_acc(IN in_GroupID TINYINT)
BEGIN
SELECT  COUNT(GroupID) 
FROM groupaccount
WHERE GroupID = in_GroupID
GROUP BY GroupID;
END $$
delimiter ;

-- SET @dem_acc='';
call so_acc(1);
-- SELECT @dem_acc as dem_nv;

-- câu 3:Tạo store để thống kê mỗi type question có bao nhiêu question được tạo 
  -- trong tháng hiện tại
  DROP PROCEDURE IF EXISTS dem_question;
  delimiter $$
  CREATE PROCEDURE dem_question (IN type_question tinyint )
  BEGIN
  SELECT COUNT(1)
  FROM question
  WHERE TypeID = type_question
  GROUP BY TypeID;
  END $$ 
  delimiter ;
  
  
  CALL dem_question(1);
  
  -- CÂU 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhấT
  DROP PROCEDURE IF EXISTS max_ques;
  delimiter $$
  CREATE PROCEDURE max_ques()
  BEGIN
  SELECT COUNT(1) as dem_max
  FROM question
  GROUP BY TypeID
  HAVING  COUNT(QuestionID)= (SELECT MAX(DEM_QUES) FROM(SELECT COUNT(1) AS DEM_QUES 
						FROM question GROUP BY TypeID ) AS MAX);
  END$$
  delimiter ;
  
 --  SET @dem_max='';
--   call max_ques(@dem_max);
--   SELECT @dem_max;
call max_ques();
  
  -- CÂU 5: Sử dụng store ở question 4 để tìm ra tên của type question
  DROP PROCEDURE IF EXISTS tim_typeques;
  delimiter $$
  CREATE PROCEDURE tim_typeques(OUT out_typeques VARCHAR(30))
  BEGIN
  SELECT b.TypeName INTO out_typeques
  FROM question A
  JOIN typequestion b 
  ON a.TypeID=b.TypeID
  WHERE a.QuestionID =4;
  END$$
  delimiter ;
  SET @TypeName='';
  call tim_typeques(@TypeName);
  SELECT @TypeName;
  -- câu 6: : Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
 -- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
 -- chuỗi của người dùng nhập vào
 DROP PROCEDURE IF EXISTS nhap_ky_tu;
 delimiter $$
 CREATE PROCEDURE nhap_ky_tu( IN in_ky_tu varchar(50))
 BEGIN
 SELECT a.Username , c.GroupName
 FROM    groupaccount b 
 INNER JOIN `account` a
 ON a.AccountID=b.AccountID
 LEFT JOIN  `group` c
 ON  c.GroupID= b.GroupID
 WHERE a.Username like concat('%',in_ky_tu,'%');
 
 END $$
 delimiter ;

  
  CALL nhap_ky_tu('H');
  
 -- câu 7: : Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và 
 -- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @.mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
--  Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS nhap_thong_tin;
delimiter $$
CREATE PROCEDURE nhap_thong_tin(IN n_fullname varchar(50),IN nhap_email varchar(50))
BEGIN 
DECLARE n_positionID TINYINT ;
DECLARE n_departmentID TINYINT;
DECLARE n_username VARCHAR(50);

SELECT PositionID INTO n_positionID
FROM  `position` 
WHERE PositionName = 'Dev';

SELECT DepartmentID INTO n_departmentID
FROM  department
WHERE DepartmentName ='No person';

SELECT substring_indeX(nhap_email,'@',1) INTO n_username;

INSERT INTO `account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUE                (nhap_email,n_fullname,n_username,n_departmentID,n_positionID,now());
END $$
delimiter ;


CALL nhap_thong_tin('Hưng Đẹp Trai','nhabankhoaibu@gmail.com');

-- câu 8:  Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
 -- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS max_content;
delimiter $$
CREATE PROCEDURE max_content(IN in_TypeName varchar(50))
BEGIN 
SELECT a.Content,max(char_length(a.Content)) AS content_lon_mhat
FROM  question a 
JOIN typequestion b 
ON  a.TypeID=b.TypeID
WHERE b.TypeName=in_TypeName;

END $$
delimiter ;


CALL max_content('Essay');


-- câu 9:Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS xoa_ID;
delimiter $$
CREATE PROCEDURE xoa_ID(IN IN_ExamID TINYINT )
BEGIN 
DELETE 
FROM exam
WHERE ExamID= IN_ExamID;
END $$
delimiter ;


CALL xoa_ID('2');



-- CÂU 10:Tìm ra các exam được tạo từ 2 năm trước và xóa các exam đó đi (sử 
 -- dụng store ở câu 9 để xóa)
--  Sau đó in số lượng record đã remove từ các table liên quan trong khi 
--  removinG

SET @x='';
SELECT  COUNT(1) INTO @X
FROM exam
WHERE CreateDate <=(DATE_SUB(now(), interval 2 year));
DELETE 
FROM exam
WHERE CreateDate <=(DATE_SUB(now(), interval 2 year));

SELECT @x;

-- CÂU 11:Viết store cho phép người dùng xóa phòng ban bằng cách người dùng 
 -- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được 
--  chuyển về phòng ban default là phòng ban chờ việc
INSERT INTO department(DepartmentName)
VALUE 				  ('chờ việc');
DROP PROCEDURE IF EXISTS xoa_acc;
delimiter $$
CREATE PROCEDURE xoa_acc(IN ten_phong_ban varchar(50))
BEGIN
SELECT a.FullName,(SELECT b.DepartmentName FROM department b WHERE b.DepartmentID =12) AS phong_ban_moi
FROM `account` a
RIGHT JOIN  department b 
ON a.DepartmentID = b.DepartmentID
WHERE b.DepartmentName = ten_phong_ban;
END$$
delimiter ;

CALL xoa_acc('Sale');

-- câu 12:Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm 
-- 2020
-- SELECT (date_sub(NOW(),INTERVAL 2 YEAR );
DROP PROCEDURE IF EXISTS question_2020;
delimiter $$
CREATE PROCEDURE question_2020( )
BEGIN 
DROP VIEW IF EXISTS Emonth;
CREATE VIEW Emonth as
SELECT 1 AS thang
UNION SELECT 2 AS thang
UNION SELECT 3 AS thang
UNION SELECT 4 AS thang
UNION SELECT 5 AS thang
UNION SELECT 6 AS thang
UNION SELECT 7 AS thang
UNION SELECT 8 AS thang
UNION SELECT 9 AS thang
UNION SELECT 10 AS thang
UNION SELECT 11 AS thang
UNION SELECT 12 AS thang;
SELECT count(QuestionID) AS Ques_month
FROM Emonth a 
LEFT JOIN (SELECT * FROM question WHERE YEAR(CreateDate) = YEAR(now()) -1 ) b 
ON		 month(b.CreateDate)=a.thang
GROUP BY a.thang;
END$$
delimiter ;

call question_2020();

-- 







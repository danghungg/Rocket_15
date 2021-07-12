DROP DATABASE IF EXISTS StudentManagement;
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- tạo table Student:
CREATE TABLE Student(
StudentID		INT AUTO_INCREMENT PRIMARY KEY,
`Name`			VARCHAR(50) NOT NULL,
Age				TINYINT NOT NULL,
Gender			ENUM('Male','Female','Unknow')
);

-- tạo bảng Subject:
CREATE TABLE `Subject`(
SubjectID		INT  PRIMARY KEY,
SubjectName		VARCHAR(50) NOT NULL
);

-- tạo bảng StudentSubject:

CREATE TABLE StudentSubject(
StudentID		INT,
SubjectID		INT,
Mark			TINYINT DEFAULT 0,
`Date`			DATETIME DEFAULT NOW(),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ,
FOREIGN KEY (SubjectID) REFERENCES `Subject`(SubjectID) ,
PRIMARY KEY(StudentID,SubjectID)

);

-- nhập dữ liệu bảng Student
INSERT INTO Student(`Name`,Age,Gender)
VALUE			   ('Đặng Quốc Hưng',23,'Male'),
					('Đỗ Minh Ngọc',20,'Female'),
                    ('Đỗ Đức Ngọc',21,'Male'),
                    ('Lại Minh Tâm',26,'Female');
                    
INSERT INTO  `Subject`(SubjectID,SubjectName)
VALUE				 (1001,'kế toán tài chính'),
					 (1002,'kỹ thuật may'),
                     (1003,'Phương pháp tính'),
                     (1004,'lập trình PLC');
                     
INSERT	INTO StudentSubject(StudentID,SubjectID,Mark,`Date`)
VALUE						(1,1002,8,'2021-02-02'),
							(1,1003,7,'2021-02-02'),
                            (2,1001,5,'2021-02-10'),
                            (3,1001,6,'2021-06-02'),
                            (1,1001,9,'2021-07-02'),
                            (2,1002,6,'2021-02-02'),
                            (4,1001,5,'2021-08-02'),
                            (4,1002,8,'2021-09-02');


-- CÂU 2:Viết lệnh để
-- a) Lấy tất cả các môn học không có bất kì điểm nào 
-- b) Lấy danh sách các môn học có ít nhất 2 điểm

-- a)
SELECT a.SubjectName
FROM `subject` a 
LEFT JOIN studentsubject b 
ON a.SubjectID=b.SubjectID
WHERE b.SubjectID is null;

-- b)
SELECT a.SubjectName,COUNT(StudentID) AS so_luong_diem_cua_mon_hoc
FROM `subject` a 
LEFT JOIN studentsubject b 
ON a.SubjectID=b.SubjectID
GROUP BY B.SubjectID
HAVING count(StudentID) >=2;

-- câu3:Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm: 
-- Student ID,Subject ID, Student Name, Student Age, Student Gender, 
-- Subject Name, Mark, Date
DROP VIEW IF EXISTS StudentInfo;
CREATE VIEW StudentInfo AS
SELECT a.StudentID,a.`Name`,a.Age,a.Gender,c.SubjectName,b.Mark,b.`Date`
FROM student a 
 LEFT JOIN studentsubject b 
ON a.StudentID=b.StudentID
 LEFT JOIN `subject`	c
ON b.SubjectID= c.SubjectID;


SELECT *
from StudentInfo;

-- CÂU 4:Không sử dụng On Update Cascade & On Delete Cascade
-- a) Tạo trigger cho table Subject có tên là SubjectUpdateID: 
-- Khi thay đổi data của cột ID của table Subject, thì giá trị tương 
-- ứng với cột SubjectID của table StudentSubject cũng thay đổi 
-- theo
-- b) Tạo trigger cho table Student có tên là StudentDeleteID:
-- Khi xóa data của cột ID của table Student, thì giá trị tương ứng với
-- cột SubjectID của table StudentSubject cũng bị xóa theo

-- a)
 DROP TRIGGER IF EXISTS SubjectUpdateID;
 DELIMITER $$
 CREATE TRIGGER SubjectUpdateID
 AFTER UPDATE ON `subject`

FOR EACH ROW
 BEGIN
 UPDATE `subject` SET SubjectID = NEW.SubjectID;
UPDATE studentsubject SET SubjectID=NEW.SubjectID;

END$$

 DELIMITER ;

UPDATE `subject`
 SET  SubjectID =1007
 WHERE SubjectID= 1001;

-- b)
DROP TRIGGER IF EXISTS StudentDeleteID;
delimiter $$
CREATE TRIGGER StudentDeleteID
BEFORE DELETE ON student
FOR EACH ROW
BEGIN
DELETE FROM studentsubject WHERE StudentID = OLD.StudentID;
DELETE FROM student WHERE StudentID=OLD.StudentID;

END$$
delimiter ;
DELETE 
FROM student
WHERE StudentID= 2;

-- CAU 5:
DROP PROCEDURE IF EXISTS StudentDelete;
DELIMITER $$
CREATE PROCEDURE StudentDelete (IN IN_StudentName VARCHAR(50),IN in_dausao VARCHAR(5))
BEGIN



DELETE FROM studentsubject WHERE StudentID IN(SELECT StudentID FROM student WHERE `Name`=IN_StudentName);
DELETE 
FROM student
WHERE `Name`=IN_StudentName;
END$$
DELIMITER ;


CALL StudentDelete('Đặng Quốc Hưng');













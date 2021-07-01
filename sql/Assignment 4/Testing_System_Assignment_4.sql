DROP DATABASE IF EXISTS 	TestingMannagement;
-- create database
CREATE DATABASE		    	TestingMannagement;
USE 						TestingMannagement;

-- create table:Department
CREATE TABLE	Department (
	DepartmentID	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	DepartmentName	VARCHAR(20) NOT NULL UNIQUE KEY
);

-- create table:Position
CREATE TABLE	`Position`(
	PositionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName	VARCHAR(40)  NOT NULL UNIQUE KEY
);
-- create table:Account
CREATE TABLE 	`Account`(
	AccountID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Email			VARCHAR(100) UNIQUE KEY ,
	Username		VARCHAR(50) UNIQUE KEY NOT NULL,
	FullName		VARCHAR(50) NOT NULL,
	DepartmentID	TINYINT UNSIGNED NOT NULL,
	PositionID		TINYINT UNSIGNED NOT NULL,
	CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);
-- create table:Group
CREATE TABLE	`Group`(
	GroupID		TINYINT	UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	GroupName	VARCHAR(50) UNIQUE KEY NOT NULL,
	CreatorID	TINYINT	UNSIGNED NOT NULL,
	CreateDate	DATETIME DEFAULT NOW() ,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
-- create table:GroupAccount
CREATE TABLE	`GroupAccount`(
	GroupID		TINYINT	UNSIGNED NOT NULL  ,
	AccountID	TINYINT UNSIGNED  NOT NULL,
	JoinDate	DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID	) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);
-- create table:TypeQuestion
CREATE TABLE	TypeQuestion(
	TypeID	 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	TypeName 	VARCHAR(100) NOT NULL UNIQUE KEY
);
-- create table:CategoryQuestion
CREATE TABLE	CategoryQuestion(
	CategoryID		TINYINT	UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	CategoryName	VARCHAR(50) UNIQUE KEY NOT NULL
);
-- create table:Question
CREATE TABLE	`Question`(
	QuestionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content			NVARCHAR(50) UNIQUE KEY NOT NULL,
	CategoryID		TINYINT UNSIGNED NOT NULL,
	TypeID			TINYINT UNSIGNED NOT NULL, 
	CreatorID		TINYINT	UNSIGNED NOT NULL,
	CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID)REFERENCES `Account`(AccountID)
);
-- create table:Answer
CREATE TABLE 	`Answer`(
	AnswerID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content			NVARCHAR(50) NOT NULL,
	QuestionID		TINYINT UNSIGNED NOT NULL,
	isCorrect		VARCHAR(20) DEFAULT 1,
    
    FOREIGN KEY(QuestionID)REFERENCES`Question`(QuestionID)
);

-- create table:Exam
CREATE TABLE	Exam(
	ExamID		TINYINT	UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Code`		VARCHAR(50) UNIQUE KEY NOT NULL,
	Title		VARCHAR(50) UNIQUE KEY NOT NULL,
	CategoryID	TINYINT UNSIGNED NOT NULL,
	Duration	TINYINT UNSIGNED NOT NULL,
	CreatorID	TINYINT	UNSIGNED NOT NULL,
	CreateDate	DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID)REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- create table:ExamQuestion
CREATE TABLE	`ExamQuestion`(
	ExamID		TINYINT	UNSIGNED NOT NULL,
	QuestionID	TINYINT	UNSIGNED NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID),
    PRIMARY KEY (ExamID,QuestionID)
);

-- ------------- THÊM CÁC GIÁ TRỊ VÀO TRONG BẢNG ------------------
-- BẢNG Department:
INSERT INTO  Department(DepartmentName)
VALUES	
												(' Marketing'),
												('Sale'),
												(N'Bảo vệ'),
												(N'Nhân sự'),
												(N'Kỹ thuật'),
												(N'Tài chính'),
												(N'Phó giám đốc'),
												(N'Giám đốc'),
												(N'Thư kí'),
												('No person'),
												(N'Bán hàng');
-- BẢNG  Position:
INSERT INTO `Position` (PositionName)			
VALUES
												('Dev' ),
												('Test' ),
												('Scrum Master'),
												('PM' ); 
-- BẢNG Account:
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES
					('Dangquochung1998ha@gmail.com','Hưng','Đặng Quốc Hưng','5','1','2020-03-05' ),
					('ngobakha1998ha@gmail.com','Bảnh','Ngô Bá Khá','2','2','2020-03-05' ),
					('Dangminhanhy18ha@gmail.com','Huấn','Huấn Hoa Hồng','3','4','2020-03-07' ),
					('leuleuhihiha@gmail.com','Đồng','Thau Sắt Bằng Đồng','4','4','2020-03-08' ),
					('raumungtoi18hp@gmail.com','Hồng','Nguyễn Minh Hồng','2','2',NULL ),
					('CavangkhongbietboiQN@gmail.com','Long','Triệu Tử Long','8','1','2020-04-07' ),
					('CamaccankhongchetQN@gmail.com','Vũ','Quan Vũ','2','2','2020-04-07' )	,							
					('Caboimavanchet@gmail.com','Bị','Lưu Bị','10','1','2020-04-09' ),
					('Đaibanggaycanh@gmail.com','Phi','Trương Phi','10','1',DEFAULT ),
                    ('camapgayrang@gmail.com','Trung' ,'Hoàng Trung','6','3','2020-04-05');

-- BẢNG Group:
INSERT INTO `Group`(GroupName, CreatorID,CreateDate)
VALUES
					 (N'Testing System', 5 ,'2019-03-05'),
					 (N'Development', 1 ,'2020-03-07'),
					 (N'VTI Sale 01', 2 ,'2020-03-09'),
					 (N'VTI Sale 02' , 3 ,'2020-03-10'),
					 (N'VTI Sale 03' , 4 ,'2020-03-28'),
					 (N'VTI Creator' , 6 ,'2020-04-06'),
					 (N'VTI Marketing 01' , 7 ,'2020-04-07'),
					 (N'Management' , 8 ,'2020-04-08'),
					 (N'Chat with love' , 9 ,'2020-04-09'),
					 (N'Vi Ti Ai' , 10 ,'2020-04-10');
 
 -- Bảng `GroupAccount`:
 INSERT INTO `GroupAccount` (GroupID , AccountID , JoinDate)
 VALUES
					( 1 , 1 ,'2019-03-05'),
					( 1 , 2 ,'2020-03-07'),
					( 3 , 3 ,'2020-03-09'),
					( 3 , 4 ,'2020-03-10'),
					( 5 , 5,'2020-03-28'),
					( 1 , 3,'2020-04-06'),
					( 1 , 7,'2020-04-07'),
					( 8 , 3,'2020-04-08'),
					( 1 , 9,'2020-04-09'),
					( 10 , 10,'2020-04-10');
 -- BẢNG TypeQuestion:
 INSERT INTO TypeQuestion (TypeName ) 
VALUES
					('Essay' ), 
					('Multiple-Choice' ); 
 -- BẢNG CategoryQuestion:                   
INSERT INTO CategoryQuestion (CategoryName )
VALUES 
						('Java' ),
						('ASP.NET' ),
						('ADO.NET' ),
						('SQL' ),
						('Postman' ),
						('Ruby' ),
						('Python' ),
						('C++' ),
						('C Sharp' ),
						('PHP' );
 -- BẢNG Question:                       
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 
					(N'Câu hỏi về Java' , 1 , 1 , 2 ,'2020-04-05'),
					(N'Câu hỏi về PHP' , 9 , 2 , 2 ,'2020-04-05'),
					(N'Hỏi về C#' , 9 , 2 , 3 ,'2020-04-06'),
					(N'Hỏi về Ruby' , 6 , 1 , 4 ,'2020-04-06'),
					(N'Hỏi về Postman' , 5 , 1 , 5 ,'2020-04-06'),
					(N'Hỏi về ADO.NET' , 5 , 2 , 3 ,'2020-04-06'),
					(N'Hỏi về ASP.NET' , 2 , 1 , 7 ,'2020-04-06'),
					(N'Hỏi về C++' , 8 , 1 , 8 ,'2020-04-07'),
					(N'Hỏi về SQL' , 4 , 2 , '9' ,'2020-04-07'),
					(N'Hỏi về Python' , 7 , 1 , 10 ,'2020-04-07');

-- BẢNG Answer

INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES
					 (N'Trả lời 01' , 1 , 0),
					 (N'Trả lời 02' , 1 , 1),
					 (N'Trả lời 03', 1 , 0 ),
					 (N'Trả lời 04', 1 , 1 ),
					 (N'Trả lời 05', 2 , 1 ),
					 (N'Trả lời 06', 3 , 1 ),
					 (N'Trả lời 07', 4 , 0 ),
					 (N'Trả lời 08', 8 , 0 ),
					 (N'Trả lời 09', 9 , 1 ),
					 (N'Trả lời 10', 10 , 1 );
-- BẢNG  Exam :
 INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
 
VALUES 
				 ('VTIQ001' , N'Đề thi C#' ,1 , 60 , '5' ,'2019-04-05'),
				 ('VTIQ002' , N'Đề thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
				 ('VTIQ003' , N'Đề thi C++' , 10 ,120 , '2' ,'2019-04-07'),
				 ('VTIQ004' , N'Đề thi Java' , 6 , 60, '3' ,'2020-04-08'),
				 ('VTIQ005' , N'Đề thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
				 ('VTIQ006' , N'Đề thi Postman' , 10 ,60 , '6' ,'2020-04-05'),
				 ('VTIQ007' , N'Đề thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
				 ('VTIQ008' , N'Đề thi Python' , 8 ,60 , '8' ,'2020-04-07'),
				 ('VTIQ009' , N'Đề thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
				 ('VTIQ010' , N'Đề thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');

-- BẢNG ExamQuestion:	 
INSERT INTO ExamQuestion(ExamID , QuestionID ) 

VALUES 
					( 1 , 5 ),
					( 2 , 10 ), 
					( 3 , 4 ), 
					( 4 , 3 ), 
					( 5 , 7 ), 
					( 6 , 10 ), 
					( 7 , 2 ), 
					( 8 , 10 ), 
					( 9 , 9 ), 
					( 10 , 8 );
                    
-- -------------------------bài tập buổi 4-----------------------------------


-- câu 1:Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT a.AccountID,a.FullName,b.DepartmentID,b.DepartmentName
FROM   `account` a 
LEFT JOIN department b
ON a.DepartmentID=b.DepartmentID;

-- CÂU 2:: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 05/04/2020

SELECT a.AccountID,a.FullName,b.DepartmentID,b.DepartmentName
FROM `account`a
INNER JOIN department b  
ON a.DepartmentID=b.DepartmentID
WHERE a.CreateDate > '2020-04-05';
-- CÂU 3: Viết lệnh để lấy ra tất cả các developer - NGƯỜI TẠO 
SELECT  b.CreatorID,a.FullName
FROM	 `account` a 
RIGHT JOIN question b  
ON    b.CreatorID=a.AccountID;

-- CÂU 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT a.DepartmentID,b.DepartmentName, count(1)
FROM  `account`a 
INNER JOIN	department b
ON a.DepartmentID=b.DepartmentID
GROUP BY a.DepartmentID
HAVING  count(1) >= 3;

-- CÂU 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
 -- nhất

SELECT a.ExamID,b.Content, count(b.QuestionID) AS MAX_SO_CAU_HOI
FROM examquestion a 
LEFT JOIN	question b 
ON a.QuestionID=b.QuestionID
GROUP BY a.QuestionID
HAVING  count(b.QuestionID)=(SELECT MAX(SO_CAU_HOI) FROM(SELECT count(A.QuestionID)AS SO_CAU_HOI FROM examquestion a 
								GROUP BY a.QuestionID ) AS MAX_SO_CAU_HOI);

-- câu 17:
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

SELECT b.GroupID,a.AccountID,a.FullName
FROM  `account` a 
RIGHT JOIN `group` b 
ON  b.CreatorID=a.AccountID
WHERE b.GroupID=1
UNION
SELECT b.GroupID,a.AccountID,a.FullName
FROM  `account` a 
RIGHT JOIN `group` b 
ON  b.CreatorID=a.AccountID
WHERE b.GroupID=2;

-- CÂU18:
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)

SELECT a.GroupID,COUNT(1) AS SO_NHAN_VIEN
FROM groupaccount a 
GROUP BY a.GroupID
HAVING COUNT(AccountID)>= 2
 UNION ALL
 SELECT a.GroupID,COUNT(1) AS SO_NHAN_VIEN
FROM groupaccount a 
GROUP BY a.GroupID
HAVING COUNT(AccountID)<= 4;

-- CÂU 6:Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT b.CategoryName, count(1)
FROM  question a 
LEFT JOIN categoryquestion b
ON  a.CategoryID =b.CategoryID
GROUP BY a.CategoryID;

-- Câu 7:Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT a.Content,count(1) AS so_exam 
FROM  question a 
RIGHT JOIN examquestion b 
ON    a.QuestionID= b.QuestionID
GROUP BY b.QuestionID
ORDER BY count(1) DESC;

-- câu 8:Lấy ra Question có nhiều câu trả lời nhất 

SELECT a.Content,count(b.AnswerID)
FROM  question a 
INNER JOIN answer b 
ON  a.QuestionID=b.QuestionID
GROUP BY b.QuestionID
HAVING count(b.AnswerID)=(SELECT MAX(so_tra_loi) FROM
						(SELECT count(1) AS so_tra_loi FROM answer b 
                        GROUP BY b.QuestionID)AS MAX);

-- câu 9: Thống kê số lượng account trong mỗi group và liệt kê tên của acc đó

SELECT b.GroupID ,GROUP_CONCAT(a.Username),count(1) AS so_luong_nv
FROM  `account`a 
RIGHT JOIN groupaccount b 
ON   b.AccountID= a.AccountID
GROUP BY  b.GroupID;

-- CÂU 10:: Tìm chức vụ có ít người nhất
SELECT b.DepartmentName,count(1) AS so_nhan_vien
FROM  department b 
RIGHT JOIN  `account` a 
ON   a.DepartmentID=b.DepartmentID
GROUP BY a.DepartmentID
HAVING count(a.AccountID)=(SELECT min( so_nhan_vien) FROM(SELECT count(1) AS so_nhan_vien 
							FROM `account` a GROUP BY a.DepartmentID )MAX);
                            
-- CÂU 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT b.DepartmentName,GROUP_CONCAT(c.PositionName)
FROM  `account` a 
JOIN  department B 
ON  b.DepartmentID=a.DepartmentID
JOIN  `position` c 
ON    a.PositionID=c.PositionID
GROUP BY a.PositionID;
-- CÂU 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của 
 -- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT a.Content,d.FullName,c.`Code`
FROM question a 
LEFT JOIN typequestion b 
ON a.TypeID=b.TypeID 
LEFT JOIN exam c
ON  a.CategoryID=C.CategoryID 
LEFT JOIN `account` d
ON d.AccountID=a.CreatorID;

-- câu 13:Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT a.TypeID,B.TypeName, count(1)
FROM  question a 
LEFT JOIN typequestion b 
ON  a.TypeID=b.TypeID 
GROUP BY  a.TypeID;

-- CÂU 14: Lấy ra group không có account nào
SELECT a.GroupName
FROM  `group` a 
LEFT JOIN groupaccount b 
ON a.GroupID=b.GroupID 
WHERE B.GroupID IS NULL
GROUP BY A.GroupName;

-- câu 15:: Lấy ra question không có answer nào
SELECT a.QuestionID,a.Content
FROM question a 
LEFT JOIN `answer` b 
ON a.QuestionID=b.QuestionID
WHERE B.AnswerID IS NULL
GROUP BY a.QuestionID;













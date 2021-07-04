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
    
    FOREIGN KEY(QuestionID)REFERENCES`Question`(QuestionID) ON DELETE CASCADE
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
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE,
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
                    
-- -------------------------bài tập buổi 5-----------------------------------

-- CÂU 1:Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW DANH_SACH_NV AS
SELECT AccountID,FullName
FROM	`account`
WHERE  DepartmentID= (SELECT DepartmentID AS DANH_SACH_NV
					FROM  department
						WHERE DepartmentName='Sale') ;


SELECT *
FROM DANH_SACH_NV;


-- CÂU 2:Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS account_max;
CREATE VIEW account_max AS
SELECT	a.AccountID, a.FullName, 
(select COUNT(*) from groupaccount WHERE AccountID = a.AccountID) as max_groud
FROM	`account` a
WHERE  a.AccountID=(SELECT AccountID
					FROM groupaccount
                    GROUP BY AccountID
                    HAVING COUNT(GroupID)=(SELECT MAX(SO_ACC) FROM (SELECT COUNT(GroupID) AS SO_ACC FROM groupaccount
        
        
        GROUP BY AccountID )AS account_max));
SELECT *
from account_max;

-- câu 3: Tạo view có chứa câu hỏi có những content quá dài và xóa nó đi
DROP VIEW IF EXISTS lenghContent;
CREATE VIEW lenghContent AS
SELECT Content,char_length(Content) AS lenghContent
FROM question
WHERE char_length(Content)> 14  ;


SELECT *
FROM lenghContent;

DELETE 
FROM lenghContent;


-- CÂU 4:Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS max_nv;
CREATE VIEW max_nv AS
SELECT b.DepartmentName, count(1) AS max_nv
FROM  department b 
INNER JOIN `account` a
ON  b.DepartmentID=a.DepartmentID
GROUP BY a.DepartmentID
HAVING count(a.AccountID)=( SELECT max(dem_vn) FROM(SELECT count(1) AS dem_vn 
								FROM `account` a GROUP BY a.DepartmentID )AS max_nv);
                                

SELECT *
FROM max_nv;

-- CÂU 5:  Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS creatorQuestion;
CREATE VIEW creatorQuestion AS 
SELECT a.AccountID,a.FullName,b.Content
FROM  `account` a 
INNER JOIN question b 
ON a.AccountID=b.CreatorID 
WHERE a.FullName LIKE '%Nguyễn%';

SELECT *
FROM creatorQuestion;



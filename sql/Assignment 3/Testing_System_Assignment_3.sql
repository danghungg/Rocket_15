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
	CreatorID	TINYINT	UNSIGNED UNIQUE KEY NOT NULL,
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
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
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
					(N'Câu hỏi về Java' , 1 , '1' , '2' ,'2020-04-05'),
					(N'Câu hỏi về PHP' , 10 , '2' , '2' ,'2020-04-05'),
					(N'Hỏi về C#' , 9 , '2' , '3' ,'2020-04-06'),
					(N'Hỏi về Ruby' , 6 , '1' , '4' ,'2020-04-06'),
					(N'Hỏi về Postman' , 5 , '1' , '5' ,'2020-04-06'),
					(N'Hỏi về ADO.NET' , 3 , '2' , '6' ,'2020-04-06'),
					(N'Hỏi về ASP.NET' , 2 , '1' , '7' ,'2020-04-06'),
					(N'Hỏi về C++' , 8 , '1' , '8' ,'2020-04-07'),
					(N'Hỏi về SQL' , 4 , '2' , '9' ,'2020-04-07'),
					(N'Hỏi về Python' , 7 , '1' , '10' ,'2020-04-07');

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
				 ('VTIQ003' , N'Đề thi C++' , 9 ,120 , '2' ,'2019-04-07'),
				 ('VTIQ004' , N'Đề thi Java' , 6 , 60, '3' ,'2020-04-08'),
				 ('VTIQ005' , N'Đề thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
				 ('VTIQ006' , N'Đề thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
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
                    
                    
                    
-- câu 2:lấy ra tất cả các phòng ban
SELECT *
FROM   department;
-- CÂU 3:lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM  department
WHERE DepartmentName='Sale';
-- câu 4:lấy ra thông tin account có full name dài nhất
SELECT *, MAX(length(FullName))
FROM  `account`;

-- CÂU 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *, MAX(length(FullName))
FROM  `account`
WHERE DepartmentID=3;
-- CÂU 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName
FROM  `group`
WHERE  CreateDate < '2019-12-20';

-- CÂU 7: : Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID, COUNT(AnswerID)
FROM answer
GROUP BY QuestionID
HAVING COUNT(AnswerID)>= 4;
-- CÂU 8:Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 
 -- 20/12/2019
 SELECT ExamID
 FROM	exam
 WHERE	Duration >= 60 AND CreateDate < '2019-12-20';
 -- CÂU 9: Lấy ra 5 group được tạo gần đây nhất
 SELECT GroupName
 FROM	`group`
ORDER BY    CreateDate DESC
LIMIT 5;
-- CÂU 10:Đếm số nhân viên thuộc department có id = 2
SELECT DepartmentID,COUNT(1)AS SO_NHAN_VIEN
FROM `account`
WHERE DepartmentID=2
GROUP BY DepartmentID;
 
 -- CÂU 11:Lấy ra nhân viên có tên bắt đầu bằng chữ "H" và kết thúc bằng chữ "G"
 SELECT Username
 FROM  `account`
 WHERE Username LIKE ('H%G');
 
 -- CÂU 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
 DELETE 
 FROM exam
WHERE CreateDate < 20/12/2019;
 
 -- CÂU 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM question
WHERE Content LIKE ('%Câu hỏi%');
-- CÂU 14:Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và 
 -- email thành loc.nguyenba@vti.com.vn
UPDATE `account`
 SET	FullName='Nguyễn Bá Lộc',
		Email	='loc.nguyenba@vti.com.vn'
 WHERE  AccountID=5;
 -- CÂU 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE groupaccount
SET    GroupID=4
WHERE	AccountID=5;





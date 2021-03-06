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

-- ------------- TH??M C??C GI?? TR??? V??O TRONG B???NG ------------------
-- B???NG Department:
INSERT INTO  Department(DepartmentName)
VALUES	
												(' Marketing'),
												('Sale'),
												(N'B???o v???'),
												(N'Nh??n s???'),
												(N'K??? thu???t'),
												(N'T??i ch??nh'),
												(N'Ph?? gi??m ?????c'),
												(N'Gi??m ?????c'),
												(N'Th?? k??'),
												('No person'),
												(N'B??n h??ng');
-- B???NG  Position:
INSERT INTO `Position` (PositionName)			
VALUES
												('Dev' ),
												('Test' ),
												('Scrum Master'),
												('PM' ); 
-- B???NG Account:
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES
					('Dangquochung1998ha@gmail.com','H??ng','?????ng Qu???c H??ng','5','1','2020-03-05' ),
					('ngobakha1998ha@gmail.com','B???nh','Ng?? B?? Kh??','2','2','2020-03-05' ),
					('Dangminhanhy18ha@gmail.com','Hu???n','Hu???n Hoa H???ng','3','4','2020-03-07' ),
					('leuleuhihiha@gmail.com','?????ng','Thau S???t B???ng ?????ng','4','4','2020-03-08' ),
					('raumungtoi18hp@gmail.com','H???ng','Nguy???n Minh H???ng','2','2',NULL ),
					('CavangkhongbietboiQN@gmail.com','Long','Tri???u T??? Long','8','1','2020-04-07' ),
					('CamaccankhongchetQN@gmail.com','V??','Quan V??','2','2','2020-04-07' )	,							
					('Caboimavanchet@gmail.com','B???','L??u B???','10','1','2020-04-09' ),
					('??aibanggaycanh@gmail.com','Phi','Tr????ng Phi','10','1',DEFAULT ),
                    ('camapgayrang@gmail.com','Trung' ,'Ho??ng Trung','6','3','2020-04-05');

-- B???NG Group:
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
 
 -- B???ng `GroupAccount`:
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
 -- B???NG TypeQuestion:
 INSERT INTO TypeQuestion (TypeName ) 
VALUES
					('Essay' ), 
					('Multiple-Choice' ); 
 -- B???NG CategoryQuestion:                   
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
 -- B???NG Question:                       
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 
					(N'C??u h???i v??? Java' , 1 , '1' , '2' ,'2020-04-05'),
					(N'C??u h???i v??? PHP' , 10 , '2' , '2' ,'2020-04-05'),
					(N'H???i v??? C#' , 9 , '2' , '3' ,'2020-04-06'),
					(N'H???i v??? Ruby' , 6 , '1' , '4' ,'2020-04-06'),
					(N'H???i v??? Postman' , 5 , '1' , '5' ,'2020-04-06'),
					(N'H???i v??? ADO.NET' , 3 , '2' , '6' ,'2020-04-06'),
					(N'H???i v??? ASP.NET' , 2 , '1' , '7' ,'2020-04-06'),
					(N'H???i v??? C++' , 8 , '1' , '8' ,'2020-04-07'),
					(N'H???i v??? SQL' , 4 , '2' , '9' ,'2020-04-07'),
					(N'H???i v??? Python' , 7 , '1' , '10' ,'2020-04-07');

-- B???NG Answer

INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES
					 (N'Tr??? l???i 01' , 1 , 0),
					 (N'Tr??? l???i 02' , 1 , 1),
					 (N'Tr??? l???i 03', 1 , 0 ),
					 (N'Tr??? l???i 04', 1 , 1 ),
					 (N'Tr??? l???i 05', 2 , 1 ),
					 (N'Tr??? l???i 06', 3 , 1 ),
					 (N'Tr??? l???i 07', 4 , 0 ),
					 (N'Tr??? l???i 08', 8 , 0 ),
					 (N'Tr??? l???i 09', 9 , 1 ),
					 (N'Tr??? l???i 10', 10 , 1 );
-- B???NG  Exam :
 INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
 
VALUES 
				 ('VTIQ001' , N'????? thi C#' ,1 , 60 , '5' ,'2019-04-05'),
				 ('VTIQ002' , N'????? thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
				 ('VTIQ003' , N'????? thi C++' , 9 ,120 , '2' ,'2019-04-07'),
				 ('VTIQ004' , N'????? thi Java' , 6 , 60, '3' ,'2020-04-08'),
				 ('VTIQ005' , N'????? thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
				 ('VTIQ006' , N'????? thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
				 ('VTIQ007' , N'????? thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
				 ('VTIQ008' , N'????? thi Python' , 8 ,60 , '8' ,'2020-04-07'),
				 ('VTIQ009' , N'????? thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
				 ('VTIQ010' , N'????? thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');

-- B???NG ExamQuestion:	 
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
                    
                    
                    
-- c??u 2:l???y ra t???t c??? c??c ph??ng ban
SELECT *
FROM   department;
-- C??U 3:l???y ra id c???a ph??ng ban "Sale"
SELECT DepartmentID
FROM  department
WHERE DepartmentName='Sale';
-- c??u 4:l???y ra th??ng tin account c?? full name d??i nh???t
SELECT *, MAX(length(FullName))
FROM  `account`;

-- C??U 5: L???y ra th??ng tin account c?? full name d??i nh???t v?? thu???c ph??ng ban c?? id = 3
SELECT *, MAX(length(FullName))
FROM  `account`
WHERE DepartmentID=3;
-- C??U 6: L???y ra t??n group ???? tham gia tr?????c ng??y 20/12/2019
SELECT GroupName
FROM  `group`
WHERE  CreateDate < '2019-12-20';

-- C??U 7: : L???y ra ID c???a question c?? >= 4 c??u tr??? l???i
SELECT QuestionID, COUNT(AnswerID)
FROM answer
GROUP BY QuestionID
HAVING COUNT(AnswerID)>= 4;
-- C??U 8:L???y ra c??c m?? ????? thi c?? th???i gian thi >= 60 ph??t v?? ???????c t???o tr?????c ng??y 
 -- 20/12/2019
 SELECT ExamID
 FROM	exam
 WHERE	Duration >= 60 AND CreateDate < '2019-12-20';
 -- C??U 9: L???y ra 5 group ???????c t???o g???n ????y nh???t
 SELECT GroupName
 FROM	`group`
ORDER BY    CreateDate DESC
LIMIT 5;
-- C??U 10:?????m s??? nh??n vi??n thu???c department c?? id = 2
SELECT DepartmentID,COUNT(1)AS SO_NHAN_VIEN
FROM `account`
WHERE DepartmentID=2
GROUP BY DepartmentID;
 
 -- C??U 11:L???y ra nh??n vi??n c?? t??n b???t ?????u b???ng ch??? "H" v?? k???t th??c b???ng ch??? "G"
 SELECT Username
 FROM  `account`
 WHERE Username LIKE ('H%G');
 
 -- C??U 12: X??a t???t c??? c??c exam ???????c t???o tr?????c ng??y 20/12/2019
 DELETE 
 FROM exam
WHERE CreateDate < 20/12/2019;
 
 -- C??U 13: X??a t???t c??? c??c question c?? n???i dung b???t ?????u b???ng t??? "c??u h???i"
DELETE
FROM question
WHERE Content LIKE ('%C??u h???i%');
-- C??U 14:Update th??ng tin c???a account c?? id = 5 th??nh t??n "Nguy???n B?? L???c" v?? 
 -- email th??nh loc.nguyenba@vti.com.vn
UPDATE `account`
 SET	FullName='Nguy???n B?? L???c',
		Email	='loc.nguyenba@vti.com.vn'
 WHERE  AccountID=5;
 -- C??U 15: update account c?? id = 5 s??? thu???c group c?? id = 4
UPDATE groupaccount
SET    GroupID=4
WHERE	AccountID=5;





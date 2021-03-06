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
					(N'C??u h???i v??? Java' , 1 , 1 , 2 ,'2020-04-05'),
					(N'C??u h???i v??? PHP' , 9 , 2 , 2 ,'2020-04-05'),
					(N'H???i v??? C#' , 9 , 2 , 3 ,'2020-04-06'),
					(N'H???i v??? Ruby' , 6 , 1 , 4 ,'2020-04-06'),
					(N'H???i v??? Postman' , 5 , 1 , 5 ,'2020-04-06'),
					(N'H???i v??? ADO.NET' , 5 , 2 , 3 ,'2020-04-06'),
					(N'H???i v??? ASP.NET' , 2 , 1 , 7 ,'2020-04-06'),
					(N'H???i v??? C++' , 8 , 1 , 8 ,'2020-04-07'),
					(N'H???i v??? SQL' , 4 , 2 , '9' ,'2020-04-07'),
					(N'H???i v??? Python' , 7 , 1 , 10 ,'2020-04-07');

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
				 ('VTIQ003' , N'????? thi C++' , 10 ,120 , '2' ,'2019-04-07'),
				 ('VTIQ004' , N'????? thi Java' , 6 , 60, '3' ,'2020-04-08'),
				 ('VTIQ005' , N'????? thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
				 ('VTIQ006' , N'????? thi Postman' , 10 ,60 , '6' ,'2020-04-05'),
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
                    
-- -------------------------b??i t???p bu???i 4-----------------------------------


-- c??u 1:Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???

SELECT a.AccountID,a.FullName,b.DepartmentID,b.DepartmentName
FROM   `account` a 
LEFT JOIN department b
ON a.DepartmentID=b.DepartmentID;

-- C??U 2:: Vi???t l???nh ????? l???y ra th??ng tin c??c account ???????c t???o sau ng??y 05/04/2020

SELECT a.AccountID,a.FullName,b.DepartmentID,b.DepartmentName
FROM `account`a
INNER JOIN department b  
ON a.DepartmentID=b.DepartmentID
WHERE a.CreateDate > '2020-04-05';
-- C??U 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer - NG?????I T???O 
SELECT  b.CreatorID,a.FullName
FROM	 `account` a 
RIGHT JOIN question b  
ON    b.CreatorID=a.AccountID;

-- C??U 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >3 nh??n vi??n
SELECT a.DepartmentID,b.DepartmentName, count(1)
FROM  `account`a 
INNER JOIN	department b
ON a.DepartmentID=b.DepartmentID
GROUP BY a.DepartmentID
HAVING  count(1) >= 3;

-- C??U 5: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u 
 -- nh???t

SELECT a.ExamID,b.Content, count(b.QuestionID) AS MAX_SO_CAU_HOI
FROM examquestion a 
LEFT JOIN	question b 
ON a.QuestionID=b.QuestionID
GROUP BY a.QuestionID
HAVING  count(b.QuestionID)=(SELECT MAX(SO_CAU_HOI) FROM(SELECT count(A.QuestionID)AS SO_CAU_HOI FROM examquestion a 
								GROUP BY a.QuestionID ) AS MAX_SO_CAU_HOI);

-- c??u 17:
-- a) L???y c??c account thu???c nh??m th??? 1
-- b) L???y c??c account thu???c nh??m th??? 2
-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b) sao cho kh??ng c?? record n??o tr??ng nhau

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

-- C??U18:
-- a) L???y c??c group c?? l???n h??n 5 th??nh vi??n
-- b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n
-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b)

SELECT a.GroupID,COUNT(1) AS SO_NHAN_VIEN
FROM groupaccount a 
GROUP BY a.GroupID
HAVING COUNT(AccountID)>= 2
 UNION ALL
 SELECT a.GroupID,COUNT(1) AS SO_NHAN_VIEN
FROM groupaccount a 
GROUP BY a.GroupID
HAVING COUNT(AccountID)<= 4;

-- C??U 6:Th??ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question

SELECT b.CategoryName, count(1)
FROM  question a 
LEFT JOIN categoryquestion b
ON  a.CategoryID =b.CategoryID
GROUP BY a.CategoryID;

-- C??u 7:Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam
SELECT a.Content,count(1) AS so_exam 
FROM  question a 
RIGHT JOIN examquestion b 
ON    a.QuestionID= b.QuestionID
GROUP BY b.QuestionID
ORDER BY count(1) DESC;

-- c??u 8:L???y ra Question c?? nhi???u c??u tr??? l???i nh???t 

SELECT a.Content,count(b.AnswerID)
FROM  question a 
INNER JOIN answer b 
ON  a.QuestionID=b.QuestionID
GROUP BY b.QuestionID
HAVING count(b.AnswerID)=(SELECT MAX(so_tra_loi) FROM
						(SELECT count(1) AS so_tra_loi FROM answer b 
                        GROUP BY b.QuestionID)AS MAX);

-- c??u 9: Th???ng k?? s??? l?????ng account trong m???i group v?? li???t k?? t??n c???a acc ????

SELECT b.GroupID ,GROUP_CONCAT(a.Username),count(1) AS so_luong_nv
FROM  `account`a 
RIGHT JOIN groupaccount b 
ON   b.AccountID= a.AccountID
GROUP BY  b.GroupID;

-- C??U 10:: T??m ch???c v??? c?? ??t ng?????i nh???t
SELECT b.DepartmentName,count(1) AS so_nhan_vien
FROM  department b 
RIGHT JOIN  `account` a 
ON   a.DepartmentID=b.DepartmentID
GROUP BY a.DepartmentID
HAVING count(a.AccountID)=(SELECT min( so_nhan_vien) FROM(SELECT count(1) AS so_nhan_vien 
							FROM `account` a GROUP BY a.DepartmentID )MAX);
                            
-- C??U 11: Th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM
SELECT b.DepartmentName,GROUP_CONCAT(c.PositionName)
FROM  `account` a 
JOIN  department B 
ON  b.DepartmentID=a.DepartmentID
JOIN  `position` c 
ON    a.PositionID=c.PositionID
GROUP BY a.PositionID;
-- C??U 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a 
 -- question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ???
SELECT a.Content,d.FullName,c.`Code`
FROM question a 
LEFT JOIN typequestion b 
ON a.TypeID=b.TypeID 
LEFT JOIN exam c
ON  a.CategoryID=C.CategoryID 
LEFT JOIN `account` d
ON d.AccountID=a.CreatorID;

-- c??u 13:L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
SELECT a.TypeID,B.TypeName, count(1)
FROM  question a 
LEFT JOIN typequestion b 
ON  a.TypeID=b.TypeID 
GROUP BY  a.TypeID;

-- C??U 14: L???y ra group kh??ng c?? account n??o
SELECT a.GroupName
FROM  `group` a 
LEFT JOIN groupaccount b 
ON a.GroupID=b.GroupID 
WHERE B.GroupID IS NULL
GROUP BY A.GroupName;

-- c??u 15:: L???y ra question kh??ng c?? answer n??o
SELECT a.QuestionID,a.Content
FROM question a 
LEFT JOIN `answer` b 
ON a.QuestionID=b.QuestionID
WHERE B.AnswerID IS NULL
GROUP BY a.QuestionID;













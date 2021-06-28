DROP DATABASE IF EXISTS BAI_1;
CREATE DATABASE		BAI_1;
USE  			BAI_1;
-- tạo bảng Department
CREATE TABLE Department(
	DepartmentID 	INT,
	DepartmentName 	VARCHAR (50)
);
-- tạo bảng `Position`
CREATE TABLE `Position`(
	PositionID  	INT,
	PositionName 	VARCHAR (50)
);
-- tạo bảng `Account`
CREATE TABLE  `Account`(
	AccountID  		INT,
	Email    	 	VARCHAR(50),
	Username  		VARCHAR(50),
	FullName  		VARCHAR (50),
	DepartmentID 	INT,
	PositionID   	INT,
	CreateDate 		DATE
);
-- tạo bảng `Group`
CREATE TABLE `Group`(
	GroupID   	INT,
	GroupName 	VARCHAR(50),
	CreatorID 	 INT,
	CreateDate 	DATE
);
-- tạo bảng GroupAccount
CREATE TABLE GroupAccount(
	GroupID  	INT,
	AccountID 	INT,
	JoinDate  	DATE
);
-- tạo bảng TypeQuestion
CREATE TABLE TypeQuestion(
	TypeID 		INT,
	TypeName 	VARCHAR(50)
);
-- tạo bảng CategoryQuestion
CREATE TABLE CategoryQuestion(
	CategoryID 		INT,
	CategoryName 	VARCHAR(50)
);
-- tạo bảng Question
CREATE TABLE  Question(
	QuestionID 	INT,
	Content  	VARCHAR(50),
	CategoryID 	INT,
	TypeID 		INT,
	CreatorID	 INT,
	CreateDate 	 DATE
);
-- tạo bảng Answer
CREATE TABLE Answer(
	AnswerID 	INT,
	Content 	VARCHAR (50),
	QuestionID 	INT,
	isCorrect 	VARCHAR(50)
);
-- tạo bảng Exam
CREATE TABLE Exam(
	ExamID 		 INT,
	`Code` 		 VARCHAR(50),
	Title 		 VARCHAR(50),
	CategoryID 	 INT,
	Duration 	 VARCHAR(50),
	CreatorID 	 INT,
	CreateDate   DATE
);
-- tạo bảng ExamQuestion
CREATE TABLE ExamQuestion(
	ExamID     	INT,
	QuestionID 	INT
);







-- Exercise 1:Design a table 
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
-- Question 2: thêm trường VTI_Account với điều kiện not null & unique

DROP DATABASE IF EXISTS FresherManagement;
CREATE DATABASE  FresherManagement;
USE FresherManagement;

CREATE TABLE Trainee(
	TraineeID		 TINYINT UNSIGNED UNIQUE KEY NOT NULL,
    VTI_Account      VARCHAR(50) UNIQUE KEY NOT NULL,
	Full_Name		 VARCHAR(50) NOT NULL,
	Birth_Date  	 DATE NOT NULL,
	Gender			 ENUM('Male','Female','unkown'),
	ET_IQ			 TINYINT UNSIGNED NOT NULL, 
	ET_Gmath	     TINYINT UNSIGNED NOT NULL,
	ET_English		 TINYINT UNSIGNED NOT NULL,
	Training_Class   VARCHAR(30) NOT NULL,
	Evaluation_Notes VARCHAR(50) NOT NULL
);     

-- Exercise 2: Data Types
CREATE TABLE DataTypes1(
ID			 MEDIUMINT UNSIGNED UNIQUE KEY PRIMARY KEY,
`Name`		 VARCHAR(100),
`Code`		 VARCHAR(50) UNIQUE KEY,
ModifiedDate DATETIME
);

-- Exercise 3: Data Types (2)
CREATE TABLE DataTypes2(
ID				MEDIUMINT UNSIGNED UNIQUE KEY PRIMARY KEY,
`Name`			VARCHAR(100),
BirthDate		DATE,
Gender			ENUM('Male','Female','Unkown'),
IsDeletedFlag   ENUM('0','1')
);









DROP DATABASE IF EXISTS testingsystem_assignment_extra_6;
CREATE DATABASE testingsystem_assignment_extra_6;
use testingsystem_assignment_extra_6;


CREATE TABLE Employee
(
	EmployeeID           INT AUTO_INCREMENT PRIMARY KEY,
	EmployeeLastName     NVARCHAR(50) NOT NULL,
	EmployeeFirstName    NVARCHAR(50) NOT NULL,
	EmployeeHireDate 		 DATETIME DEFAULT NOW(),
	EmployeeStatus       BIT NOT NULL,
	SupervisorID         INT NOT NULL,
	SocialSecurityNumber VARCHAR(50) NOT NULL,
	FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE Projects
(
	ProjectID            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	-- EmployeeID					 INT  NOT NULL,
	ProjectName          VARCHAR(50) NOT NULL,
	ProjectStartDate 		 DATETIME DEFAULT NOW(),
	ProjectDescription   VARCHAR(255) NULL,
	ProjectDetail        VARCHAR(255) NULL,
	ProjectCompletedOn   DATETIME DEFAULT NOW()
		-- FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
); 


CREATE TABLE Project_Modules
(
	ModuleID                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ProjectID                 INT UNSIGNED NOT NULL,
	ProjectModulesDate    		DATETIME DEFAULT NOW(),
	ProjectModulesCompletedOn DATETIME DEFAULT NOW(),
	ProjectModulesDescription VARCHAR(255) NULL,
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
); 


CREATE TABLE Work_Done
(
	WorkDoneID          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	EmployeeID          INT NOT NULL,
	ModuleID            INT UNSIGNED NOT NULL,
	WorkDoneDate    DATETIME DEFAULT NOW(),
	WorkDoneDescription VARCHAR(255) NULL,
	WorkDoneStatus      BIT(1) NULL,
	FOREIGN KEY (ModuleID) REFERENCES Project_Modules(ModuleID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Employee
VALUES	
(1, 'Đoàn Minh', 'Giang', '2019-06-06 00:00:00', b'1', 1, 'SS001'),
(2, 'Trương Việt', 'Anh', '2019-07-06 00:00:00', b'1', 1, 'SS002'),
(3, 'Nguyễn Đức', 'Mạnh', '2019-08-06 00:00:00', b'1', 2, 'SS003'),
(4, 'Nguyễn Văn', 'Đạt', '2019-07-06 00:00:00', b'0', 2, 'SS004'),
(5, 'Phạm Ngọc', 'Sơn', '2021-07-06 09:00:44', b'1', 4, 'SS005');

INSERT INTO `projects` VALUES
(1, 'Java', '2021-06-06 00:00:00', 'Dự án Java', 'Làm đúng hạn', '2020-08-06 00:00:00'),
(2, 'C#', '2021-07-06 00:00:00', 'Dự án C#', 'Làm trước hạn', '2020-12-06 00:00:00'),
(3, 'Android', '2021-08-06 00:00:00', 'Dự án Android', 'Làm quá hạn', '2021-3-06 00:00:00'),
(4, 'C++', '2021-07-06 00:00:00', 'Dự án C++', 'Làm trước hạn', '2021-6-06 00:00:00'),
(5, 'PHP', '2021-07-06 09:05:35', 'Dự án PHP', 'Làm đúng hạn', '2021-7-06 09:05:35');

INSERT INTO `project_modules` VALUES
(1, 1, '2019-06-06 00:00:00', '2019-06-06 00:00:00', 'Làm đúng hạn'),
(2, 2, '2019-07-06 00:00:00', '2019-06-06 00:00:00', 'Làm trước hạn'),
(3, 3, '2019-08-06 00:00:00', '2019-09-06 00:00:00', 'Làm quá hạn'),
(4, 4, '2019-07-06 00:00:00', '2019-06-06 00:00:00', 'Làm trước hạn'),
(5, 5, '2021-07-06 09:09:31', '2021-08-06 09:09:31', 'Làm đúng hạn');

INSERT INTO `work_done` VALUES
(1, 1, 1, '2019-06-06 00:00:00', 'Hoàn thành', b'1'),
(2, 2, 2, '2019-07-06 00:00:00', 'Hoàn thành - kiểm duyệt', b'1'),
(3, 3, 3, '2019-08-06 00:00:00', 'Trong tiến trình', b'0'),
(4, 1, 4, '2019-07-06 00:00:00', 'Đang hoàn thành', b'0'),
(5, 5, 5, '2021-07-06 09:12:58', 'Trong tiến trình', b'1');



-- bài làm 2:
-- Viết stored procedure (không có parameter) để Remove tất cả thông tin 
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã 
-- remove từ các table liên quan trong khi removing (dùng lệnh print)
DROP PROCEDURE IF EXISTS CAU_2;
delimiter $$
CREATE PROCEDURE CAU_2()
BEGIN 
-- tạo biến
DECLARE DEL_projects TINYINT;
DECLARE DEL_project_modules TINYINT;
DECLARE DEL_work_done TINYINT;
-- đếm dữ liệu data của bảng project
SELECT count(*)  INTO DEL_projects
FROM projects WHERE ProjectCompletedOn <= now()- interval 3 month;
-- ĐẾM DỮ LIỆU CỦA BẢNG project_modules
SELECT COUNT(*)  INTO DEL_project_modules
FROM project_modules WHERE ProjectID IN(SELECT ProjectID FROM projects WHERE ProjectCompletedOn <= now() - INTERVAL 3 month);
-- đếm dữ liệu của bảng work_done
SELECT COUNT(*) INTO DEL_work_done
FROM work_done 
WHERE ModuleID IN(SELECT ModuleID FROM project_modules WHERE ProjectID IN(SELECT ProjectID FROM projects WHERE ProjectCompletedOn <= now() - INTERVAL 3 month) );
 -- SELECT BIẾN 
 SELECT "số dữ liệu bị xoá ở bảng projects:" as mo_ta,DEL_projects as ket_qua
 union
 SELECT "số dữ liệu bị xoá ở bảng project_modules:" as mo_ta,DEL_project_modules as ket_qua
 union
 SELECT "số dữ liệu bị xoá ở bảng work_done:" as mo_ta,DEL_work_done as ket_qua;
 -- XOÁ BẢN GHI Ở work_done
DELETE FROM work_done WHERE ModuleID IN(SELECT ModuleID FROM project_modules WHERE ProjectID 
IN(SELECT ProjectID FROM projects WHERE ProjectCompletedOn <= now() - INTERVAL 3 month) );
-- XOÁ BẢN GHI Ở project_modules
DELETE FROM project_modules WHERE ProjectID IN(SELECT ProjectID FROM projects WHERE ProjectCompletedOn <= now() - INTERVAL 3 month);

-- XOÁ BẢN GHI Ở PROJECT
DELETE FROM projects WHERE ProjectCompletedOn <= now()- interval 3 month;
END$$
delimiter ;



call CAU_2();

-- câu 3:
DROP PROCEDURE IF EXISTS CAU_3;
delimiter $$
CREATE PROCEDURE CAU_3()
BEGIN
SELECT *
FROM project_modules
WHERE ProjectModulesCompletedOn > NOW();
END$$
delimiter ;

CALL CAU_3();

-- CÂU 4:
SELECT a.EmployeeID,A.EmployeeLastName,A.EmployeeFirstName
FROM employee a 
LEFT JOIN work_done b 
ON  a.EmployeeID= b.EmployeeID
WHERE b.EmployeeID IS NULL;










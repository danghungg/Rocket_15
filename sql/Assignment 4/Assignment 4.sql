DROP DATABASE IF EXISTS quản_lý_Employee;
CREATE DATABASE  quản_lý_Employee;
USE quản_lý_Employee;


CREATE TABLE Department(
Department_Number	TINYINT AUTO_INCREMENT PRIMARY KEY,
Department_Name		VARCHAR(50) NOT NULL
);

CREATE TABLE Employee_Table(
Employee_Number		TINYINT AUTO_INCREMENT PRIMARY KEY,
Employee_Name		VARCHAR(50) NOT NULL,
Department_Number	TINYINT,
FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

CREATE TABLE Employee_Skill_Table(
Employee_Number     TINYINT,
Skill_Code			VARCHAR(30),
Date_Registered		DATETIME DEFAULT now(),
FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number)
);
-- -------------------------------insert dữ liệu------------------------------
INSERT INTO Department(Department_Name)
VALUE				  ('Giám đốc'),
					  ('trưởng phòng'),
                      (' Sale'),
                      ('bảo vệ'),
                      ('Tiếp Tân'),
                      ('Marketing'),
                      ('Thực tập sinh'),
                      ('no person'),
                      ('Lập trình viên'),
                      ('giao dịch viên');
                      
INSERT INTO Employee_Table(Employee_Name,Department_Number)
VALUE					  ('Đặng Quốc Hưng', 1),
						  ('Nguyễn Minh Triết', 3),
                          ('Phùng Thế Thành', 2),
                          ('Nguyễn Minh Ngọc',5),
                          ('Đặng Văn Tiến', 4),
                          ('Trịnh Xuân Kiên', 3),
                          ('Trần Minh Tâm', 7),
                          ('Nguyễn Minh Anh', 5),
                          ('Lê Đức Anh', 6),
                          ('Đào Duy Mạnh', 10);
 
 INSERT INTO Employee_Skill_Table (Employee_Number,Skill_Code,Date_Registered)     
 VALUE                            (2,'Java','2020-12-04'),
								  (1,'SQL',NULL),
                                  (1,'Postman','2019-11-04'),
                                  (1,'C++','2019-11-04'),
                                  (6,'Python','2019-12-14'),
                                  (5,'C Sharp','2020-10-11'),
                                  (6,'Python','2020-12-04'),
                                  (7,'C++','2021-02-14'),
                                  (8,'C Sharp','2020-01-14'),
                                  (10,'C++','2020-11-18');
                                  
 -- -----------------------------BÀI TẬP BUỔI 4 --------------------------------------
 -- CÂU 3:Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
 SELECT a.Employee_Name,b.Skill_Code
 FROM  employee_table a 
 LEFT JOIN employee_skill_table b 
 ON 	a.Employee_Number=b.Employee_Number
 WHERE 	b.Skill_Code= 'Java';
 
 -- câu 4:Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
 SELECT a.Department_Name,GROUP_CONCAT(b.Employee_Name), count(b.Employee_Number)
 FROM department a
 RIGHT JOIN employee_table b 
 ON   a.Department_Number=b.Department_Number
 GROUP BY b.Department_Number
 HAVING count(b.Employee_Number)>= 2;
 
 -- Câu 5:Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban. 
 SELECT a.Department_Name,GROUP_CONCAT(B.Employee_Name)
 FROM  department a
 RIGHT JOIN employee_table b 
 ON a.Department_Number=b.Department_Number
 GROUP BY b.Department_Number;
 -- CAU 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT a.Employee_Name,GROUP_CONCAT(b.Skill_Code),COUNT(1)
FROM  employee_table a 
RIGHT JOIN employee_skill_table b 
ON a.Employee_Number=b.Employee_Number
GROUP BY b.Employee_Number
HAVING COUNT(b.Skill_Code)>1;
 -- hướng dẫn sử dụng  DISTINCT

 SELECT DISTINCT Employee_Name
 FROM employee_table;
 
 
 
 
 
 
 
 
 
                              
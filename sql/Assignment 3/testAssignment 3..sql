DROP DATABASE IF EXISTS quản_lý_fresher;
CREATE DATABASE  quản_lý_fresher;
USE quản_lý_fresher;

CREATE TABLE Trainee (
			TraineeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Full_Name VARCHAR(100) NOT NULL,
			Birth_Date DATE NOT NULL,
			Gender ENUM('male', 'female', 'unknown'),
			ET_IQ TINYINT NOT NULL,CHECK (ET_IQ <= 20),
			ET_Gmath TINYINT NOT NULL,CHECK (ET_IQ <= 20) ,
			ET_English TINYINT NOT NULL,CHECK (ET_IQ <= 50),
			Training_Class VARCHAR(50) NOT NULL,
			Evaluation_Notes TEXT
);

-- --------------------- INSRERT DỮ LIỆU -----------------------------------------
INSERT INTO Trainee (Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
			VALUE	( 'Đặng Quốc Hưng', '1998-08-27','male',15,14,29,'rocket 15',' học 246'),
					('Đặng Văn Hưng', '1999-08-27','male',10,6,40,'rocket 15',' học 246'),
                    ('Đặng Quốc Trung', '2000-08-27','male',5,2,9,'rocket 15',' học 246'),
                    ('Ngô Quốc Hưng', '1998-04-17','male',20,15,49,'rocket 15',' học 246'),
                    ('Nguyễn Thị Lan', '2000-08-07','female',11,9,39,'rocket 15',' học 246'),
                    ('Từ Ngọc Tú', '1996-03-16','male',5,20,20,'rocket 15',' học 246'),
                    ('Lại Thị Nhài', '2002-11-23','female',8,10,20,'rocket 15',' học 246'),
                    ('Ngô Đình Trọng', '2000-11-09','male',15,14,50,'rocket 15',' học 246'),
                    ('Trần Đức Anh', '1999-06-13','male',14,11,23,'rocket 15',' học 246'),
                    ('Đào Mai Lan', '2000-03-11','unknown',11,12,23,'rocket 15',' học 246');
                    
                    
-- bài2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, 
-- nhóm chúng thành các tháng sinh khác nhau
SELECT month(Birth_Date), GROUP_CONCAT(Full_Name), COUNT(1) AS SO_NHAN_VIEN
FROM trainee
GROUP BY month(Birth_Date);
                    
-- BÀI 3:  Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: 
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT Full_Name,2021 - YEAR(Birth_Date),char_length(Full_Name)
FROM trainee
ORDER BY char_length(Full_Name) DESC;

SELECT Full_Name 
FROM  trainee
WHERE char_length(Full_Name)= 15;

-- BÀI 4:Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là 
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

SELECT Full_Name
FROM trainee
WHERE ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18 AND
	(ET_IQ + ET_Gmath)>=20;
    
    -- BÀI 5: xóa thực tập sinh có TraineeID =  3

    DELETE 
    FROM trainee
    WHERE TraineeID = 3;
    
    -- BÀI 6:Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật 
-- thông tin vào database
    UPDATE trainee
    SET  Training_Class ='LỚP 2'
    WHERE TraineeID = 5;






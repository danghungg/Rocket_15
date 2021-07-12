-- câu 1: : Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo 
 -- trước 1 năm trước
DROP TRIGGER IF EXISTS cam_nhap_group;
 delimiter $$
 CREATE TRIGGER cam_nhap_group
 BEFORE INSERT ON `group`
 FOR EACH ROW
 BEGIN
 IF NEW.CreateDate< NOW()- INTERVAL 1 YEAR THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT ='KHÔNG NHẬP NGÀY TẠO GROUP 1 NĂM VỀ TRƯỚC';
                END IF;
 END$$
 delimiter ;
 INSERT INTO `Group`(GroupName, CreatorID,CreateDate)
VALUES
					 (N'Testing', 5 ,'2020-0-05');
-- Error Code: 1644. KHÔNG NHẬP NGÀY TẠO GROUP 1 NĂM VỀ TRƯỚC
--  câu 2:Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào 
 -- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
--  "Sale" cannot add more user"
DROP TRIGGER IF EXISTS cam_nhap_Sale;
delimiter $$
CREATE TRIGGER cam_nhap_Sale
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
IF NEW.DepartmentID = 2 THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT='Department "Sale" cannot add more user';
        END IF;
END$$

delimiter ;

INSERT INTO `Account`(Email,Username,FullName,Gender,DepartmentID,PositionID,CreateDate)
VALUES
('NGUYENminhchcung@gmail.com',',minh','Nguyễn Minh Chung','M',2,1,'2020-03-05' );

-- Error Code: 1644. Department "Sale" cannot add more user
-- câu 3:Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS cau_hinh_group;
delimiter $$
CREATE TRIGGER cau_hinh_group
BEFORE INSERT ON groupaccount
FOR EACH ROW
BEGIN
DECLARE DEM_USER TINYINT;
SELECT COUNT(1)  INTO DEM_USER
FROM  `groupaccount`
 WHERE GroupID=NEW.GroupID
GROUP BY GroupID;

SELECT COUNT(AccountID) 
FROM groupaccount
WHERE GroupID = 1;

		IF DEM_USER = 5 THEN 
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT='FULL NGƯỜI DÙNG';
        END IF;


END$$
delimiter ;

INSERT INTO `GroupAccount` (GroupID , AccountID , JoinDate)
 VALUES
					( 1 , 8 ,'2020-03-05');
-- Error Code: 1644. FULL NGƯỜI DÙNG

-- CÂU 4:Cấu hình 1 bài thi có nhiều nhất là 2 Question( cần phải hỏi )
DROP TRIGGER IF EXISTS	cau_hinh_exam;
DELIMITER $$
CREATE TRIGGER cau_hinh_exam
BEFORE INSERT ON examquestion
FOR EACH ROW
BEGIN
DECLARE DEM_CAU_HOI TINYINT;
SELECT COUNT(ExamID) INTO DEM_CAU_HOI
 FROM examquestion
WHERE ExamID= NEW.ExamID;
		IF DEM_CAU_HOI > 2 THEN
        SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT='MỘT BÀI KIỂM TRA CHỈ ĐƯỢC CÓ 2 CÂU HỎI';
            END IF;

END$$
DELIMITER ;

INSERT INTO examquestion(ExamID,QuestionID)
VALUE(4,5),
	 (4,2);

-- câu 5:Tạo trigger không cho phép người dùng xóa tài khoản có email là 
 -- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
--  còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông 
--  tin liên quan tới user đó
DROP TRIGGER IF EXISTS xoá_tai_khoan;
delimiter $$
CREATE TRIGGER xoá_tai_khoan
BEFORE DELETE ON `account`
FOR EACH ROW
BEGIN
IF	OLD.Email= 'admin@gmail.com' THEN
	SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT ='đây là tài khoản admin, không cho phép user xóa';
    END IF;
END$$
delimiter ;


DELETE
FROM `account`
WHERE Username= 'Hưng';

-- Error Code: 1644. đây là tài khoản admin, không cho phép user xóa


-- CÂU 6:: Không sử dụng cấu hình default cho field DepartmentID của table 
 -- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền 
--  vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

INSERT INTO department(DepartmentName)
VALUE ('waiting Department');


DROP TRIGGER IF EXISTS waiting_deparment;
delimiter $$
CREATE TRIGGER waiting_deparment
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
DECLARE waitting_room TINYINT;
SELECT DepartmentID INTO waitting_room
FROM department
WHERE DepartmentName= 'waiting Department';

	IF NEW.DepartmentID IS NULL THEN
	SET	NEW.DepartmentID = waitting_room;
    END IF;
	
END$$
delimiter ;

INSERT INTO `Account`(Email,Username,FullName,Gender,DepartmentID,PositionID,CreateDate)
VALUES
('NGUYENminhchcung@gmail.com','minh','Nguyễn Minh Chung','M',NULL,1,'2020-03-05' );

-- CÂU 7:Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi 
 -- question, trong đó có tối đa 2 đáp án đúng.
 DROP TRIGGER IF EXISTS cau_hinh_ques;
 delimiter $$
 CREATE TRIGGER cau_hinh_ques
 BEFORE INSERT ON answer
 FOR EACH ROW
 BEGIN 
 DECLARE dem_answers tinyint;
 DECLARE dem_correct tinyint;
 SELECT count(QuestionID) into dem_answers
 FROM answer
 WHERE QuestionID=NEW.QuestionID;

	
SELECT count(isCorrect) into dem_correct
FROM answer
 WHERE  isCorrect =1 AND  isCorrect=NEW.isCorrect;

if dem_answers >= 4 OR dem_correct > 1 THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT ='LỖI CẤU HÌNH';
            END IF;
 END$$
 delimiter ;
 
 
 INSERT INTO answer (`Content`, `QuestionID`, `isCorrect`)
 VALUE ('Tra loi 18', 1, 0);
 -- Error Code: 1644. LỖI CẤU HÌNH

 INSERT INTO answer (`Content`, `QuestionID`, `isCorrect`)
 VALUE ('Tra loi 11', 2, 1);
 -- Error Code: 1644. LỖI CẤU HÌNH
 
-- câu 8:Viết trigger sửa lại dữ liệu cho đúng: 
 -- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định 
--  Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
DROP TRIGGER IF EXISTS fix_gender;
delimiter $$
CREATE TRIGGER fix_gender
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
IF NEW.Gender LIKE'nam' THEN 
	SET NEW.Gender= 'M';
   
ELSEIF NEW.Gender LIKE 'nữ' THEN 
	SET NEW.Gender= 'F';
    
ELSEIF NEW.Gender like '%xác%' THEN 
	SET NEW.Gender= 'U';
    END IF;
END$$
delimiter ;
  INSERT INTO `Account`(Email,Username,FullName,Gender,DepartmentID,PositionID,CreateDate)
VALUES
					('Dangquochung1998@gmail.com','Hng','Đặng Hưng','nam','5','1','2020-03-05' ),
					('ngobakha199@gmail.com','Bnh','Ngô Khá','chưa xác định','2','2','2020-03-05' );
 
 
-- CÂU 9:Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS cam_xoa;
delimiter $$
CREATE TRIGGER cam_xoa 
BEFORE DELETE ON exam
FOR EACH ROW
BEGIN 
		IF OLD.CreateDate >= (now() - INTERVAL 2 DAY) THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT='CẤM XOÁ';
                END IF;
END$$
delimiter ;

DELETE 
FROM exam
WHERE ExamID= 1;
-- Error Code: 1644. CẤM XOÁ

-- CÂU 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

SELECT *, CASE 
				WHEN Duration <= 30 THEN "Short time"
                WHEN   30 < Duration <= 60 THEN  "Medium time"
				WHEN  Duration > 60 THEN "Long time"
                END AS 'thoi_gian_thi'
FROM exam;


-- câu 13:Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên 
 -- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 2 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 4 và > 2 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 4 thì sẽ có giá trị là higher

SELECT COUNT(AccountID) , CASE 
					WHEN COUNT(AccountID) <= 2 THEN 'few'
                    WHEN 2 <COUNT(AccountID) <= 4 THEN 'normal'
                    WHEN COUNT(AccountID) >4 THEN 'higher'
                    end AS the_number_user_amount
FROM groupaccount
GROUP BY GroupID;


-- câu 14:Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào 
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"

SELECT  b.DepartmentName , count(a.AccountID) , case 
							when count(a.AccountID)=0 then "Không có User" 
                            when count(a.AccountID) >0 then "có user"
                            end AS Title
FROM `account` a 
RIGHT JOIN department b 
ON a.DepartmentID=b.DepartmentID
GROUP BY b.DepartmentID;















































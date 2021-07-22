package assignment_2;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;




public class time {
	public static void main(String[] args) {
		// department
				department department1 = new department();
				department1.id = 1;
				department1.name = "Sale";

				department department2 = new department();
				department2.id = 2;
				department2.name = "Marketting";

				department department3 = new department();
				department3.id = 3;
				department3.name = "Kế toán";

				// position
				
				Position position1 = new Position();
				position1.id = 1;
				position1.name = PositionName.DEV;

				Position position2 = new Position();
				position2.id = 2;
				position2.name = PositionName.MASTER;

				Position position3 = new Position();
				position3.id = 3;
				position3.name = PositionName.PM;

				Position position4 = new Position();
				position4.id = 4;
				position4.name = PositionName.SCRUM;
		Account account1 = new Account();
		account1.id = 1;
		account1.userName = "hưng";
		account1.fullName ="Đặng Quốc Hưng";
		account1.department = department1;
		account1.email = "dangquochung1998ha@gmail.com";
		account1.position = position1;
		account1.createDate =new Date(2020, 4, 5);

		Account account2 = new Account();
		account2.id = 2;
		account2.userName = "Hùng";
		account2.fullName ="Đặng Văn Hùng";
		account2.department = department2;
		account2.email = "dangvanhung2000ha@gmail.com";
		account2.position = position2;
		account2.createDate = new Date(2020, 12, 5);

		Account account3 = new Account();
		account3.id = 3;
		account3.userName = "Long";
		account3.fullName ="Nguyễn Mạnh Long";
		account3.department = department3;
		account3.email = "nguyenmanhlongha@gmail.com";
		account3.position = position4;
		account3.createDate =new Date(2021, 4, 22);
		
		System.out.println(account1.createDate);
		
	Locale locale1= new Locale("vi","VI");
		DateFormat dateformat1=DateFormat.getDateInstance(DateFormat.DEFAULT,locale1);
		String date1=dateformat1.format(account1.createDate);
		System.out.println(date1);
		
//		String pattern ="MM-dd-YYYY";
//		SimpleDateFormat simpledateformat =new SimpleDateFormat(pattern);
//		String date = simpledateformat.format(account2.createDate);
//		
//		System.out.println(date);
		

	}
	}


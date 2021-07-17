package assignment_2;

import java.awt.DefaultFocusTraversalPolicy;
import java.text.DateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;

public class program {
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
		// account
		Account account1 = new Account();
		account1.id = 1;
		account1.userName = "hưng";
		account1.fullName ="Đặng Quốc Hưng";
		account1.department = department1;
		account1.email = "dangquochung1998ha@gmail.com";
		account1.position = position1;
		account1.createDate = new Date(2020, 4, 5);

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
		account3.createDate = new Date(2021, 4, 22);

		// group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Java";

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "C#";

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "SQL";

		Group group4 = new Group();
		group4.id = 4;
		group4.name = "C++";

		// TypeQuestion
		TypeQuestion typeQuestion1 = new TypeQuestion();
		typeQuestion1.id =1;
		typeQuestion1.name="Essay";
		
		TypeQuestion typeQuestion2 = new TypeQuestion();
		typeQuestion2.id =2;
		typeQuestion2.name="Multiple-Choice";
		
		// CategoryQuestion
		CategoryQuestion categoryQuestion1=new CategoryQuestion();
		categoryQuestion1.id =1;
		categoryQuestion1.name="Java";
		
		CategoryQuestion categoryQuestion2=new CategoryQuestion();
		categoryQuestion2.id =2;
		categoryQuestion2.name="NET";
		
		CategoryQuestion categoryQuestion3=new CategoryQuestion();
		categoryQuestion3.id =3;
		categoryQuestion3.name="SQL";
		
		CategoryQuestion categoryQuestion4=new CategoryQuestion();
		categoryQuestion4.id =4;
		categoryQuestion4.name="Postman";
		
		CategoryQuestion categoryQuestion5=new CategoryQuestion();
		categoryQuestion5.id =5;
		categoryQuestion5.name="Ruby";
		
		//Question
		Question question1 = new Question();
		question1.id = 1;
		question1.content="câu hỏi 1:";
		question1.Category=categoryQuestion1;
		question1.Creator=account1;
		question1.Type=typeQuestion1;
		question1.CreateDate=LocalDate.of(2020, 12, 12);
		
		Question question2 = new Question();
		question2.id = 2;
		question2.content="câu hỏi 2:";
		question2.Category=categoryQuestion2;
		question2.Creator=account2;
		question2.Type=typeQuestion2;
		question2.CreateDate=LocalDate.of(2020, 2, 2);
		

		Question question3 = new Question();
		question3.id = 3;
		question3.content="câu hỏi 3:";
		question3.Category=categoryQuestion3;
		question3.Creator=account3;
		question3.Type=typeQuestion1;
		question3.CreateDate=LocalDate.of(2020, 12, 2);
		
		// Answer
		Answer answer1 =new Answer();
		answer1.id =1;
		answer1.content="câu trả lời1:";
		answer1.iscorrect=false;
		answer1.question=question1;
		
		Answer answer2 =new Answer();
		answer2.id =2;
		answer2.content="câu trả lời2:";
		answer2.iscorrect=false;
		answer2.question=question2;
		
		Answer answer3 =new Answer();
		answer3.id =3;
		answer3.content="câu trả lời3:";
		answer3.iscorrect=false;
		answer3.question=question3;
		
		
		//Exam 
		Exam exam1= new Exam();
		exam1.id =1;
		exam1.code="M1001";
		exam1.title="bài kiểm tra 1:";
		exam1.Category=categoryQuestion1;
		exam1.Duration="15p";
		exam1.CreateDate=LocalDate.of(2021, 12, 22);
		
		Exam exam2= new Exam();
		exam2.id =2;
		exam2.code="M1002";
		exam2.title="bài kiểm tra 2:";
		exam2.Category=categoryQuestion3;
		exam2.Duration="30p";
		exam2.CreateDate=LocalDate.of(2021, 10, 20);
		
		
		Exam exam3= new Exam();
		exam3.id =3;
		exam3.code="M1003";
		exam3.title="bài kiểm tra 3:";
		exam3.Category=categoryQuestion4;
		exam3.Duration="60p";
		exam3.CreateDate=LocalDate.of(2021, 11, 12);
		
		// Group[] of account
		Group[] groupofaccount1 = { group1, group2 };
		account1.groups = groupofaccount1;

		Group[] groupofaccount2 = { group2 };
		account2.groups = groupofaccount2;

		Group[] groupofaccount3 = { group1, group2, group3 };
		account3.groups = groupofaccount3;
		
		
		//exam[] of Question
		Exam[] examsofquestion1= {exam1,exam2};
		question1.exams=examsofquestion1;
		
		Exam[] examsofquestion2= {exam3,exam2};
		question2.exams=examsofquestion2;
		
		Exam[] examsofquestion3= {exam1,exam3};
		question3.exams=examsofquestion3;
		
		//creators[] of Exam
		Account[] creatorOfExam1= {account1,account2};
		exam1.Creators=creatorOfExam1;
		
		Account[] creatorOfExam2= {account3,account2};
		exam2.Creators=creatorOfExam2;
	
		Account[] creatorOfExam3= {account1,account3};
		exam3.Creators=creatorOfExam3;
		
		
		// in ra
//		System.out.println(" thông tin phòng ban 1: ");
//		System.out.println(department1.name);
//		
//		System.out.println(account1.userName);
//		
//		System.out.println("\n");
//		
//		System.out.println(" thông tin account1: ");
//		System.out.println("Tên Account1 :"+account1.fullName);
//		System.out.println("email Account1 :"+account1.email);
//		System.out.println("deppartment Account1 :"+account1.department.id);
//		System.out.println("position Account1 :"+account1.position.id);
//		System.out.println("CreateDate của Account1 :"+account1.createDate);
//		
//
		System.out.println(account2.createDate);
		
		
		Locale locale = new Locale("fr","FR");
		DateFormat dateformat=DateFormat.getDateInstance(DateFormat.DEFAULT,locale);
		
		String date=dateformat.format(account2.createDate);
		System.out.println(date);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}

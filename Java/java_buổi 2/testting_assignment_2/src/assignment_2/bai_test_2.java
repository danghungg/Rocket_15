package assignment_2;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class bai_test_2 {
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
				
				// account of group
				Account[] accountOfGroup1= {account1,account2};
				group1.accounts= accountOfGroup1;
				

				Account[] accountOfGroup2= {account3,account2};
				group2.accounts= accountOfGroup2;

				Account[] accountOfGroup3= {account1,account2,account3};
				group3.accounts= accountOfGroup3;
				
				Account[] accountOfGroup4= {account1,account2,account3};
				group4.accounts= accountOfGroup4;
				// group of account:
				Group[] groupOfAccount1= {group1,group3,group4};
				account1.groups= groupOfAccount1;
				
				Group[] groupOfAccount2= {group1,group2,group3,group4};
				account2.groups= groupOfAccount2;
				
				Group[] groupOfAccount3= {group2,group3,group4};
				account3.groups= groupOfAccount3;
				
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
			
				//IF
			// câu1:
			if(account2.department == null) {
				System.out.println("Nhân viên không có phòng ban");
			}else {
				System.out.println("phòng ban của nhân viên là: "+
			account2.department.name);
			}
				
			// câu 2:
			if(account2.groups == null) {
				System.out.println(" \nnv này không có phòng ban");
			}else if(account2.groups.length==1||account2.groups.length==2)
			{
				System.out.println("\"Group của nhân viên \r\n"
						+ "này là Java Fresher, C# Fresher");
			}else if(account2.groups.length==3) {
				System.out.println("Nhân viên này là người \r"
						+ "quan trọng, tham gia nhiều group");
			}else if(account2.groups.length==4){
				System.out.println("Nhân viên này là \r"
						+ "người hóng chuyện, tham gia tất cả các group");
			}
				
			// câu 3:
			
			System.out.println(account2.department==null?
					"nv này không có phòng ban":
					"phòng ban của nhân viên này là: "+account2.department.name );	
				
			// câu 4:	
			System.out.println(account1.position.name.name()== "dev"?
					 "nhân viên này là deverlop":"nhân viên này không phải là dev");
				
			System.out.println(" phần switch case");
			// SWITCH CASE
			// bài 5:
			
			int accountOfGroup_1=group1.accounts.length;
			switch(accountOfGroup_1) {
			case 1:
				System.out.println("\nNhóm có một thành viên");
				break;
			case 2:
				System.out.println("\nNhóm có hai thành viên");
				break;
			case 3:
				System.out.println("\nNhóm có ba thành viên");
				break;
			}
			
			// bài 6:
			if(account2.groups==null) {
				System.out.println("\"Nhân viên này chưa có group");
			}else {
			int groupOfAccount_2 = account2.groups.length;
			switch(groupOfAccount_2) {
			case 1:
				System.out.println("Group của nhân viên\r"
						+ "này là Java Fresher, C# Fresher");
				break;
			case 2:
				System.out.println("Group của nhân viên \r"
						+ "này là Java Fresher, C# Fresher");
				break;
			case 3:
				System.out.println("Nhân viên này là người\r" 
						+"quan trọng, tham gia nhiều group");
				break;
			case 4:
				System.out.println("Nhân viên này là\r"
						+"người hóng chuyện, tham gia tất cả các group");
				break;
			}
			}
			// câu 7:
			
			String departmentOfAccount2=account2.position.name.toString();
			switch(departmentOfAccount2) {
			case "DEV":
				System.out.println("Đây là Developer");
				break;
			default:
				System.out.println("Người này không phải là Developer");
				break;
			}
			System.out.println(" phần for each");
			// bài 8:

			Account[] accray= {account1,account2,account3};
			for(Account account:accray) {
				System.out.println("email: "+account.email+"\nfullname: "+account.fullName+"\ndepartmentName: "+account.department.name);
			}
			
			// câu 9:
			department[] deparray= {department1,department2,department3};
			for(department i:deparray) {
	System.out.println("\nid: "+i.id+"\ndepartmentName: "+i.name);
			}
			
			System.out.println(" FOR");
			// câu 10:
			Account[] AccArray= {account1,account2,account3};
			for(int i=0;i<AccArray.length;i++) {
				System.out.println("\nEmail: "+AccArray[i].email);
				System.out.println("\nfullName: "+AccArray[i].fullName);
				System.out.println("\ndepartment: "+AccArray[i].department.name);
			}
			
			// CÂU 11:
			department[] departArray= {department1,department2,department3};
			for(int a=0;a<departArray.length;a++) {
				System.out.println("\nid: "+departArray[a].id);
				System.out.println("\nName: "+departArray[a].name);
			}
			//câu 12:
			department[] departArray1= {department1,department2,department3};
			for(int a=0;a<2;a++) {
				System.out.println("\nid: "+departArray1[a].id);
				System.out.println("\nName: "+departArray1[a].name);
			}
			
			// câu 13:
			Account[] AccArray1= {account1,account2,account3};
			for(int i=0;i<AccArray.length;i++) {
				if(i!=1) {
					System.out.println("\nid: "+(i+1));
				System.out.println("\nEmail: "+AccArray1[i].email);
				System.out.println("\nfullName: "+AccArray1[i].fullName);
				System.out.println("\ndepartment: "+AccArray1[i].department.name);
				}
				}
			
			//cau14:In ra thông tin tất cả các account có id < 3
			Account[] AccArray2= {account1,account2,account3};
			for(int b=1;b<3;b++) {
				System.out.println("\nid: "+b);
				System.out.println("\n email: "+AccArray2[b].email);
				System.out.println("\n fullName: "+AccArray2[b].fullName);
				System.out.println("\n departmentName: "+AccArray2[b].department.name);
			}
			
			//câu15:
			for(int i=2;i<=20;i++) {
				if( i%2==0) {
					System.out.println(i);
				}
			}
			
			System.out.println("phần WHILE");
			//cau16:
			//10:
			Account[] accArray11= {account1,account2,account3};
			int i=1;
			while(i<3) {
				System.out.println("\nid: "+i);
				System.out.println("\n email: "+accArray11[i].email);
				System.out.println("\n fullName: "+accArray11[i].fullName);
				System.out.println("\n departmentName: "+accArray11[i].department.name);
			i++;
			}
			//11:
			department[] departArrays= {department1,department2,department3};
			int a=1;
			while(a<3) {
				System.out.println("\n id: "+a);
				System.out.println("\n Name: "+departArrays[a].name);
				a++;
			}
			
			//13:
Account[] account111= {account1,account2,account3};
int b=0;
while(b<3) {
	if(b!=1) {
		System.out.println("\n id: "+(b+1));
		System.out.println("\n fullname: "+account111[b].fullName);
		System.out.println("\n email: "+account111[b].email);
	}
	b++;
}
			
			//15:
int c=0;
while(c<=20) {
	if(c%2==0) {
		System.out.println(c);
	}
	c++;
}

	// câu 17:
//13:
Account[] account222= {account1,account2,account3};
int x=0;
do {if(x!=1){
		System.out.println("\nid: "+account222[x].id);
		System.out.println("\nemail: "+account222[x].email);
		System.out.println("\nfullName: "+account222[x].fullName);
}
		x++;
		
}while(x<3);

	// System out printf	
//câu 1:
			int y=5;
			System.out.printf("%d%n",y);
//cau2:
			
		int z=100000000;
		System.out.printf("%,d%n",z);
// câu 3:
		float g=5.567098f;
			System.out.printf("%5.4f%n",g);
			
			
// cau 4:
		String	f="Nguyễn Văn A";
		System.out.printf("%s%n",f);
		System.out.printf("tên tôi là: "+f+"\n và tôi đang đọc thân\n");	

// câu5:Lấy thời gian bây giờ và in ra theo định dạng sau:
		//24/04/2020 11h:16p:20s 
		String pattern="dd-MM-YYYY HH:mm:ss";
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat(pattern);
		String Date = simpleDateFormat.format(new Date());
		System.out.println(Date);
	// 	 Random Number	
		
// câu 6: 	
		Account[] ArrayAccounts= {account1,account2,account3};
		for(Account ac:ArrayAccounts) {
		System.out.printf("%n%s%n","Email: "+ac.email);
		System.out.printf("%30s%n","FullName: "+ac.fullName);
		System.out.printf("%45s%n","department: "+ac.department.name);
		}
		
		// Random Number
		//câu1:
		Random random=new Random();
		// vi du
		//câu2:
		float n=random.nextFloat();
		System.out.println(n);
		// câu 1:
		int n1=random.nextInt();
			System.out.println(n1);
		//câu3:
		String[] Array= {"a","b","c","d","e"};
		int n2=random.nextInt(Array.length);
		System.out.println(Array[n2]);
		// cau4:
		
		
		
		
		
		
		//		//Input from console
//			
//		// câu 1:
//		
//			Scanner scanner1 =new Scanner(System.in);
//			System.out.println("Mòi nhập số:");
//			int d= scanner1.nextInt();
//			System.out.println("bạn vừa nhập sô:"+d);
//			scanner1.close();
//		// câu2:
//			
//			Scanner scanner2 =new Scanner(System.in);
//			System.out.println("mời bạn nhâp");
//			float k=scanner2.nextFloat();
//			System.out.println("bạn vừa nhập số thực: "+k);
		// câu8:
		System.out.println("mời bạn nhập vào chức năng muốn sử dụng");
		Scanner scanner5=new Scanner(System.in);
		System.out.println("mời nhập số 1 để tạo Account:");
		int d5= scanner5.nextInt();
		System.out.println("");
			
	}
}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	


package testtitng_systemassignment_3;



public class dem {
	public static void main(String[] args) {
		//câu1:
//		String a="Đặng Quốc Hưng";
//		System.out.println(" số ký tự của chuỗi là:"+a.length());
	// câu2:
//		Scanner scanner=new Scanner(System.in);
//		System.out.println("nhập chuỗi 1:");
//		String b= scanner.next();
//		System.out.println("nhập chuỗi 2:");
//		String c= scanner.next();
//		System.out.println("b nói với c:"+b+" "+c);
//		scanner.close();
	// câu3:
//		Scanner scanner1= new Scanner(System.in);
//		System.out.println("mời nhập tên:");
//		String a1= scanner1.next();
//	gán cho chữ cái đầu thành chữ hoa:
//		String frista1=a1.substring(0, 1).toUpperCase();
//	 để nguyên các chữ cái đằng sau:
//		String remaininga1= a1.substring(1);
//		  a1= frista1+remaininga1;
//		System.out.println( a1);
//		scanner1.close();
	// câu 4:
//		Scanner scanner2=new Scanner(System.in);
//		System.out.println("mời nhập tên:");
//		String a2= scanner2.next();
//		String fa2= a2.substring(0,1).toUpperCase();
//		String sa2= a2.substring(1,2).toUpperCase();
//		String ta2= a2.substring(2,3).toUpperCase();
//		String ba2= a2.substring(3,4).toUpperCase();
//		System.out.println("ký tự 1:"+fa2);
//		System.out.println("ký tự 2:"+sa2);
//		System.out.println("ký tự 3:"+ta2);
//		System.out.println("ký tự 4:"+ba2);
//		scanner2.close();
		// cách dùng hàm for:
//		
//		Scanner scanner3=new Scanner(System.in);
//		System.out.println("mời nhập tên:");
//		String a3= scanner3.next();
//		a3=a3.toUpperCase();
//		for(int i=0;i<a3.length();i++) {
//			System.out.println("ký tự thứ "+i+1+" là: "+ a3.charAt(i) );
//		}
//		scanner3.close();
		
		// câu5:
//		Scanner scanner4=new Scanner(System.in);
//		System.out.println("mời nhập họ: ");
//		String a4= scanner4.next();
//		System.out.println("mời nhập tên: ");
//		String a5=scanner4.next();
//		System.out.println("Họ và tên đầy đủ là:"+a4+" "+a5);
//		scanner4.close();
		// câu6:
//		String b1="đặng quốc hưng";
//		 String[] w = b1.split("\\s");
//		 // khai báo biến middname,fristname,lastname.
//		 String middname="";
//		String fristname=w[0];
//		String lastname=w[w.length-1];
//		for (int i = 1; i <= w.length-2; i++) {
//			 middname += w[i];		
//		}
//		System.out.println("Họ: "+fristname);
//		System.out.println("Tên đệm: "+middname);
//		System.out.println("Tên: "+lastname);
		// câu 7:
		
//		Scanner scanner5=new Scanner(System.in);
//		System.out.println(" mời nhập họ và tên: ");
//		String fullname= scanner5.nextLine();// nên dùng nextLine cho String
//		// chuẩn hoá chuỗi;
//		fullname=fullname.trim();
//	
//	System.out.println(fullname);
//		
//		// viết hoa chữ cái đầu:
//		String[] w1s=fullname.split("\\s");
//		 fullname="";// cần hỏi
//		for (String w1 : w1s) {
//			String fristwork= w1.substring(0, 1).toUpperCase();
//			String leftwork=w1.substring(1);
//			w1=fristwork+leftwork;
//			fullname += w1+" ";
//			
//		}
//		System.out.println(" tên sau khi dc chuẩn hoá:"+fullname);
//		
	// câu 7:
//	Scanner scanner11= new Scanner(System.in);
//	System.out.println("mời nhập họ vào tên:");
//	String fullName= scanner11.nextLine();
//	fullName=fullName.trim();
//	System.out.println(fullName);
//	//b:
//	// tạo ra một chuỗi
//	String[] as= fullName.split("");// tách chuỗi dựa trên khoảng trắng
//	fullName="";
//	for (String a:as) {
//		String frista= a.substring(0,1).toUpperCase();
//		String lasta= a.substring(1);
//		a= frista+ lasta;
//		fullName+= a + "";
//	}
//		System.out.println(fullName);
//		scanner11.close();
	// câu 8:	
//		
//		String[] hoc_taps= {"học java","c#","java classer","sql"};
//		
//		for (String a : hoc_taps) {
//			if(a.contains("java")){
//			System.out.println(a);
//			}
//		}
//	
//	// câu 9:		
//		String[] groups= {"java","c#","c++"};
//		for (String s : groups) {
//			if(s.equals("java")){
//				System.out.println(s);
//			}
//		}
		
	// bài 10:
//		String a12="none";
//		String a13="enon";
//		// cú pháp đảo ngược ký tự
//		StringBuilder str=new StringBuilder(a12);
//		String str1=str.reverse().toString();
//		// kiểm tra a12 và a13:
//		if(str1.equals(a13)) {
//			System.out.println("giống nhau");
//		}else {
//			System.out.println("khác nhau");
//		}
		// câu 11:
//		int count=0;
//		String ab="";
//		char ky_tu='a';
//		Scanner sc1=new Scanner(System.in);
//		System.out.println("Mời nhập chuỗi:");
//		ab= sc1.nextLine();
//		
//		
//		for (int i = 0; i < ab.length(); i++) {
//			if(ab.charAt(i)== ky_tu) {
//				count++;
//			}	
//		}
//		System.out.println( " số ký tự a trong chuỗi là:"+count);	
//		sc1.close();
//		
		// câu 12:
//		String a1111="";
//		Scanner sc2=new Scanner(System.in);
//		System.out.println("mời nhập chuỗi:");
//		a1111=sc2.nextLine();
//		// hàm đảo ngược:
//		StringBuilder a2222= new StringBuilder(a1111);
//		System.out.println("chuỗi đảo ngược là:"+a2222.reverse().toString());
//		sc2.close();
		
		
	// câu 13:// cần hỏi lại.
//	String a="fhdhhas2ss";
//	for (int i = 0; i < a.length(); i++) {
//	if(checkKeyNumber(a.charAt(i))) {
//	System.out.println("falue");
//	return;
//	}
//	System.out.println("true");
//			
//	}
//		
//	}		
//	public static boolean checkKeyNumber(char ch) {
//		if(ch>='0'&&ch<='9') {
//			return true;
//		}
//		return false;
//	}
//	
	
	}	
	
		

}








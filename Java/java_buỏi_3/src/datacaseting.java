
import java.time.LocalDate;
import java.util.Random;
import java.util.Scanner;

public class datacaseting {
public static void main(String[] args) {
	
//////câu1:
//	float salaryaccount1= 5240.6f;
//	float salaryaccount2= 10870.055f;
//	
//	int salaryaccount1casting=(int)salaryaccount1;
//	System.out.println(salaryaccount1casting);
//	int salaryaccount2cassting=(int)salaryaccount2;
//	System.out.println(salaryaccount2cassting);
//////	// chuyển đổi sang kiểu string(demo)
//////	String salaryaccount1casting1=salaryaccount1 +"";
//////	System.out.println(salaryaccount1casting1);
//////	
// //câu4:
//	Scanner scanner=new Scanner(System.in);
//	System.out.println("mời nhập số nguyên 1:");
//	int a=scanner.nextInt();
//	System.out.println("mời nhập số nguyên 2:");
//	int b=scanner.nextInt();
//	
//	float c=(float)a/b;
//	System.out.println("thương của hai số a và b là:"+c);
//	scanner.close();
////// câu 2:
//	Random random = new Random();
//	int n=random.nextInt(1000);
//	
//	System.out.printf("%05d",n);
	Random random = new Random();
	int n=random.nextInt(1000);
	String s= String.valueOf(n);
	int numb =5-s.length();
	String x="";
	for(int i=0;i<numb;i++) {
		x+="0";
	}
	System.out.println(x+s);
	
	
	
	
	
///	
//
//	

	
}

}
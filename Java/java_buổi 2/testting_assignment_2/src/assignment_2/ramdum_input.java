package assignment_2;

import java.util.Random;
import java.util.Scanner;

public class ramdum_input {
	public static void main(String[] args) {
		
	//cau2:
		Random random=new Random();
		int n=random.nextInt();
		System.out.println("ggg"+n);
		
		
		
	//: Input from console
		Scanner scanner1 =new Scanner(System.in);
		if(scanner1.hasNextInt()) {
		System.out.println("Mòi nhập số:");
		int d= scanner1.nextInt();
		System.out.println("bạn vừa nhập sô:"+d);
		}
		else {
			System.out.println("bạn đã nhập sai số");
		}
		scanner1.close();
	}
}

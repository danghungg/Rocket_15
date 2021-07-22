package testtitng_systemassignment_3;

import java.util.Random;

public class checkKeyNumber {
	static Random r1= new Random();	
	public static void main(String[] args) {
		
				
		int i=r1.nextInt(1000);
		System.out.printf("%05d",i);
		random();
	}

	public static void random(){
		int i=3;
		String s=String.format("%05d", i);
		System.out.println("\n");
		System.out.println(s);
	}
}

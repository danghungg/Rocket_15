import java.time.LocalDate;

public class defaul_val {
	public static void main(String[] args) {
		// cau 1:
		Account[] accounts=new Account[5];
		for (int i = 0; i < 5; i++) {
			accounts[i]=new Account();
			System.out.println("id"+i);
			System.out.println("email: email "+i);
			System.out.println("fullName: FullName"+i);
		System.out.println("CreateDate"+LocalDate.now());	
		}
	}
}

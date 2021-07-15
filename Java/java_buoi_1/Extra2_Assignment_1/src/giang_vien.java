
public class giang_vien {
	byte	id;
	String	fullName;
	String	name;
	String  phoneNumber;
	khoa	khoa;
	lop_hoc[]	so_lop_day;
	void giao_bai_tap() {
		System.out.println("giáo viên cần giao bài tập hàng buổi.");
	}
	void kiem_tra_bt() {
		System.out.println("giáo viên cần kiểm tra bài tập hàng buổi.");
	}
	void kiem_tra() {
		System.out.println("giáo viên cần kiểm tra kết thúc môn sau mỗi môn học.");
	}
}

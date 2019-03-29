package obj;

// 등록금 고지서
public class Tuition {
	private String student_num;					// 학번
	private int charged_amount;					// 책정액
	private String virtual_account_number;		// 가상 계좌 번호
	private String year_and_semester;			// 년도/학기
	
	public String getStudent_num() {
		return student_num;
	}


	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}


	public int getCharged_amount() {
		return charged_amount;
	}


	public void setCharged_amount(int charged_amount) {
		this.charged_amount = charged_amount;
	}


	public String getVirtual_account_number() {
		return virtual_account_number;
	}


	public void setVirtual_account_number(String virtual_account_number) {
		this.virtual_account_number = virtual_account_number;
	}


	public String getYear_and_semester() {
		return year_and_semester;
	}


	public void setYear_and_semester(String year_and_semester) {
		this.year_and_semester = year_and_semester;
	}
}

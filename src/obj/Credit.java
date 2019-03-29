package obj;
// 성적
public class Credit {
	private char credit;		// 학점
	private String student_num;		// 학번
	private String academic_num; // 학수번호
	
	public Credit(char credit,String academic_num) {
		this.setCredit(credit);
		this.setAcademic_num(academic_num);
	}

	public char getCredit() {
		return credit;
	}

	public void setCredit(char credit) {
		this.credit = credit;
	}

	public String getStudent_num() {
		return student_num;
	}

	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}

	public String getAcademic_num() {
		return academic_num;
	}

	public void setAcademic_num(String academic_num) {
		this.academic_num = academic_num;
	}
}

package obj;
// ����
public class Credit {
	private char credit;		// ����
	private String student_num;		// �й�
	private String academic_num; // �м���ȣ
	
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

package obj;
// �л�
public class Student extends Member{
	private String student_num;		// �й�
	private boolean is_scholarship; // ���� ����
	private int grade;				// �г�
	
	public void set_Student_num(String student_num) {
		this.student_num = student_num;
	}
	
	public String getStudent_num() {
		return this.student_num;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getGrade() {
		return this.grade;
	}
	
	public void set_Is_Scholarship(boolean is_scholarship) {
		this.is_scholarship = is_scholarship;
	}
	
	public boolean get_Is_Scholarship() {
		return this.is_scholarship;
	}
}

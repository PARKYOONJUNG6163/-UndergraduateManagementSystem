package obj;
// ����
public class Subject {
	private String name;	 	// �����
	private String academic_num;		// �м���ȣ
	private int grade;			 		// ���� �г�
	private String department;   		// ���� �а�
	private String credit_hours;		// �����ü�  [�� : ������/�̷нð�/�ǽ��ð�]
	private String time;			// �����ð�
	private String division;			// �̼����� [�� : ����(��ȭ)]
	private String year_and_semester ;  // �⵵/�б�
	private int total;			// �� �ο�
	private int now;				// ���� �ο�
	private String professor_num;		// (���� �ϴ� ������) ����

	public String getSubject_name() {
		return name;
	}

	public void setSubject_name(String name) {
		this.name = name;
	}



	public String getAcademic_num() {
		return academic_num;
	}

	public void setAcademic_num(String academic_num) {
		this.academic_num = academic_num;
	}



	public int getGrade() {
		return grade;
	}



	public void setGrade(int grade) {
		this.grade = grade;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	public String getCredit_hours() {
		return credit_hours;
	}



	public void setCredit_hours(String credit_hours) {
		this.credit_hours = credit_hours;
	}



	public String getClass_time() {
		return time;
	}



	public void setClass_time(String time) {
		this.time = time;
	}



	public String getDivision() {
		return division;
	}



	public void setDivision(String division) {
		this.division = division;
	}



	public String getYear_and_semester() {
		return year_and_semester;
	}



	public void setYear_and_semester(String year_and_semester) {
		this.year_and_semester = year_and_semester;
	}



	public int getTotal_people() {
		return total;
	}



	public void setTotal_people(int total) {
		this.total = total;
	}



	public int getNow_people() {
		return now;
	}



	public void setNow_people(int now) {
		this.now = now;
	}



	public String getProfessor_num() {
		return professor_num;
	}



	public void setProfessor_num(String professor_num) {
		this.professor_num = professor_num;
	}
	
	

}

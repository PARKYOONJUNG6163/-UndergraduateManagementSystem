package obj;
// 과목
public class Subject {
	private String name;	 	// 과목명
	private String academic_num;		// 학수번호
	private int grade;			 		// 수강 학년
	private String department;   		// 개설 학과
	private String credit_hours;		// 학점시수  [예 : 총학점/이론시간/실습시간]
	private String time;			// 수업시간
	private String division;			// 이수구분 [예 : 전공(심화)]
	private String year_and_semester ;  // 년도/학기
	private int total;			// 총 인원
	private int now;				// 현재 인원
	private String professor_num;		// (강의 하는 교수의) 교번

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

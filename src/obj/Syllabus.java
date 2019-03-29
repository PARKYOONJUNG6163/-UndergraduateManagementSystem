package obj;

import dao.SyllabusDAO;

// 강의계획서
public class Syllabus {
	private String lecture_way;				// 수업 방법
	private String test_way;				// 평가 방법
	private String prerequisite_learning;	// 선수 학습 내용
	private String out_line;					// 수업 개요
	private String text_book;				// 교재
	private String lecture_plan;			// 강의 계획
	private String academic_num;			// 학수번호

	// 학수번호에 해당되는  강의계획서 조회
	public Syllabus getSyllabus(String academic_num) {
		SyllabusDAO syllabusDAO = new SyllabusDAO();
		
		return syllabusDAO.getSyllabus(academic_num);  
	}
	
	// 강의계획서 등록
	public boolean registerSyllabus(Syllabus syllabus) {
		SyllabusDAO syllabusDAO = new SyllabusDAO();
		
		if(syllabusDAO.registerSyllabus(syllabus)){	// 성공
			return true;
		}else {										// 실패
			return false;
		}
	}

	public String getLecture_way() {
		return lecture_way;
	}



	public void setLecture_way(String lecture_way) {
		this.lecture_way = lecture_way;
	}



	public String getTest_way() {
		return test_way;
	}



	public void setTest_way(String test_way) {
		this.test_way = test_way;
	}



	public String getPrerequisite_learning() {
		return prerequisite_learning;
	}



	public void setPrerequisite_learning(String prerequisite_learning) {
		this.prerequisite_learning = prerequisite_learning;
	}



	public String getOut_line() {
		return out_line;
	}



	public void setOut_line(String out_line) {
		this.out_line = out_line;
	}



	public String getText_book() {
		return text_book;
	}



	public void setText_book(String text_book) {
		this.text_book = text_book;
	}



	public String getLecture_plan() {
		return lecture_plan;
	}



	public void setLecture_plan(String lecture_plan) {
		this.lecture_plan = lecture_plan;
	}



	public String getAcademic_num() {
		return academic_num;
	}



	public void setAcademic_num(String academic_num) {
		this.academic_num = academic_num;
	}
	

	
	
}

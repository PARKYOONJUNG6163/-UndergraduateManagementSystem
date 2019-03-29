package obj;

import dao.SyllabusDAO;

// ���ǰ�ȹ��
public class Syllabus {
	private String lecture_way;				// ���� ���
	private String test_way;				// �� ���
	private String prerequisite_learning;	// ���� �н� ����
	private String out_line;					// ���� ����
	private String text_book;				// ����
	private String lecture_plan;			// ���� ��ȹ
	private String academic_num;			// �м���ȣ

	// �м���ȣ�� �ش�Ǵ�  ���ǰ�ȹ�� ��ȸ
	public Syllabus getSyllabus(String academic_num) {
		SyllabusDAO syllabusDAO = new SyllabusDAO();
		
		return syllabusDAO.getSyllabus(academic_num);  
	}
	
	// ���ǰ�ȹ�� ���
	public boolean registerSyllabus(Syllabus syllabus) {
		SyllabusDAO syllabusDAO = new SyllabusDAO();
		
		if(syllabusDAO.registerSyllabus(syllabus)){	// ����
			return true;
		}else {										// ����
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

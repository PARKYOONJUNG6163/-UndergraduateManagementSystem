package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obj.Credit;
import obj.Student;
import obj.Subject;

// 과목 DAO
public class SubjectDAO {
	private List<String> list_of_academic_num;	// 학수번호 리스트
	private String academic_num;

	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public SubjectDAO() {}
	
	public SubjectDAO(String academic_num) {
		this.academic_num = academic_num;
	}
	
	private void connectDB() {
		this.jdbcUrl = "jdbc:mysql://localhost:3306/school_management";
		this.dbId = "parkyoonjung";
		this.dbPass = "qkrdbswjd";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void disConnectDB() {
		if(rs!= null) try {rs.close();}catch (Exception e) {}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	
	// 교수가 수업하는 과목 학수번호 리스트
	public List<String> getSubjectProfessor(String professor_num) { 
        connectDB();
        String sql = "SELECT academic_num FROM subject WHERE professor_num = ?";
        ResultSet rs = null;
        
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, professor_num);
           rs = pstmt.executeQuery();
           
           list_of_academic_num = new ArrayList<>();
           
           while(rs.next()) {
              list_of_academic_num.add(rs.getString("academic_num"));
           }
        } catch (SQLException e) {
           e.printStackTrace();
        }
        
        disConnectDB();
        
        return list_of_academic_num;
     }
		
		
		// 교수가 수업하는 과목 리스트
		public List<Subject> getSubjectListOfProfessor(String professor_num){
			connectDB();
			String sql = "SELECT * FROM subject WHERE professor_num = ?";
			ResultSet rs = null;
			List<Subject> subject_list = new ArrayList<>();
			
	
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, professor_num);
				rs = pstmt.executeQuery();
				
				if(!rs.next()) {
					disConnectDB();
					return subject_list;				// 수업 담당한 과목 없으면 빈  리스트 리턴 (에러방지용, null 리턴할 경우 Nullpointer 오류의 위험성)
				}
				
				do {
					Subject subject = createSubject(rs);
					subject_list.add(subject);
				}while(rs.next());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			disConnectDB();
			return subject_list;
		}
		
		
	public Subject getSubject(String p_academic_num) { // 특정 과목 조회
		connectDB();
		Subject subject_info = new Subject();
		String sql = "SELECT * FROM subject WHERE academic_num = ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_academic_num);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			subject_info = createSubject(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
		return subject_info;
	}
	
	public List<Subject> getTotalSubject() { // 전체 과목 조회
		connectDB();
		Subject subject_info = new Subject();
		String sql = "SELECT * FROM subject";
		List<Subject> totalSubject = new ArrayList<Subject>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				subject_info = createSubject(rs);
				totalSubject.add(subject_info);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
		return totalSubject;
	}
	
	
	
	// ResultSet에 대한 Subject 객체를 만들어서 반환하는 함수
	private Subject createSubject(ResultSet rs) throws SQLException {
		Subject subject = new Subject();
		
		subject.setAcademic_num(rs.getString("academic_num"));
		subject.setSubject_name(rs.getString("name"));
		subject.setGrade(rs.getInt("grade"));
		subject.setDepartment(rs.getString("department"));
		subject.setCredit_hours(rs.getString("credit_hours"));
		subject.setClass_time(rs.getString("time"));
		subject.setDivision(rs.getString("division"));
		subject.setYear_and_semester(rs.getString("yearNsemester"));
		subject.setTotal_people(rs.getInt("total"));
		subject.setNow_people(rs.getInt("now"));
		subject.setProfessor_num(rs.getString("professor_num"));
		return subject; 
	}
	
	
}

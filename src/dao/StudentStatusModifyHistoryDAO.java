package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obj.StudentStatusModify;

public class StudentStatusModifyHistoryDAO {
	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	public StudentStatusModifyHistoryDAO() {
		
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
	
	
	// 학적 변동 내역에 추가
	public boolean addHistory(StudentStatusModify studentStatusModify) {
		connectDB();
		String sql  = "INSERT INTO studentStudentModifyHistory(student_num, yearNsemester, modified_date, modified_status) values(?, ?, ?, ?)";
		boolean success = true;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentStatusModify.getStudent_num());
			pstmt.setString(2, studentStatusModify.getYear_and_semester());
			pstmt.setString(3, studentStatusModify.getModified_date());
			pstmt.setString(4, studentStatusModify.getModified_status());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			success = false;
			e.printStackTrace();
		}
		disConnectDB();
		
		return success;
	}
	
	
	// 학번을 입력으로 받아 그 학생의 학적 변동 내역을 리스트로 출력
	public List<StudentStatusModify> getStatusModifyList(String student_num){
		connectDB();
		String sql = "SELECT * FROM studentStudentModifyHistory WHERE student_num = ?";
		List<StudentStatusModify> statusModifyList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {			// 학적 변동 내역 없는 경우, 빈 리스트 반환
				return statusModifyList;	
			}
			
			do {
				StudentStatusModify statusModify = new StudentStatusModify();
				statusModify.setStudent_num(rs.getString("student_num"));
				statusModify.setYear_and_semester(rs.getString("yearNsemester"));
				statusModify.setModified_date(rs.getString("modified_date"));
				statusModify.setModified_status(rs.getString("modified_status"));
				
				statusModifyList.add(statusModify);
			}while(rs.next());
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
		
		return statusModifyList;
	}
	
	
	
	
	
	
}

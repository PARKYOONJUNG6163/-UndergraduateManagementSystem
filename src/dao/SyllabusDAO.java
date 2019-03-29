package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import obj.Syllabus;

// 강의 계획서 DAO
public class SyllabusDAO {
	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public SyllabusDAO() {
		
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
	
	
	
	// 학수번호에 해당되는 강의계획서 조회
	public Syllabus getSyllabus(String academic_num) {
		connectDB();
		String sql = "SELECT * FROM syllabus WHERE academic_num = ?";
		Syllabus syllabus = new Syllabus();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, academic_num);
			rs = pstmt.executeQuery();
			
			
			if(!rs.next()) {
				return null;
			}
			
			syllabus.setLecture_way(rs.getString("lecture_way"));
			syllabus.setTest_way(rs.getString("test_way"));
			syllabus.setPrerequisite_learning(rs.getString("prerequisite_learning"));
			syllabus.setOut_line(rs.getString("out_line"));
			syllabus.setText_book(rs.getString("text_book"));
			syllabus.setLecture_plan(rs.getString("lecture_plan"));
			syllabus.setAcademic_num(rs.getString("academic_num"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
		return syllabus;
	}
	
	public boolean modifySyllabus(Syllabus syllabus) {
		connectDB();
		String sql = "UPDATE syllabus SET lecture_way = ?, test_way = ?, prerequisite_learning = ?,"
				+ "out_line = ?, text_book = ?, lecture_plan = ? "
				+ "WHERE academic_num = ?";
		boolean success = true;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, syllabus.getLecture_way());
			pstmt.setString(2, syllabus.getTest_way());
			pstmt.setString(3, syllabus.getPrerequisite_learning());
			pstmt.setString(4, syllabus.getOut_line());
			pstmt.setString(5, syllabus.getText_book());
			pstmt.setString(6, syllabus.getLecture_plan());
			pstmt.setString(7, syllabus.getAcademic_num());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		}
		
		return success;
	}
	
	public boolean removeSyllabus(String academic_num) {
		connectDB();
		String sql = "DELETE FROM syllabus WHERE academic_num = ?";
		boolean success = true;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, academic_num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		}
		
		
		disConnectDB();
		return success;
	}
	
	// 강의 계획서 등록
	public boolean registerSyllabus(Syllabus syllabus) {
		connectDB();
		String sql = "INSERT INTO syllabus(lecture_way, test_way, prerequisite_learning, "
				+ "out_line, text_book, lecture_plan, academic_num) values(?, ?, ?, ?, ?, ?, ?)";
		boolean success = true;		// 등록 성공 여부
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, syllabus.getLecture_way());
			pstmt.setString(2, syllabus.getTest_way());
			pstmt.setString(3, syllabus.getPrerequisite_learning());
			pstmt.setString(4, syllabus.getOut_line());
			pstmt.setString(5, syllabus.getText_book());
			pstmt.setString(6, syllabus.getLecture_plan());
			pstmt.setString(7, syllabus.getAcademic_num());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		}
		
		disConnectDB();
		return success;
	}
}

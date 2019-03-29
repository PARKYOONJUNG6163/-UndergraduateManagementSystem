package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obj.Credit;

// 성적 DAO
public class CreditDAO {
	private String student_num;
	private List<Credit> list_of_credit;		// 수강신청한 과목의 학수번호 리스트
	
	String jdbcUrl = null; 
	String dbId = null;
	String dbPass = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private void connectDB() {
		this.jdbcUrl = "jdbc:mysql://localhost:3306/school_management";
		this.dbId = "parkyoonjung";
		this.dbPass = "qkrdbswjd";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void disConnectDB() {
		if(rs!= null) try {rs.close();}catch (Exception e) {}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	
	public CreditDAO(String p_student_num) {
		student_num = p_student_num;
	}
	
	// 학점 정보 조회
	public List<Credit> getCredit() {
		connectDB();
		String sql = "SELECT credit,academic_num FROM credit WHERE student_num = ?";
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, this.student_num);
			rs = pstmt.executeQuery();
			
			list_of_credit = new ArrayList<>();
			
			while(rs.next()) {
				Credit c = new Credit(rs.getString("credit").charAt(0),rs.getString("academic_num"));
				list_of_credit.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
				
		return list_of_credit;
	}
	
	// 학번과 학수번호에 대한 학점정보 존재 여부 
	public char getCreditStu(String academic_num,String student_num) {
		connectDB();
		String sql = "SELECT credit FROM credit WHERE student_num = ? and academic_num = ?";
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			pstmt.setString(2, academic_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("credit").charAt(0) != '\0' ) { // 학점 정보가 존재하면
					return rs.getString("credit").charAt(0);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		return '\0';
	}
	
	//학점 등록
	public boolean registerCredit(char credit, String student_num, String academic_num) {
		connectDB();
		String sql = "INSERT INTO credit VALUES (?,?,?)"; // 학번 추가

		try {
			// credit에 추가
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(credit));
			pstmt.setString(2, student_num);
			pstmt.setString(3, academic_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		return true;
	}
	
	public boolean modifyCredit(char credit, String student_num, String academic_num) {
		connectDB();
		String sql = "UPDATE credit SET credit = ? where student_num = ? and academic_num = ?";
		
		if(credit == '\0') {
			return false;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(credit));
			pstmt.setString(2, student_num);
			pstmt.setString(3, academic_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();	
		return true;
	}
	
	public boolean removeCredit(String student_num, String academic_num) {
		connectDB();
		String sql = "delete from credit where student_num = ? and academic_num = ?";
		try {
			// 목록에서 삭제
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			pstmt.setString(2, academic_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		return true;
	}
}

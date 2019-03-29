package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import obj.Scholarship;

// ���л� ��Ȳ DAO
public class ScholarshipStatusDAO {
	private HashMap<String , Scholarship> list; // ���б� ��ü�� �й��� map����

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

	//���л� ��ȸ
	public HashMap<String , Scholarship> getScholarshipStudent() {
		connectDB();
		String sql = "SELECT * FROM scholarship_status";
		ResultSet rs = null;
		list = new HashMap<String , Scholarship>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.put(rs.getString("student_num"), new Scholarship(rs.getString("type"),rs.getInt("money")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		disConnectDB();
		return list;
	}
	
	//���л� ���
	public boolean registerScholarshipStudent(String student_num, String type, int money) {
		connectDB();
		String sql = "INSERT INTO scholarship_status VALUES (?,?,?)"; // �й� �߰�

		try {
			//���л� ���̺� ���
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			pstmt.setString(2, type);
			pstmt.setInt(3, money);
			pstmt.executeUpdate();
			// ���� ���� ����
			sql = "UPDATE student SET is_scholarship = 'TRUE' where student_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		disConnectDB();
		return true;
	}
	
}
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import obj.Student;

//학생 DAO
public class StudentDAO {
	private String student_num;
	
	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public StudentDAO() {
		
	} 
	
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
	
	 // 학생정보 등록
    public boolean registerStudentInformation(String student_num,String id,String pw, String name, String major, String email, String tel, String birth, String status) {
       connectDB();
       String  sql = "INSERT INTO student (student_num, id, pw, name, major, email, tel, birth, status, is_scholarship, grade) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
       
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, student_num);
          pstmt.setString(2, id);
          pstmt.setString(3, pw);
          pstmt.setString(4, name);
          pstmt.setString(5, major);
          pstmt.setString(6, email);
          pstmt.setString(7, tel);
          pstmt.setString(8, birth);
          pstmt.setString(9, status);
          pstmt.setString(10,"FALSE");
          pstmt.setInt(11, 1);
          pstmt.executeUpdate();
       } catch (SQLException e) {
          e.printStackTrace();
          return false;
       }
       disConnectDB();
       
       return true;
    }
    
    
	// 학생정보 조회
	public Student getStudentInformation(String p_student_num) {
		connectDB();
		String sql = "SELECT * FROM student WHERE student_num = ?";
		Student student_Info = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_student_num);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			
			student_Info = new Student();
			student_Info.setId(rs.getString("student_num"));
			student_Info.setName(rs.getString("name"));
			student_Info.setMajor(rs.getString("major"));
			student_Info.setEmail(rs.getString("email"));
			student_Info.setTel(rs.getString("tel"));
			student_Info.setBirth(rs.getString("birth"));
			student_Info.setStatus(rs.getString("status"));
			student_Info.set_Is_Scholarship(rs.getBoolean("is_scholarship"));
			student_Info.setGrade(rs.getInt("grade"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		
		return student_Info;
	}
	
	public boolean modifyStudentInformation(String student_num, String name,String major,String tel,String email,String birth) {
		connectDB();
		String sql = "UPDATE student SET name = ?, major = ?, tel = ?, email = ?,birth = ? WHERE student_num = ?";
		
		if(name == null || major == null || tel == null || email == null || birth == null) {
			return false;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, major);
			pstmt.setString(3, tel);
			pstmt.setString(4, email);
			pstmt.setString(5, birth);
			pstmt.setString(6, student_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();	
		return true;
	}
	
	
	// 학생 로그인 요청이 올바른지 확인하고, 올바른 요청일 경우 학번을 리턴
	public String checkExistStudent(String id, String pw) {
		connectDB();
		String sql = "SELECT student_num FROM student WHERE (id = ?) and (pw = ?)";
		rs = null;
	
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			this.student_num = rs.getString("student_num");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();	
		return this.student_num;
	}
	
	// 학번과 학적 변동를 인자로 받아, 학적 변동을 구행한다.
		public boolean modifyStudentStatus(String student_num, String status) {
			connectDB();
			String sql =  "UPDATE student SET status = ? WHERE student_num = ?";
			boolean success = true;
			
			if (status.endsWith("휴학")) {		// 재학 -> 휴학으로
				status = "휴학";
			}else {								// 휴학 -> 재학으로
				status = "재학";
			}
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, status);
				pstmt.setString(2, student_num);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				success = false;
				e.printStackTrace();
			}
			disConnectDB();
			
			return success;
		}
	
	
	
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import obj.Professor;

// 교수 DAO
public class ProfessorDAO {
	private String id;
	private String name;
	private String major;
	private String email;
	private String tel;
	private String birth;
	private String professor_num;
	
	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ProfessorDAO() {
		
	}
	
	public ProfessorDAO(String id, String name, String major, String email, String tel, String birth,String professor_num) {
		this.id = id;
		this.name = name;
		this.major = major;
		this.email = email;
		this.tel = tel;
		this.birth = birth;
		this.professor_num = professor_num;
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
	
	 // 교수정보 등록
    public boolean registerProfessorInformation(String professor_num,String id,String pw, String name, String major, String email, String tel, String birth) {
       connectDB();
       String sql = "INSERT INTO professor (professor_num, id, pw, name, major, email, tel, birth) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
       
       try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, professor_num);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, name);
			pstmt.setString(5, major);
			pstmt.setString(6, email);
			pstmt.setString(7, tel);
			pstmt.setString(8, birth);
			pstmt.executeUpdate();
       } catch (SQLException e) {
          e.printStackTrace();
          return false;
       }
       disConnectDB();  
       return true;
    }
    
    //교수 정보 수정
	public boolean modifyProfessorInformation(String professor_num, String name,String major,String tel,String email,String birth) {
		connectDB();
		String sql = "UPDATE professor SET name = ?, major = ?, tel = ?, email = ?,birth = ? WHERE professor_num = ?";
		
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
			pstmt.setString(6, professor_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();	
		return true;
	}
	
	// 교수 정보 조회
	public Professor getProfessorInformation(String p_professor_num) {
		connectDB();
		String sql = "SELECT * FROM professor WHERE professor_num = ?";
		Professor professor_Info = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_professor_num);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			professor_Info = new Professor();
			professor_Info.setId(rs.getString("professor_num"));
			professor_Info.setName(rs.getString("name"));
			professor_Info.setMajor(rs.getString("major"));
			professor_Info.setEmail(rs.getString("email"));
			professor_Info.setTel(rs.getString("tel"));
			professor_Info.setBirth(rs.getString("birth"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		return professor_Info;
	}
	
	// 교수 로그인 요청이 올바른지 확인하고, 올바른 요청일 경우 교번을 리턴
	public String checkExistProfessor(String id, String pw) {
		connectDB();
		String sql = "SELECT professor_num FROM professor WHERE (id = ?) and (pw = ?)";
		rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			this.professor_num = rs.getString("professor_num");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnectDB();
		
		return this.professor_num;
	}
	
}

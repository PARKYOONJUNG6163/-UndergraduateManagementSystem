package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import obj.Tuition;

//등록금 DAO
public class TuitionDAO {
	String jdbcUrl; 
	String dbId;
	String dbPass;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	
	
	public TuitionDAO() {
		
	}
	
	
	// 등록금 고지서를 반환하는 함수
	public Tuition getTuition(String student_num) {
		connectDB();
		
		// 현재 년-월 구하기
		SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy-M", Locale.KOREA);
		Date date = new Date();
		String time = simpleDateFormat.format(date);

		// 년도/학기 구하기
		String yearNsemester;
		
		if(Integer.parseInt(time.split("-")[1]) >= 7) {
			yearNsemester = time.split("-")[0] + "년/2학기"; 
		}else {
			yearNsemester = time.split("-")[0] + "년/1학기"; 
		}
		
		//반환할 고지서
		Tuition tuition = new Tuition();
	
		
	
		String sql = "SELECT * FROM tuition WHERE (student_num = ?) AND (yearNsemester = ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_num);
			pstmt.setString(2, yearNsemester);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {		// 등록금 고지서 없는 경우
				return null;
			}
			
			tuition.setStudent_num(rs.getString("student_num"));
			tuition.setCharged_amount(rs.getInt("charged_amount"));
			tuition.setVirtual_account_number(rs.getString("virtual_account_number"));
			tuition.setYear_and_semester(rs.getString("yearNsemester"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		disConnectDB();
	
		return tuition;
	}
	
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obj.Subject;

// ������û DAO
public class EnrollClassDAO {
	private String student_num;
	private String academic_num;
	private List<String> academic_list_of_enroll_class; // ������û�� ������ �м���ȣ ����Ʈ
	private List<String> list_of_student; // ���� �������� �й� ����Ʈ
	private List<Subject> enrollClassSubjectList; // ������û�� ���� ��ü ����Ʈ
	
	String jdbcUrl = null;
	String dbId = null;
	String dbPass = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public EnrollClassDAO() {

	}

	public EnrollClassDAO(String student_num) {
		this.student_num = student_num;
	}

	public EnrollClassDAO(String student_num, String academic_num) {
		this.student_num = student_num;
		this.academic_num = academic_num;
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
	
	// �ش� �м���ȣ �����ϴ� �л� ����Ʈ �����
	public List<String> getSubjectStudent(String academic_num) {
		connectDB();
		String sql = "SELECT student_num FROM enroll_class WHERE academic_num = ?";
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, academic_num);
			rs = pstmt.executeQuery();

			list_of_student = new ArrayList<>();

			while (rs.next()) {
				list_of_student.add(rs.getString("student_num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnectDB();
		return list_of_student;
	}

	// Ư�� ���� ���� ����
	public boolean getOneEnrollClassHistory(String p_student_num, String p_academic_num) {
		connectDB();
		String sql = "select academic_num from enroll_class where student_num = ? and academic_num = ?";

		try {
			// enroll�� �߰�
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_student_num);
			pstmt.setString(2, p_academic_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnectDB();
		return false;
	}

	// ���� ��û ���� ���� �߰�
	public boolean registerEnrollClassHistory(String p_student_num, String p_academic_num) {
		connectDB();
		String sql = "INSERT INTO enroll_class VALUES (?,?)"; // �й� �߰�

		try {
			// enroll�� �߰�
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_student_num);
			pstmt.setString(2, p_academic_num);
			pstmt.executeUpdate();
			// �����ο� 1�� ������Ű��
			sql = "update subject set now = now + 1 where academic_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_academic_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnectDB();
		return true;
	}

	// ���� ��û�� ������ �м� ��ȣ ����Ʈ ��ȯ
	public List<String> getEnrollClassHistory() {
		connectDB();
		String sql = "SELECT academic_num FROM enroll_class WHERE student_num = ?";
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, this.student_num);
			rs = pstmt.executeQuery();

			academic_list_of_enroll_class = new ArrayList<>();

			while (rs.next()) {
				academic_list_of_enroll_class.add(rs.getString("academic_num"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnectDB();
		return academic_list_of_enroll_class;
	}

	// ���� ��û�� ���� ��ü ����Ʈ ��ȯ
	public List<Subject> getEnrollClassSubject(String student_num) {
		EnrollClassDAO enrollClassDAO = new EnrollClassDAO(student_num);
		List<String> academic_list_of_enroll_class = enrollClassDAO.getEnrollClassHistory();
		enrollClassSubjectList = new ArrayList<Subject>();

		SubjectDAO subjectDAO = new SubjectDAO();
		for (String academic_num : academic_list_of_enroll_class) {
			enrollClassSubjectList.add(subjectDAO.getSubject(academic_num));
		}
		return enrollClassSubjectList;
	}

	// ���� ��û ����� ���� ����
	public boolean removeEnrollClassHistory(String p_student_num, String p_academic_num) {
		connectDB();
		String sql = "delete from enroll_class where student_num = ? and academic_num = ?";
		try {

			// ��Ͽ��� ����
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_student_num);
			pstmt.setString(2, p_academic_num);
			pstmt.executeUpdate();
			// �����ο� 1 ����
			sql = "update subject set now = now - 1 where academic_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_academic_num);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnectDB();
		return false;
	}

}

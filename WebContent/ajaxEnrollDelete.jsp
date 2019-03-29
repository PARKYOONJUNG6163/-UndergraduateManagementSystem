<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.EnrollClassDAO"%>

<%
	String identifier = (String) session.getAttribute("identifier");
	String academic_num = request.getParameter("academic_num");
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbcUrl = "jdbc:mysql://localhost:3306/school_management?";
	String dbId = "parkyoonjung";
	String dbPass = "qkrdbswjd";

	try { // 수강신청한 과목 하나씩 디비에 저장	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		EnrollClassDAO enrolldao = new EnrollClassDAO(identifier);
		enrolldao.removeEnrollClassHistory(identifier, academic_num);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>
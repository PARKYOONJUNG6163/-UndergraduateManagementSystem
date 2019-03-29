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
	ResultSet rs = null;

	String jdbcUrl = "jdbc:mysql://localhost:3306/school_management?";
	String dbId = "parkyoonjung";
	String dbPass = "qkrdbswjd";

	try { // 수강신청한 과목 하나씩 디비에 저장	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		EnrollClassDAO enrolldao = new EnrollClassDAO(identifier);

		String sql = "select total,now from subject where academic_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, academic_num);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			if (!enrolldao.getOneEnrollClassHistory(identifier, academic_num)) {
				if (rs.getInt("total") > rs.getInt("now")) { // 인원이 전체보다 같거나 크면서 리스트에 없으면
					enrolldao.registerEnrollClassHistory(identifier, academic_num);
					out.print("true");
				} else {
					out.print("max");
				}
			} else {
				out.print("false");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
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
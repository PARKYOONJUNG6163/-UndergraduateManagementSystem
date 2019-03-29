<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<%
   	request.setCharacterEncoding("UTF-8");
   	String id_validate = request.getParameter("id_validate");
   
	String jdbcUrl = "jdbc:mysql://localhost:3306/school_management";
	String dbId = "parkyoonjung";
	String dbPass = "qkrdbswjd";
	
	String sql;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
	sql = "select id from student where id = ? union select id from professor where id = ? "; 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id_validate);
	pstmt.setString(2, id_validate);
	rs = pstmt.executeQuery();
	while(rs.next()){
		if(rs.getString("id") != null){
			out.print("false");
		}else{
			out.print("true");
		}
	}
 %>
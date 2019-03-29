<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="dao.ScholarshipStatusDAO"%>
<%
	String student_num = request.getParameter("student_num");
	String type = request.getParameter("type");
	int money = Integer.parseInt(request.getParameter("money"));
	
	ScholarshipStatusDAO scholarshipstatusdao = new ScholarshipStatusDAO();
	if(scholarshipstatusdao.registerScholarshipStudent(student_num, type, money)){
		out.print("true");
	}else{
		out.print("false");
	}
%>
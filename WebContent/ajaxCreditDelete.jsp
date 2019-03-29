<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="dao.CreditDAO"%>
<%
	String student_num = request.getParameter("student_num");
	String academic_num = request.getParameter("academic_num");
	String credit_value = request.getParameter("credit_value");

	CreditDAO creditdao = new CreditDAO(student_num);
	if (creditdao.removeCredit(student_num, academic_num)) {
		out.print("true");
	} else {
		out.print("false");
	}
%>
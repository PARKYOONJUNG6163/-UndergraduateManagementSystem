<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="dao.CreditDAO"%>
<%
	String student_num = request.getParameter("student_num");
	String academic_num = request.getParameter("academic_num");
	String credit_value = request.getParameter("credit_value");
	
	if(credit_value.charAt(0) == 'A' || credit_value.charAt(0) == 'B' || credit_value.charAt(0) == 'C'
			|| credit_value.charAt(0) == 'D' || credit_value.charAt(0) == 'F' ){
		CreditDAO creditdao = new CreditDAO(student_num);
		if(creditdao.modifyCredit(credit_value.charAt(0), student_num, academic_num)){
			out.print("true");
		}else{
			out.print("false");
		}
	}else{
		out.print("not");
	}
	
%>
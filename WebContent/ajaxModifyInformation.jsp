<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%>
 <%@page import="dao.StudentDAO"%>
  <%@page import="dao.ProfessorDAO"%>
<% 
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String birth = request.getParameter("birth");
	String identifier = (String)session.getAttribute("identifier");
	
	if(identifier.length() == 9){ // 학생인 경우 
		StudentDAO studentdao = new StudentDAO();
		try {	// 수강신청한 과목 하나씩 디비에 저장	
			if(studentdao.modifyStudentInformation(identifier, name, major, tel, email, birth)){
				out.print("true");
			}else{
				out.print("false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}else{ // 교수인 경우
		ProfessorDAO professordao = new ProfessorDAO();
		try {	// 수강신청한 과목 하나씩 디비에 저장	
			if(professordao.modifyProfessorInformation(identifier, name, major, tel, email, birth)){
				out.print("true");
			}else{
				out.print("false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
%>
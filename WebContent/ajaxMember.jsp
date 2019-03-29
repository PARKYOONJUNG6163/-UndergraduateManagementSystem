<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.StudentDAO"%>
<%@page import="dao.ProfessorDAO"%>
<%
	request.setCharacterEncoding("utf-8");

	String rank = request.getParameter("who");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String birth = request.getParameter("birth");
	String status = request.getParameter("status");
	String identifier = request.getParameter("identifier");

		if (rank.equals("student")) { // 학생을 고르면 학생 테이블을
			StudentDAO studentdao = new StudentDAO();
			if(studentdao.registerStudentInformation(identifier, id, pw, name, major, email, tel, birth, status)){
				out.print("true");
			}else{
				out.print("false");
			}
		} else { // 교수를 고르면 교수 테이블을
			ProfessorDAO professordao = new ProfessorDAO();
			if(professordao.registerProfessorInformation(identifier, id, pw, name, major, email, tel, birth)){
				out.print("true");
			}else{
				out.print("false");
			}
		}
%>
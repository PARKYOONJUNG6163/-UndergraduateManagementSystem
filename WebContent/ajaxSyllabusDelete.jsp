<%@page import="java.io.PrintWriter"%>
<%@page import="dao.SyllabusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String academic_num = request.getParameter("academic_num");
	String response_string;
    PrintWriter outResponse = response.getWriter();

	SyllabusDAO syllabusDAO = new SyllabusDAO();
	if(syllabusDAO.removeSyllabus(academic_num)){	// 강의 계획서 삭제 성공
		response_string = "강의계획서가 성공적으로 삭제되었습니다.";
	}else{											// 강의 계획서 삭제 실패
		response_string = "Syllabus remove fail";
	}
	
	 outResponse.write(response_string);
	 outResponse.flush();
  	 outResponse.close();
	
%>
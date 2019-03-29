<%@page import="dao.SyllabusDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <!-- jsp 액션태그를 이용하여 객체를 자동생성 -->
<jsp:useBean id="syllabus" class="obj.Syllabus" scope="page" />
<jsp:setProperty name="syllabus" property="*" />

<%
	request.setCharacterEncoding("utf-8");
	String response_string;
	PrintWriter outResponse = response.getWriter();
	
	SyllabusDAO syllabusDAO = new SyllabusDAO();
	if(syllabusDAO.modifySyllabus(syllabus)){		// 강의계획서 수정 성공
		response_string = "강의계획서가 성공적으로 수정되었습니다.";
	}else{											// 강의계획서 수정 실패
		response_string = "Syllabus modify fail";
	}

	outResponse.write(response_string);
	outResponse.flush();
	outResponse.close();
	
%>
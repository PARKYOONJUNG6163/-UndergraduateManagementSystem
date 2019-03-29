<%@page import="java.io.PrintWriter"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String rank = request.getParameter("rank");
	
	String response_string;
	PrintWriter outResponse = response.getWriter();				// script쪽으로 response할때 쓰이는 writer


	if(rank.equals("student")){									// 학생으로 로그인 시도
		StudentDAO studentDAO = new StudentDAO();
		String student_num = studentDAO.checkExistStudent(id, pwd);
		
		if( student_num != null){								// 존재하는 학생인 경우
			response_string = id;						
		
			// 로그인 처리
			session.setAttribute("identifier", student_num);		
		}else{
			response_string = "no exist user";					// 존재하지 않는 학생인 경우
		}						
		
	}else{														// 교수로 로그인 시도
		ProfessorDAO professorDAO = new ProfessorDAO();
		String professor_num = professorDAO.checkExistProfessor(id, pwd);
	
		if(professor_num != null){								// 존재하는 교수인 경우
			response_string = id;
		
			// 로그인 처리
			session.setAttribute("identifier", professor_num);			
		}else{													// 존재하지 않는 교수인 경우
			response_string = "no exist user";	
		}
		
		
	}
	
	outResponse.write(response_string);					// output
	outResponse.flush();
	outResponse.close();
	%>

<%@page import="dao.StudentStatusModifyHistoryDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <!-- jsp 액션태그를 이용하여 객체를 자동생성 -->
<jsp:useBean id="studentStatusModify" class="obj.StudentStatusModify" scope="page" />
<jsp:setProperty name="studentStatusModify" property="*" />

    <%
    	request.setCharacterEncoding("utf-8");
    	String  identifier = (String)session.getAttribute("identifier");
   		
    	studentStatusModify.setStudent_num(identifier);
    
 
    	
    	String response_string;
    	PrintWriter outResponse = response.getWriter();
   
    	
    	if(studentStatusModify.getModified_status().equals("bokhak")){
    		studentStatusModify.setModified_status("복학");
    	}else if(studentStatusModify.getModified_status().equals("huehak")){
    		studentStatusModify.setModified_status("휴학");
    	}else if(studentStatusModify.getModified_status().equals("goonhuehak")){
    		studentStatusModify.setModified_status("군휴학");
    	}else{
    		studentStatusModify.setModified_status("제대복학");
    	}
    	
    	StudentDAO studentDAO = new StudentDAO();
    	StudentStatusModifyHistoryDAO studentStatusModifyHistoryDAO = new StudentStatusModifyHistoryDAO();
    	
    	if(studentDAO.modifyStudentStatus(identifier, studentStatusModify.getModified_status())){	
    		if(studentStatusModifyHistoryDAO.addHistory(studentStatusModify)){						// 학적 변동 성공
    			response_string = "학적 변동이 정상적으로 처리되었습니다.";	
    		}else{																					// 학적 변동 실패
    			response_string = "학적 변동에 실패하였습니다.";
	    		}									
    	}else{																						// 학적 변동 실패
    		response_string = "학적 변동에 실패하였습니다.";
    	}
    	
    	outResponse.write(response_string);
    	outResponse.flush();
    	outResponse.close();
    	
    	
    	
    
    %>
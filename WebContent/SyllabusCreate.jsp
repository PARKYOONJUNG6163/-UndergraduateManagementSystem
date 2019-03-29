<%@page import="obj.Subject"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="obj.Syllabus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
<!DOCTYPE html>
<html>
<head>
<title>강의계획서 등록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
 <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if((identifier == null) || (identifier.length() != 7)){
    		%>
    		<script>alert("교수 로그인이 필요한 서비스입니다.");
    				location.href = "Redirect.jsp";
    		</script>
    		
    		<%
    		
    	}
    %>
    
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>강의계획서 등록</strong></a>
					<ul class="icons">
						<p><%=identifier %> 님 로그인 중</p>     
						<a href="Logout.jsp" class="button big">LOGOUT</a>
					
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						
						<table>
						<thead>
						<tr><th>구분</th><th>학수번호</th><th>과목명</th><th>학년</th><th>개설 학과</th><th>이수 구분</th></tr>
						</thead>
						<tbody>
						<%
							SubjectDAO subjectDAO = new SubjectDAO();
							List<Subject> subjectList_of_professor = subjectDAO.getSubjectListOfProfessor(identifier);
							
							
							for (Subject subject : subjectList_of_professor){
							%>
							<tr><td><button type="button" onclick="loadCreateSyllabusForm(event);">등록</button></td><td><%=subject.getAcademic_num()%></td><td><%=subject.getSubject_name() %></td><td><%=subject.getGrade() %></td><td><%=subject.getDepartment() %></td><td><%=subject.getYear_and_semester() %></td></tr>
							<%
							}
						%>
						
						</tbody>
						
						</table>
						
						<form id="createSyllabusForm"style="display:none;"  method="get">
							과목  <input id="subject_name" type="text" disabled /> <br/>
							학수번호 <input name="academic_num" type="text" disabled /> <br/>
							수업 방법 <textarea name="lecture_way"></textarea> <br/>
							평가 방법 <textarea name="test_way"></textarea> <br/>
							선수학습 내용 <textarea name="prerequisite_learning"></textarea> <br/>
							수업 개요  <textarea name="out_line"></textarea><br/>
							교재  <textarea name="text_book"></textarea><br/>
							강의 계획  <textarea name="lecture_plan"></textarea><br/>
							<button type="button" onclick="createSyllabus();">등록</button>
						</form>
						
					</div>
				</section>
			</div>
		</div>

<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li>학적관리</li>
							<ul>
								<li><a href="InformationGet.jsp">학적기본 조회</a></li>
								<li><a href="InformationModify.jsp">학적기본 수정</a></li>
							</ul>
						<li><a href="StudentStatusModify.jsp">학적 변동 신청</a></li>	
						<li><a href="StudentStatusChangeHistoryGet.jsp">학적 변동 내역 조회</a></li>
						<li><a href="SubjectGet.jsp">교과목 조회</a></li>
						<li>수강신청</li>
							<ul>
								<li><a href="EnrollHistoryGet.jsp">수강신청 내역 조회</a></li>
								<li><a href="EnrollSubject.jsp">수강신청 등록</a></li>
								<li><a href="EnrollHistoryDelete.jsp">수강신청 취소</a></li>
							</ul>
						<li><a href="SubjectSchedule.jsp">강의 시간표</a></li>	
						<li>성적</li>
							<ul>
								<li><a href="CreditGet.jsp">성적 조회</a></li>
								<li><a href="CreditCreate.jsp">성적 등록</a></li>
								<li><a href="CreditModify.jsp">성적 수정</a></li>
								<li><a href="CreditDelete.jsp">성적 삭제</a></li>
							</ul>
						
						<li>강의계획서</li>
							<ul>
								<li><a href="SyllabusGet.jsp">강의계획서 조회</a></li>
								<li><a href="SyllabusCreate.jsp">강의계획서 등록</a></li>
								<li><a href="SyllabusModify.jsp">강의계획서 수정</a></li>
								<li><a href="SyllabusDelete.jsp">강의계획서 삭제</a></li>
							</ul>
						<li><a href="ScholarshipCreate.jsp">장학생 등록</a></li>	
						<li><a href="ScholarshipGet.jsp">장학생 현황 조회</a></li>
						<li><a href="TuitionGet.jsp">고지서 조회</a></li>
				</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<ul class="contact">
						<li class="fa-envelope-o">information@cnu.ac.kr</li>
						<li class="fa-phone">(042) 821-5114</li>
						<li class="fa-home">99, Daehak-ro, Yuseong-gu, Daejeon,<br />
							Republic of Korea
						</li>
					</ul>
				</section>
				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/Syllabus.js"></script>

</body>
</html>
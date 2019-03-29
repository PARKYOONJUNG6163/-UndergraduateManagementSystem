<%@page import="obj.Syllabus"%>
<%@page import="dao.SyllabusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<title>강의계획서 수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
 <%
 		request.setCharacterEncoding("utf-8");
 
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
					<a href="index.html" class="logo"><strong>강의계획서 수정</strong></a>
					<ul class="icons">
						<p><%=identifier %> 님 로그인 중</p>     
						<a href="Logout.jsp" class="button big">LOGOUT</a>
					
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						
				
						<%
							String subject_name = request.getParameter("subject_name");
							String academic_name = request.getParameter("academic_num");
							
							SyllabusDAO syllabusDAO = new SyllabusDAO();
							Syllabus selected_syllabus = syllabusDAO.getSyllabus(academic_name);
							
							if(selected_syllabus == null){
								%>
								<script>
									alert("등록된 강의계획서가 없습니다.");
									history.go(-1);
								</script>
								<%
							}else{	// else 처리해줘야 null 포인터 에러 없앨 수 있음
						%>
				
						<form id="createSyllabusForm"  method="get">
							과목  <input id="subject_name" type="text" value="<%=subject_name %>" disabled /> <br/>
							학수번호 <input name="academic_num" type="text" value="<%=academic_name %>" disabled /> <br/>
							수업 방법 <textarea name="lecture_way"><%=selected_syllabus.getLecture_way()%></textarea> <br/>
							평가 방법 <textarea name="test_way"><%=selected_syllabus.getTest_way() %></textarea> <br/>
							선수학습 내용 <textarea name="prerequisite_learning"><%=selected_syllabus.getPrerequisite_learning() %></textarea> <br/>
							수업 개요  <textarea name="out_line"><%=selected_syllabus.getOut_line() %></textarea><br/>
							교재  <textarea name="text_book"><%=selected_syllabus.getText_book() %></textarea><br/>
							강의 계획  <textarea name="lecture_plan"><%=selected_syllabus.getLecture_plan() %></textarea><br/>
							<button type="button" onclick="modifySyllabus();">수정</button>
						</form>
						<%
						}
						%>
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
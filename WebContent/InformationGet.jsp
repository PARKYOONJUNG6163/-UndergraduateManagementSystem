<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="dao.StudentDAO"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="obj.Student"%>
<%@page import="obj.Professor"%>
<!DOCTYPE html>
<html>
<head>
<title>학적 기본 조회</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css?after" />
</head>
<body class="is-preload">
 <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if(identifier == null ){
    		%>
    		<script>alert("로그인이 필요한 서비스입니다.");
    				location.href = "Redirect.jsp";
    		</script>
    		
    		<%
    		
    	}
    	else{
    %>
    
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>학적 기본 조회</strong></a>
		
						<ul class="icons" >
							<p><%=identifier %> 님 로그인 중</p>                                                 					
							<a href="Logout.jsp" class="button big">Logout</a>
						</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						<h3>학적 기본 정보</h3></br>
<%			if(identifier.length() == 9){ // 학생인 경우
				StudentDAO studentdao = new StudentDAO();
				Student s = studentdao.getStudentInformation(identifier);
%>
						<ul class="icons" >
							<h4>학번		<%=identifier %></h4> 
							<h4>이름		<%=s.getName() %></h4> 
							<h4>전공		<%=s.getMajor() %></h4>
							<h4>이메일		<%=s.getEmail() %></h4>
							<h4>전화번호		<%=s.getTel() %></h4>
							<h4>생년월일		<%=s.getBirth() %></h4>
							<h4>학적			<%=s.getStatus() %></h4>
							<h4>장학여부		<%=s.get_Is_Scholarship() %></h4>
							<h4>학년			<%=s.getGrade() %></h4>
						</ul>
<%			}else{   //교수인 경우
				ProfessorDAO professordao = new ProfessorDAO();
				Professor p = professordao.getProfessorInformation(identifier);	
%>		
						<ul class="icons" >
							<h4>교번		<%=identifier %></h4> 
							<h4>이름		<%=p.getName() %></h4> 
							<h4>전공		<%=p.getMajor() %></h4>
							<h4>이메일		<%=p.getEmail() %></h4>
							<h4>전화번호		<%=p.getTel() %></h4>
							<h4>생년월일		<%=p.getBirth() %></h4>
						</ul>
	<%}
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

</body>
</html>
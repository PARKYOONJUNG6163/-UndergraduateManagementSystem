<%@page import="obj.Scholarship"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.ScholarshipStatusDAO"%>
<%@page import="obj.Tuition"%>
<%@page import="dao.TuitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>등록금 고지서</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
 <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if((identifier == null) || (identifier.length() != 9)){
    		%>
    		<script>
    				alert("학생 로그인이 필요한 서비스입니다.");
    				location.href = "Redirect.jsp";
    		</script>
    		
    		<%
    		
    	}else{
    %>
    
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>등록금 고지서</strong></a>
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
							TuitionDAO tuitionDAO = new TuitionDAO();
							Tuition tuition = tuitionDAO.getTuition(identifier);
							
							
							if (tuition !=null){
								ScholarshipStatusDAO scholarshipStatusDAO = new ScholarshipStatusDAO();
								HashMap<String, Scholarship> scholarshipMap  =scholarshipStatusDAO.getScholarshipStudent();
								
								Scholarship scholarship = scholarshipMap.get(identifier);
						%>
							<form>
							학번 <input type="text" value="<%=tuition.getStudent_num()%>" disabled/> <br/>
							년도/학기 <input type="text" value="<%=tuition.getYear_and_semester()%>" disabled/> <br/>
							책정액 <input type="text" value="<%=tuition.getCharged_amount()%>" disabled/> <br/>
					<%		if (scholarship != null){
						    int  reduction_amount = scholarship.getMoney();		// 감면액
						    int actual_payment_amount = tuition.getCharged_amount() - reduction_amount;	// 실 납부액
						%>
							감면액  <input type="text" value="<%=reduction_amount%>" disabled/> <br/>
							실 납부액 <input type="text" value="<%=actual_payment_amount%>" disabled/> <br/>
							<%
							}else{
							%>
							감면액  <input type="text" value="<%=0%>" disabled/> <br/>
							실 납부액 <input type="text" value="<%=tuition.getCharged_amount() %>" disabled/> <br/>
							<%} %>
							
							가상계좌 <input type="text" value="<%=tuition.getVirtual_account_number()%>" disabled/> <br/>
							</form>
						
							<% 
							}else{
								
								%>
								<script>
									alert("등록된 강의계획서가 없습니다.");
									location.href = "InformationGet.jsp";
								</script>
								
								<%
							}
							
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
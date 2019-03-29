<%@page import="obj.Subject"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.EnrollClassDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<title>수강 신청</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css?after" />
</head>
<body class="is-preload">
 <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if((identifier == null) || (identifier.length() != 9)){
    		%>
    		<script>alert("학생 로그인이 필요한 서비스입니다.");
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
					<a href="index.html" class="logo"><strong>수강신청</strong></a>
					<ul class="icons">			
						<h4><%=identifier %> 님 로그인 중</h4>
						<a href="Logout.jsp" class="button big">Logout</a>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						<h3>수강신청 목록</h3></br>
						<table>
							<tr>
								<th>구분</th>
								<th>학수 번호</th>
								<th>과목 명</th>
								<th>학년</th>
								<th>개설 학과</th>
								<th>이수 구분</th>
								<th>총 인원</th>
								<th>현재 인원</th>
							</tr>
<%
			SubjectDAO subjectdao = new SubjectDAO();
			List<Subject> totalList = subjectdao.getTotalSubject();
			for(Subject subject : totalList){ // 수강신청 할 수 있는 목록 생성
%>
			<tr>
				<td><button type="button" onclick="enroll_list(this.id)" class="btn" id="<%=subject.getAcademic_num()%>">수강 신청</button></td>
				<td><%=subject.getAcademic_num()%></td>
				<td><%=subject.getSubject_name()%></td>
				<td><%=subject.getGrade()%></td>
				<td><%=subject.getDepartment()%></td>
				<td><%=subject.getDivision()%></td>
				<td><%=subject.getTotal_people()%></td>
				<td><%=subject.getNow_people()%></td>
			</tr>
			
<% } %>
			</table>
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
	<script>
	function enroll_list(id){
		var  academic_num = id;
		var select = document.getElementById(id);
		    	$.ajax({
		    		// ajax를 통한 백그라운드 연산.
		    		type : 'post',
		    		url : 'ajaxEnroll.jsp',
		    		data : {
		    			academic_num : academic_num
		    		},

		    		success : function(data) {
		    			// 서버에서 연산된 결과를 가지고 참 거짓을 판단하자.
		    			if ($.trim(data) == 'max') {
		    				alert("인원을 초과하였습니다.");
		    			}else if($.trim(data) == 'false'){
		    				alert("이미 수강신청한 과목입니다.");
		    			}else {
		    				alert("수강신청 성공");
		    				select.parentNode.parentNode.children[7].textContent = parseInt(select.parentNode.parentNode.children[7].textContent) + 1;
		    			}
		    		}
		    	});
	}
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
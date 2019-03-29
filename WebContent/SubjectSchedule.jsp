<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%@ page import="java.util.*"%>
 <%@ page import="java.sql.*"%>
 <%@page import="dao.SubjectDAO"%>
  <%@page import="dao.EnrollClassDAO"%>
<%@page import="obj.Subject"%>
<!DOCTYPE html>
<html>
<head>
<title>강의 시간표</title>
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
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>강의 시간표</strong></a>
					
					
							<ul class="icons" >
							<p><%=identifier %> 님 로그인 중</p>                                                 					
							<a href="Logout.jsp" class="button big">Logout</a>
							</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						<table>
						<caption><h2>강의 시간표</h2></caption>
        <tr align="center">
            <td width="50"></td>
            <td width="100" >월</td>
            <td width="100" >화</td>
            <td width="100" >수</td>
            <td width="100" >목</td>
            <td width="100" >금</td>
        </tr>
        
        <tr align="center">
            <td bgcolor="#FFA7A7">1</td>
            <td id="월1"></td>
            <td id="화1"></td>
            <td id="수1"></td>
            <td id="목1"></td>
            <td id="금1"></td>
        </tr>
 
        <tr align="center">
        	<td bgcolor="#FFA7A7">2</td>
            <td id="월2"></td>
            <td id="화2"></td>
            <td id="수2"></td>
            <td id="목2"></td>
            <td id="금2"></td>
        </tr>
 
        <tr align="center">
       		<td bgcolor="#FFA7A7">3</td>
            <td id="월3"></td>
            <td id="화3"></td>
            <td id="수3"></td>
            <td id="목3"></td>
            <td id="금3"></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#FFA7A7">4</td>
            <td id="월4"></td>
            <td id="화4"></td>
            <td id="수4"></td>
            <td id="목4"></td>
            <td id="금4"></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#FFA7A7">5</td>
            <td id="월5"></td>
            <td id="화5"></td>
            <td id="수5"></td>
            <td id="목5"></td>
            <td id="금5"></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#FFA7A7">6</td>
            <td id="월6"></td>
            <td id="화6"></td>
            <td id="수6"></td>
            <td id="목6"></td>
            <td id="금6"></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#FFA7A7">7</td>
            <td id="월7"></td>
            <td id="화7"></td>
            <td id="수7"></td>
            <td id="목7"></td>
            <td id="금7"></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#FFA7A7">8</td>
       	    <td id="월8"></td>
            <td id="화8"></td>
            <td id="수8"></td>
            <td id="목8"></td>
            <td id="금8"></td>
        </tr>
    </table>
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
		<script>
		window.onload=function make_schedule(){
			<%
 			EnrollClassDAO enrollclassdao = new EnrollClassDAO();
 			List<Subject> enrollClassSubjectList = enrollclassdao.getEnrollClassSubject(identifier);
 			for(Subject s : enrollClassSubjectList){
 				String[] day = s.getClass_time().split("-");
 				String period = day[1].replaceAll("교시", "");
 				String[] num  =period.split(",");
 				for(String n : num){ %>
 					document.getElementById("<%=day[0]+n%>").style.backgroundColor = "#FFA7A7";
 					document.getElementById("<%=day[0]+n%>").textContent = "<%=s.getSubject_name()%>";
 			   <%	} } %>
		}
 		</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
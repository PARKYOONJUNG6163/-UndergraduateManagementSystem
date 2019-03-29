<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="dao.ScholarshipStatusDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>장학생 등록</title>
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
					<a href="index.html" class="logo"><strong>장학생 등록</strong></a>
					<ul class="icons">
						<p><%=identifier %> 님 로그인 중</p>     
						<a href="Logout.jsp" class="button big">LOGOUT</a>
					
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
					<div style="float:left; margin-left:150px; margin-right:250px;">
					<p><center>장학금 테이블</center></p>
					<table>
					    	<tr>
								<th>장학금 종류</th>
								<th>장학 금액</th>

							</tr>
							<tr>
					  	 	 	<td>성적 격려 장학금</td>
					  	 	 	<td>1000000</td>
					  	 	 </tr>
					  	 	 <tr>
					  	 	 	<td>백마 복지 장학금</td>
					  	 	 	<td>500000</td>
					  	 	 </tr>
					  	 	 <tr>
					  	 	 	<td>외국어 성적 우수 장학금</td>
					  	 	 	<td>1000000</td>
					  	 	 </tr>
					  </table>
					</div> 
					<div style="float:left;"> 	 	 
					<form onSubmit="enroll_scholarship()" method="post" name="check">
					 <label for="student_num">학번</label> 
					 <input type = "text" style="width:300px;" id="numInput"><br>
					 <label for="type">장학금 종류</label> 
					 <input type = "text" style="width:300px;" id="typeInput"><br>
					 <label for="money">장학 금액</label> 
					 <input type = "text" style="width:300px;" id="moneyInput"><br>
					 <input type="submit" class="button big" value="장학생 등록">
					 </form>
					 </div>									
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
	function enroll_scholarship(){
		var student_num = document.getElementById("numInput").value;
		var type = document.getElementById("typeInput").value;
		var money = document.getElementById("moneyInput").value;
		
		$.ajax({
			type : 'post',
			url : 'ajaxScholarship.jsp',
			data : {
				student_num : student_num,
				type : type,
				money : money
			},

			success : function(data) {
				// 뒤에서 연산한 결과를 가지고 가부를 판단
				if ($.trim(data) == 'false') {
					alert("장학생 등록 실패!")
				} else {
					alert("장학생 등록 완료!")
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
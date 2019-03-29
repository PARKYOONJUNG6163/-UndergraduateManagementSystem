<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css?after" />
		<script src="assets/js/SignUp.js"></script>
	</head>
	<body class="is-preload">

     <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if(identifier != null){
    		%>
    		<script>alert("잘못된 접근입니다.");
    				location.href = "InformationGet.jsp";
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
									<a href="index.html" class="logo"><strong>회원가입</strong></a>
									<ul class="icons">
										<a href ="SignUp.jsp" class="button big">SignUp</a>
										<a href ="SignIn.jsp" class="button big">SignIn</a>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<!-- Text -->
									<form onSubmit="return val();" method="post" name="check" action="SignIn.jsp">
										<input type="radio" id="demo-priority-low" value = "student" name="rank" required>
										<label for="demo-priority-low">학생</label>
										<input type="radio" id="demo-priority-normal" value = "professor" name="rank" required>
										<label for="demo-priority-normal">교수</label><br><br>
										<label for="id">아이디</label> 
										<input type="text" placeholder="문자 or 숫자" id="id" name="ids" onblur="idChecking();" required>
										<input type="button" value="중복 체크" id = "overlapCheck" onclick="checkDup();"> 
										<br>
										<label for="pwd">Password</label> 
										<input type="password" id="pwd" name="pwds" placeholder="문자 or 숫자, 8자리 이상" onblur="pwdChecking();" required>
										<br> 
										<label for="cpwd">Password 확인</label> 
										<input type="password" id="cpwd" onblur="samePwd();" required> 
										<br> 
										<label for="name">이름</label> 
										<input type="text" id="nameInput" name="name" required>
										<br> 
										<label for="name">학과</label> 
										<input type="text" id="majorInput" name="major" placeholder="문자열만 입력 가능" required >
										<br> 
										<label for="tel">연락처</label> 
										<input type="text" id="telInput" name="tel" onblur="telChecking();" required>
										<br> 
										<label for="email">이메일</label>
										<input type="email" id="emailInput" name="email" onblur="emailChecking();" required>
										<br> 
										<label for="birth">생년월일</label>
										<input type="date" id="birthInput" name="birth" required>
										<br> 
										<label for="status">학적</label>
										<input type="text" id="statusInput" value = "재학" name="status" disabled>
										<br> 
										<br>
										<center><input type="submit" class="button big" value="가입하기"></center>
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

	</body>
</html>
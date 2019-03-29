<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%@ page import="java.util.*"%>
 <%@ page import="java.sql.*"%>
 <%@page import="dao.SubjectDAO"%>
<%@page import="obj.Subject"%>
<!DOCTYPE html>
<html>
<head>
<title>교과목 조회</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css?after" />
</head>
<body class="is-preload">
 <%
 		String identifier = (String)session.getAttribute("identifier");
 
    	if(identifier == null){
    		%>
    		<script>alert("로그인이 필요한 서비스입니다.");
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
					<a href="index.html" class="logo"><strong>교과목 조회</strong></a>
					
						
							<ul class="icons" >
							<p><%=identifier %> 님 로그인 중</p>                                                 					
							<a href="Logout.jsp" class="button big">Logout</a>
							</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
							<form method="post" name="check">
							<input type="text" id = "search_name"  name ="name" placeholder="과목명">
							<input type="text" id = "search_major" name = "major" placeholder="개설학과">
							<input type="text" id = "search_professor" name="professor" placeholder="교수명"></br></br>
								<select id="grade" name ="grade">
											<option value>학년</option>
										    <option value="1">1학년</option>
										    <option value="2">2학년</option>
										    <option value="3">3학년</option>
										    <option value="4">4학년</option>
								</select>
								<select id="division" name="division">
											<option value>이수 구분</option>
										    <option value="전공">전공</option>
										    <option value="교양">교양</option>
								</select>
								<input type="radio" onclick="select_disabled()" id="demo-priority-low" value = "subject" name="way">
								<label for="demo-priority-low">과목명</label>
								<input type="radio" onclick="select_disabled()" id="demo-priority-normal" value = "professor" name="way">
								<label for="demo-priority-normal">교수명</label>
								<input type="radio" onclick="select_disabled()" id="demo-priority-high" value = "major" name="way">
								<label for="demo-priority-high">학과명</label>
						<input type="submit" class="button" value="검색">
					</form>
<% 
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String grade = request.getParameter("grade");
	String division = request.getParameter("division");
	String professor = request.getParameter("professor");
	String way = request.getParameter("way");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/school_management?";
	String dbId = "parkyoonjung";
	String dbPass = "qkrdbswjd";

	try {	// 수강신청한 과목 하나씩 디비에 저장	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		SubjectDAO subjectdao = new SubjectDAO();
		List<Subject> list = new ArrayList<Subject>();
		
	if(way != null){
		if(way.equals("subject")){ // 과목명조회
			sql = "select academic_num from subject where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
		}else if(way.equals("major")){ // 전공명조회
			sql = "select academic_num from subject where department = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, major);
			rs = pstmt.executeQuery();
		}else if(way.equals("professor")){ // 교수명조회
			sql = "select academic_num from professor inner join subject on professor.professor_num = subject.professor_num where professor.name = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, professor);
			rs = pstmt.executeQuery();
		}
	}else{// 전체과목조회
		sql = "select academic_num from subject";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}	
	
	while(rs.next()){
		String search_subject = rs.getString("academic_num");
		Subject result = subjectdao.getSubject(search_subject);	
		list.add(result);
	}
%>
							<table>
							<tr>
								<th>학수 번호</th>
								<th>과목 명</th>
								<th>교수 명</th>
								<th>학년</th>
								<th>개설 학과</th>
								<th>이수 구분</th>
							</tr>
			<%	for(Subject s : list){ %>
				<tr>
				<td><%=s.getAcademic_num()%></td>
				<td><%=s.getSubject_name()%></td>
				<% 
				String pro_name=null;
				sql = "select name from professor where professor_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, s.getProfessor_num());
				rs = pstmt.executeQuery(); 
				while(rs.next()){
					pro_name = rs.getString("name"); 
				}
				%>
				<td><%=pro_name%></td>
				<td><%=s.getGrade()%></td>
				<td><%=s.getDepartment()%></td>
				<td><%=s.getDivision()%></td>
				</tr>
<% 			}
%>
</table>
							
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}

%>
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

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
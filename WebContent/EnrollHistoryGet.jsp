<%@page import="obj.Subject"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.EnrollClassDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<title>���� ��û ���� ��ȸ</title>
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
    		<script>alert("�л� �α����� �ʿ��� �����Դϴ�.");
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
					<a href="index.html" class="logo"><strong>������û ���� ��ȸ</strong></a>
					<ul class="icons">			
						<h4><%=identifier %> �� �α��� ��</h4>
						<a href="Logout.jsp" class="button big">Logout</a>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<!-- Text -->
						
							<h3>������û ����</h3></br>
					    <table>
					    	<tr>
								<th>�м� ��ȣ</th>
								<th>���� ��</th>
								<th>�г�</th>
								<th>���� �а�</th>
								<th>�̼� ����</th>
							</tr>
<%
			EnrollClassDAO enrollclassdao = new EnrollClassDAO();
			List<Subject> selectList = enrollclassdao.getEnrollClassSubject(identifier);
			for(Subject subject : selectList){ 
%>
			<tr>
				<td><%=subject.getAcademic_num()%></td>
				<td><%=subject.getSubject_name()%></td>
				<td><%=subject.getGrade()%></td>
				<td><%=subject.getDepartment()%></td>
				<td><%=subject.getDivision()%></td>
			</tr>
			
<% }  %>
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
						<li>��������</li>
							<ul>
								<li><a href="InformationGet.jsp">�����⺻ ��ȸ</a></li>
								<li><a href="InformationModify.jsp">�����⺻ ����</a></li>
							</ul>
						<li><a href="StudentStatusModify.jsp">���� ���� ��û</a></li>	
						<li><a href="StudentStatusChangeHistoryGet.jsp">���� ���� ���� ��ȸ</a></li>
						<li><a href="SubjectGet.jsp">������ ��ȸ</a></li>
						<li>������û</li>
							<ul>
								<li><a href="EnrollHistoryGet.jsp">������û ���� ��ȸ</a></li>
								<li><a href="EnrollSubject.jsp">������û ���</a></li>
								<li><a href="EnrollHistoryDelete.jsp">������û ���</a></li>
							</ul>
						<li><a href="SubjectSchedule.jsp">���� �ð�ǥ</a></li>	
						<li>����</li>
							<ul>
								<li><a href="CreditGet.jsp">���� ��ȸ</a></li>
								<li><a href="CreditCreate.jsp">���� ���</a></li>
								<li><a href="CreditModify.jsp">���� ����</a></li>
								<li><a href="CreditDelete.jsp">���� ����</a></li>
							</ul>
						
						<li>���ǰ�ȹ��</li>
							<ul>
								<li><a href="SyllabusGet.jsp">���ǰ�ȹ�� ��ȸ</a></li>
								<li><a href="SyllabusCreate.jsp">���ǰ�ȹ�� ���</a></li>
								<li><a href="SyllabusModify.jsp">���ǰ�ȹ�� ����</a></li>
								<li><a href="SyllabusDelete.jsp">���ǰ�ȹ�� ����</a></li>
							</ul>
						<li><a href="ScholarshipCreate.jsp">���л� ���</a></li>	
						<li><a href="ScholarshipGet.jsp">���л� ��Ȳ ��ȸ</a></li>
						<li><a href="TuitionGet.jsp">������ ��ȸ</a></li>
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
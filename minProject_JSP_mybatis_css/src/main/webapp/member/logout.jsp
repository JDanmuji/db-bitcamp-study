<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	String name = null;
	String id = null;
	
	//세션 
	session.removeAttribute("memName");
	session.removeAttribute("memId");

%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		
		<!-- Wrapper -->
			<div id="wrapper">
				<article id="DELETE">
					<h2 class="major">DELETE</h2>
						<form name="deleteForm" method="post" action="delete.jsp">
							<table>							
								<tr>
								  	<th>비밀번호 입력 : </th>
								  	<td>
								  		<ul class="actions">
								  	 		<li><input type="password" name="pwd" id="pwd" size="40" ></li>
								  	 		<li><input type="button" value="검색" onclick="checkDelete()"></li>
								  	 		<li><div id="pwdDiv"></div></li>
								  	 	</ul>
								  	</td>
								</tr>
  
							</table>
						</form>
					
					</article>
				
					
				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</footer>
				
			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script type="text/javascript" src="../js/member.js"></script>
			<script type="text/javascript">
			
			
			window.onload = function() {
				var result = ${result};
				
				if(!result) {
					var pwdDivTag = document.getElementById("pwdDiv");
					
					pwdDivTag.innerText="비밀번호가 맞지 않습니다";
				}
			}
			</script>

	</body>
</html>

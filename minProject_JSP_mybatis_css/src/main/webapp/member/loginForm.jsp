<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<article id="contact">
					<h2 class="major">Contact</h2>
						<form name="loginForm" method="post" action="login.jsp">
							<table>							
								<tr>
									<th>ID</th>
									<td>
										<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
										<div id="idDiv"></div>
									</td>
								</tr>
								<tr>
									<th>PASSWD</th>
									<td>
										<input type="password" name="pwd" id="pwd" size="40" >
  	 									<div id="pwdDiv"></div>
									</td>
								</tr>
								
								<tfoot>
									<tr>
										<td colspan="2" align="center">
  	 										<input type="button" value="로그인" onclick="checkLogin()">
	 										<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
  										</td>
									</tr>
								</tfoot>
							</table>
						</form>
					
					</article>
				
					
				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
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

	</body>
</html>

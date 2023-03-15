<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

	<head>
	<meta charset="UTF-8">
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon fa-gem"></span>
						</div>
						<div class="content">
							<div class="inner">
								<h1>WELCOME</h1>
								<p>mira make homepage <a href="https://github.com/JDanmuji">mira GitHub</a></p>
							</div>
						</div>
						<nav>
							<ul>
							
								<% if(session.getAttribute("memId") == null )  { %>
									<li><a href="./member/writeForm.jsp">회원가입</a></li>
									<li><a href="./member/loginForm.jsp">로그인</a></li>
									
								<% }else{ %>	
									<li><a href="./member/logout.jsp">로그아웃</a></li>
									<li><a href="./member/updateForm.jsp">회원정보수정</a></li>
									<li><a href="./member/deleteForm.jsp">회원탈퇴</a></li>
									<li><a href="./board/boardWriteForm.jsp">글쓰기</a></li>
									<li><a href="./board/boardList.jsp?pg=1">목록</a></li>	
								<% } %>
							
							</ul>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>

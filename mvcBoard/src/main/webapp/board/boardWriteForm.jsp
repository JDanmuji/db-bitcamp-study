<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
				<article id="BOARDWRITE">
					<h2 class="major">BOARD</h2>
						<form name="boardForm" method="post" action="/board/boardWrite.do">
							<table>							
								<tr>
									<th>제목</th>
								  	<td>
								  		<input type="text" name="subject" id="subject" size="40" placeholder="제목 입력">
								  	 	<div id="subjectDiv"></div>
								  	</td>
								 </tr>
								  
								 <tr>
								 	<th>내용</th>
								    <td>
								   		<textarea name="content" id="content" rows="15" cols="50"></textarea>
								     	<div id="contentDiv"></div>	
								    </td>
								  </tr>		
								
								<tfoot>
									<tr>
								  		<td colspan="2" align="center">
								  			<input type="button" value="글쓰기" onclick="checkBoardWrite()">
								  		 	<input type="reset" value="다시작성">
								  		</td>
								  	</tr>
								</tfoot>
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
			<script type="text/javascript" src="../js/board.js"></script>

	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	margin: 50px;
   width: 100%;
   height: 100%;
   font-family: serif;
   background-color: LemonChiffon;
}
html {
   overflow-y: scroll;
}
#wrap{
   width: 1100px; 
   margin: 0 auto;
}
header {
   height: 10%;
   text-align: center;
}
#container {
   margin: auto;
   width: 1100px;
   min-height: 500px;
}
#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}
input {
	padding: 6px;
	background-color: LemonChiffon;
	border: LemonChiffon;
	color: hotpink;
}
nav {
   margin-left: 10px;
   width: 25%;
   height: 100%;
   float: left;
}
section {
   width: 70%;
   height: 100%;
   float: left;
}
footer {
   width: 1100px;
   height: 10%;
}
img {
	width: 300px;
}
</style>
</head>
<body>

<div id="wrap">
	<header>
		<img src="/miniProject_JQuery/image/orange1.jpg" alt="orange"
			 onclick="location.href='http://localhost:8080/miniProject_JQuery/index.jsp'">
		<h1>MVC를 이용한 미니 프로젝트</h1>
		<jsp:include page="./main/menu.jsp"></jsp:include>
	</header>
	
	<div id="container">
		<nav>
			<jsp:include page="./main/nav.jsp"></jsp:include>
		</nav>
		<section>
			<h3>
				<c:if test="${ empty display }">
					오렌지 ....<br>
					오렌지 사세요..<br>
					신선해요...<br>
					<img src="/miniProject_JQuery/image/orange2.jpg">
				</c:if>
				<c:if test="${ not empty display }">
					<jsp:include page="${ display }"/>
				</c:if>
			</h3>
		</section>
	</div>

	<footer>
		<h4>비트캠프</h4>
	</footer>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
   width: 100%;
   height: 100%;
}
html {
   overflow-y: scroll;
}

#wrap{
   width: 1100px; 
   margin: 0 auto;
}

#header {
   height: 10%;
   text-align: center;
}

#container {
   margin: auto;
   width: 1100px;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   width: 25%;
   height: 100%;
   float: left;
}

#section {
   width: 70%;
   height: 100%;
   float: left;
}

#footer {
   width: 1100px;
   height: 10%;
}
</style>
</head>
<body>
<div id="warp">
	<div id="header">
		
		<img src="/images/main.png" width="80" height="80" onclick="location.href='../index.jsp'">
		<h1>MVC를 이용한 미니 프로젝트</h1>
		<jsp:include page="./main/menu.jsp"></jsp:include>
	</div>
	
	<div id="container">
		<div id="nav">
	
			<jsp:include page="/main/nav.jsp" />
		</div>
		<div id="section">
			<c:if test="${empty display}">
			
				<img src="/images/main3.jpg">
			</c:if>
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
		</div>
	</div>
	
	<div id="footer">
		<h4>비트캠프</h4>
	</div>
</div>                                                                                                                                                                                                                               



</body>
</html>
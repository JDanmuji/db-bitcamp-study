<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<c:set var="name" value="홍길동"/>
<c:set var="age">25</c:set>
<c:set var="sum" value="0" />


<c:forEach var="i" begin="1" end="10" step="1">
	${sum = sum + i}
	
</c:forEach>

<h2>${sum}</h2>

<c:forEach begin="1" end="10" var="i" step="1"> 
	<c:set var="j" value="${10-i+1}"></c:set> 
	${j}
 </c:forEach>

</body>
</html>
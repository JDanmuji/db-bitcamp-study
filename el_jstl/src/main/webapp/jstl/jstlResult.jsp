<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<ul>

<li>이름 :  ${param.name}</li>
<li>나이 :  ${param.age}
	<c:if test="${param.age >= 19}"><strong>성인</strong></c:if>
	<c:if test="${param.age < 19}"><strong>청소년</strong></c:if>
</li>
<li>색깔 :  ${param.color}

<c:choose>
	<c:when test="${param.color eq 'red'}"><strong>빨강</strong></c:when>
	<c:when test="${param.color eq 'green'}"><strong>초록</strong></c:when>
	<c:when test="${param.color eq 'blue'}"><strong>파랑</strong></c:when>
	<c:when test="${param.color eq 'magenta'}"><strong>보라</strong></c:when>	
	<c:otherwise><strong>하늘</strong></c:otherwise>	
</c:choose>

</li>

<li>취미 : 
	<c:forEach var="i" items="${paramValues.hobby}">
		<c:choose>
			<c:when test="${i eq 'book'}"><strong>독서</strong></c:when>
			<c:when test="${i eq 'movie'}"><strong>영화</strong></c:when>
			<c:when test="${i eq 'music'}"><strong>음악</strong></c:when>
			<c:when test="${i eq 'game'}"><strong>게임</strong></c:when>	
			<c:when test="${i eq 'shopping'}"><strong>쇼핑</strong></c:when>	
			<c:otherwise></c:otherwise>	
		</c:choose>
		
	</c:forEach>
</li>
</ul>
</body>

</html>
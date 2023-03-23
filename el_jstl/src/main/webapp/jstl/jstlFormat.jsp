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

숫자 포맷
<fmt:formatNumber type="number" value="123456789"/><br>
<fmt:formatNumber type="number" value="123456789.88"/><br>
<fmt:formatNumber type="number" value="123456789.88" maxFractionDigits="1"/><br>


<fmt:formatNumber type="number" value="123456.78" pattern="#,###"/><br>
<fmt:formatNumber type="number" value="123456.789" pattern=".##"/><br>
<fmt:formatNumber type="number" value="123456.789" maxFractionDigits="1" pattern="#,###.##"/><br>


<fmt:formatNumber type="number" value="0000.00" pattern="#,###.##"/><br>
<fmt:formatNumber type="number" value="0000.00" pattern="0,000.00"/><br>
<fmt:formatNumber type="number" value="12.3" pattern="000.00"/><br>

<br>
<c:set var="now" value="<%=new java.util.Date()%>"></c:set>
<c:out value="${now}"></c:out>
date : <fmt:formatDate type="date" value="${now}"/><br>
time : <fmt:formatDate type="time" value="${now}"/><br>
both : <fmt:formatDate type="both" value="${now}"/><br>
<br>

<fmt:formatDate type="both" value="${now}" pattern="yy-MM-dd hh:mm"/><br>
<fmt:formatDate type="date" value="${now}" pattern="yy-MM-dd"/><br>
<fmt:formatDate type="date" value="${now}" pattern="yy-MM-dd E요일 a"/><br>
<fmt:formatDate type="time" value="${now}" pattern="HH:mm:ss"/><br>
</body>
</html>
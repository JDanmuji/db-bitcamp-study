<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="angel" uri="tld"%>
<%@ taglib prefix="angel" uri="tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자바클래스의 메서드를 이용</h2>
<h2>${param.x} + ${param.y} = ${angel:sum(param.x, param.y)}</h2><br><br>
<h2>${param.x} * ${param.y} = ${angel:mul(param.x, param.y)}</h2><br><br>

</body>

</html>
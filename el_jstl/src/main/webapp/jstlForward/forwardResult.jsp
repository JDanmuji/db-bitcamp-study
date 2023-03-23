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
결과1 = ${ requestScope.list }<br>
세번째 항목1 = ${ requestScope.list[2] }<br>

결과2 = ${ requestScope.list2 }<br>

<!-- 메소드의 이름을 변수명 처럼 사용할 수 있다. -->
<c:forEach var="personDTO" items="${list2}">
  	이름 = ${personDTO.getName()} &emps; 나이 = ${personDTO.getAge()}<br>
  	이름 = ${personDTO.name} &emps; 나이 = ${personDTO.age}<br>
</c:forEach>

</body>
</html>
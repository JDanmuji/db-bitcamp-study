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

<h3>${sessionScope.memName}님 로그인</h3>
	<br>
<input type="button" value="회원정보수정" onclick="location.href='/member/logout.do'">
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
</body>
</html>









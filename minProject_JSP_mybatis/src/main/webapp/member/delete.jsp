<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	//데이터
	String id = session.getAttribute("memId").toString();
	String pwd = request.getParameter("pwd");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean result = memberDAO.memberDelete(id, pwd);
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(result) { %>
	<h3>회원 삭제 완료</h3>
	<input type='button' value='로그인' onclick="location.href='loginForm.jsp'">
<% }else{ %>
	<h3>패스워드가 맞지 않습니다.</h3>
	<br>
	<input type='button' value='뒤로' onclick='history.go(-1)'>
<%} %>
</body>
</html>









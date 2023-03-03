<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	//데이터
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	String name = memberDAO.memberLogin(id, pwd);
	
	pageContext.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(name == null) { %>
	<h3>아이디 또는 비밀번호가 맞지 않습니다.</h3>
	
<% }else{ %>
	<h3><%=name %>님 로그인</h3>
	<br>
	<input type="button" value="회원정보수정" onclick="location.href='updateForm.jsp?id=${id}'">
<%} %>
</body>
</html>









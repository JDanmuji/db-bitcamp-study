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
<% if(name == null) {
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
	
}else{
	
	//세션
	//HttpSession session = request.getSession(); -> error, JSP는 세션이 이미 내장 객체로 존재한다., jsp가 아닌 곳에서는 생성하여 사용한다.
	session.setAttribute("memName", name);
	session.setAttribute("memId", id);
	
	
	//페이지 이동
	//response.sendRedirect("loginOk.jsp");
	response.sendRedirect("http://localhost:8080/index.jsp");
} %>
</body>
</html>









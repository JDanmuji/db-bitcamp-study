<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>



<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();

Map<String, String> map = new HashMap<String, String>();
map.put("id", id);
map.put("pwd", pwd);

MemberDTO memberDTO = memberDAO.memberLogin(map);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(memberDTO == null) { 
  //페이지 이동
  response.sendRedirect("loginFail.jsp");
  
 } else {
	//세션
	//HttpSession session = request.getSession(); -> JSP에서는 이미 내장 객체로 생성되어 있으므로 중복
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	session.setAttribute("memPwd", pwd);
	session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	
	
	//페이지 이동
	 response.sendRedirect("loginOK.jsp");
 } %>
</body>
</html>
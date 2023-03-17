<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>

<%
//데이터 
	String name = null;
	String id = null;
	
	//쿠키
	/*
	Cookie[] ar = request.getCookies();
	if(ar != null){
		for(int i=0; i<ar.length; i++){
			String cookieName = ar[i].getName();
			String cookieValue = ar[i].getValue();
			
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName")) name = cookieValue;
			if(cookieName.equals("memId")) id = cookieValue;
		}
		
	}//if
	*/
	//세션
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3><img src="../image/icons8.png" width="50" onclick="location.href='../index.jsp'"
 style ="cursor : pointer"><%=name%>님이 로그인 하였습니다. </h3>
  <input type = "button" value ="로그아웃" onclick="location.href='logout.jsp'"> 
  <%--  <input type = "button" value ="회원정보수정" onclick='location.href= "updateForm.jsp?id=<%= id%>"'>--%>
  <input type = "button" value ="회원정보수정" onclick="location.href='updateForm.jsp'"> 
  <input type = "button" value ="회원탈퇴" onclick="location.href='deleteForm.jsp'"> 
  

</body>
</html>
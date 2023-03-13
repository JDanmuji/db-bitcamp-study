<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 데이터
	String name = null;
	String id = null;
	
/* 	// 쿠키
	Cookie[] ar = request.getCookies();// 특정 쿠키를 얻을수가 없으므로 모든 쿠키를 다 가져온다.
	if (ar != null) { // 3초가 지나서 쿠키가 다 없어진다.
		for(int i=0; i<ar.length; i++) {
			String cookieName = ar[i].getName();
			String cookieValue = ar[i].getValue();
					
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName")) name = cookieValue;
			if(cookieName.equals("memId")) id = cookieValue;
		} // for
	} // if */
	
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
<h3><img src="../image/sample.png" width="300" height="300" alt="마시마로" 
onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
<%=name%>님 로그인</h3>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">	
<input type="button" value="회원정보수정" onclick="location.href='updateForm.jsp'">
<input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
</body>
</html>
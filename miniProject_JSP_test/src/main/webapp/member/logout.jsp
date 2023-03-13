<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/* 	// 쿠키
	Cookie[] ar = request.getCookies();// 특정 쿠키를 얻을수가 없으므로 모든 쿠키를 다 가져온다.
	if (ar != null) { // 3초가 지나서 쿠키가 다 없어진다.
		for(int i=0; i<ar.length; i++) {
			if(ar[i].getName().equals("MemName")){
				ar[i].setMaxAge(0); // 쿠키 삭제
				
				// 클라이언트에게 보내기
				response.addCookie(ar[i]);
			}
			
			if(ar[i].getName().equals("MemId")){
				ar[i].setMaxAge(0); // 쿠키 삭제
				response.addCookie(ar[i]);
			}
		} // for
	} // if */
	
	// 세션
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	session.invalidate();			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
<img src="../image/sample.png" width="300" height="300" alt="마시마로" 
onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
<h3>로그아웃</h3>
<input type="button" value="로그인" onclick="location.href='loginForm.jsp'">
<script type="text/javascript">
window.onload=function() {
	alert("로그아웃");
	location.href = "../index.jsp";
}
</script>
</body>
</html>
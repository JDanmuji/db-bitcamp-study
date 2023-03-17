<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>
<% 
String id = (String)session.getAttribute("memId");
String pwd = (String)session.getAttribute("memPwd");


MemberDAO memberDAO = MemberDAO.getInstance();
memberDAO.memberDelete(id);

session.invalidate(); //모든 세션 삭제

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
 
 <script type="text/javascript">
 window.onload=function(){
	 alert("회원탈퇴 완료")
	 location.href = "loginForm.jsp";
 }
 </script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
	color:red;
	font-size:8pt;
}
</style>
</head>
<body>
<img src="../image/icons8.png" width="50" onclick="location.href='../index.jsp'"
 style ="cursor : pointer">
<h3> 로그인 </h3>
<form name ="loginForm" method="post" action = "login.jsp">
<table border ="1" cellpadding = "5" cellspacing="0">
	<tr>
		<th>아이디</th>
		<td><input type="text" name = "id" id="id" placeholder="아이디 입력" >
		<div id ="idDiv"></div>
		</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name = "pwd" id="pwd" placeholder="비밀번호 입력" >
		<div id ="pwdDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align = "center">
			<input type = "button" value ="로그인" onclick="checkLogin()">
			<input type = "button" value ="회원가입" onclick='location.href= "writeForm.jsp"'>
	</tr>

</table>
</form>
<script type="text/javascript" src="../js/member.js"></script>

</body>
</html>
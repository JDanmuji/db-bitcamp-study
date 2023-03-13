<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#idDiv {
		color: red;
		font-size: 8pt;
		font-weight: bold;
	}
	div#pwdDiv {
	color: red;
	font-size: 8pt;
	font-weight: bold;
	}		
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	form {
		margin-left: auto;
		margin-right: auto;
		text-align: left;
	}
</style>
</head>
<body>
	<div class="container">
	<img src="../image/sample.png" width="300" height="300" alt="마시마로" 
	onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
	<h3>로그인</h3>
	<form name="loginForm" method="post" action="login.jsp">
	<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" name="id" size="50" placeholder="아이디 입력">
			<div id=idDiv></div>
		</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" id="pwd" name="pwd" size="50" placeholder="비밀번호 입력">
			<div id=pwdDiv></div>
		</td>
	</tr>
	
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인" onclick="checkLogin()">
			<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
		</td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript" src="../js/member.js"></script> <!-- 스크립트끼리 막아야 한다!!!!!!  -->
<script type="text/javascript">
function checkLogin() {
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	
	if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText="아이디 입력";
		
	else if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호 입력";
	
	else
		document.writeForm.submit();
  }
</script>
</body>
</head>
</html>
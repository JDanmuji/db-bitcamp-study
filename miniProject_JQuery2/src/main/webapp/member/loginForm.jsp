<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
body{
	margin: 50px;
	font-family: serif;
	background-color: #EDF1D6;
	}
h2 {
	color: #609966;
	}
table, td {
	border-collapse: collapse;
	background-color: #9DC08B;
	border: #EDF1D6 1px solid;
	padding: 16px;
	margin: 16px;
	}
input, button {
	padding: 6px;
	background-color: #EDF1D6;
	border: #EDF1D6;
	color: #40513B;
	font-weight: 700;
}
input:hover, input:hover,
button:hover, button:active {
	text-decoration: underline;
}
th {
	padding: 8px;
	background-color: #40513B;
	color: #EDF1D6;
	border: #EDF1D6 1px solid;
}
#idDiv, #pwdDiv {
	margin-top: 8px;
	color: #40513B;
	font-weight: 600;
	font-size: 12px;
</style>

</head>

<body>
	<h2><i>You already have your account?</i></h2>
	
	<form name="loginForm" id="loginForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd">
					<div id="pwdDiv"></div>
				</td>
			</tr>
		</table>
		
		<button type="button" id="loginBtn" style="margin-left:96px; margin-right:32px;">로그인</button>
		<input type="button" value="회원가입" onclick="location.href='writeForm.do'">
		
		<div id="loginResult"></div>
	</form>

<!--
<script type="text/javascript">
/* 
function checkLogin() {
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";

	if (document.loginForm.id.value == "") {
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	} else if (document.loginForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	} else {
		document.loginForm.submit();
	}
}
-->
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function() {
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val() == '') {
		$('#idDiv').text('아이디 입력하세요');
		$('#id').focus();
	}
	else if($('#pwd').val() == '') {
		$('#pwdDiv').text('비밀번호 입력하세요');
		$('#pwd').focus();
	}
	else {
		$.ajax({ //=jquery.ajax(), jquery와 ajax를 동시에 요청함(필요한 과정 처리 후 다시 원래 페이지로 돌아옴)
		
			type: 'post', //'get' or 'post'
			
			url: '/miniProject_JQuery/member/login.do', //이동할 요청주소 (form action 주소)
			
			data: 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(), //서버로 보낼 데이터
			
			dataType: 'text', //서버로부터 받는 자료형 - text, xml, html, json 중 1
			
			success: function(result) {
				result = result.trim();
				
				if(result=='ok') location.href = '../index.jsp';
				else if(result=='fail') {
					$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
					$('#loginResult').css('font-size', '12pt');
				}
			},

			error: function(err) {
				console.log(err); //에러날 경우 콘솔에 출력
			}
			
		});
	}
});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Us</title>

<style type="text/css">
	body{
		margin: 50px;
		font-family: serif;
		background-color: LemonChiffon;
		}
	h3 {
		color: Salmon;
		}
	table {
		border-collapse: collapse;
		background-color: pink;
		border: LemonChiffon 3px solid;
		}
	input {
		padding: 6px;
		background-color: LemonChiffon;
		border: LemonChiffon;
		color: hotpink;
	}
	.select {
		margin-left: 32px;
		font-weight: 700;
		}
	option {
		padding: 4px;
		width: 80px;
	}
	th {
		padding: 8px;
		background-color: Thistle;
		color: white;
	}
	#nameDiv, #idDiv, #pwdDiv, #repwdDiv, #emailDiv, #phoneDiv, #addrDiv {
		margin-top:8px;
		color: hotpink;
		font-weight: 600;
		font-size: 12px;
	}
</style>
</head>

<body>

<h3><i>Join Us</i></h3>

<form name="writeForm" id="writeForm" method="post" action="write.do">

	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" id="name" placeholder="이름을 입력하세요">
				<div id="nameDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
				<!-- 선생님 코드 -->
				<!-- <input type="hidden"> 태그를 추가하여 중복체크를 마치면 위 input 값을 똑같이 입력 -->
				<!-- 두 input 값이 일치하지 않으면 중복체크 경고가 뜨도록 함 -->
				<input type="hidden" id="check" value="">
				<div id="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" style="width: 320px;">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="repwd" id="repwd" style="width: 320px;">
				<div id="repwdDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" id="gender_m" value="0" checked="checked">
				<label for="gender_m"> 남자</label>
				&nbsp; <!-- 간격 띄우기 -->
				<input type="radio" name="gender" id="gender_w" value="1">
				<label for="gender_w"> 여자</label>
				<div id="genderDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email1" style="width: 120px;">
				<span>@</span>
				<input type="text" name="email2" id="email2" style="width: 120px;">
				<select name="email3" id="email3" style="width: 100px;" onchange="select()">
				    <option value="">직접입력</option>
				    <option value="naver.com">naver.com</option>
				    <option value="gmail.com">gmail.com</option>
				    <option value="nate.com">nate.com</option>
				</select>
				<div id="emailDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>휴대폰</th>
			<td>
				<select name="phone1" style="width: 50px;">
				    <option value="010">010</option>
				    <option value="011">011</option>
				    <option value="019">019</option>
				</select>
				<span>-</span>
				<input type="text" name="phone2" style="width: 120px;">
				<span>-</span>
				<input type="text" name="phone3" style="width: 120px;">
				<div id="phoneDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly>
				<input type="button" value="우편번호 검색" name="zipButton" id="zipButton" onclick="execDaumPostcode()" style="margin-left:16px;">
				<br/><br/>
				<input type="text" name="addr1" id="addr1" placeholder="주소" style="width: 90%;" readonly>
				<br/><br/>
				<input type="text" name="addr2" placeholder="상세주소" style="width: 90%;">
				<div id="addrDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="가입하기" id="writeBtn" class="select">
				<input type="reset" value="다시작성" name="reset" class="select">
				<input type='button' value='로그인' onclick="location.href='loginForm.do'" class="select">
			</td>
		</tr>
	</table>
</form>

<!-- 다음 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://localhost:8080/miniProject_JQuery/js/member.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$('#id').focusout(function() {
	if($('#id').val() == '') {
		$('#idDiv').text('아이디를 입력하세요');
	}
	else {
		$.ajax({ //=jquery.ajax(), jquery와 ajax를 동시에 요청함(필요한 과정 처리 후 다시 원래 페이지로 돌아옴)
		
			type: 'post', //'get' or 'post'
			
			url: '/miniProject_JQuery/member/checkId.do', //이동할 요청주소 (form action 주소)
			
			data: 'id=' + $('#id').val(), //서버로 보낼 데이터
			
			dataType: 'text', //서버로부터 받는 자료형 - text, xml, html, json 중 1
			
			success: function(data) {
				data = data.trim();
				
				if(data=='exist') {
					$('#idDiv').html('<span style="color:blue;">이미 사용중인 아이디입니다.</span>');
					$('#id').focus();
				}
				else if(data=='non_exist') {
					$('#idDiv').text('사용 가능한 아이디입니다.');
					
					//중복체크 확인용
					$('#check').val($('#id').val());
				}
			},

			error: function(err) {
				console.log(err); //에러날 경우 콘솔에 출력
			}
		});
	}
});
</script>
</body>
</html>
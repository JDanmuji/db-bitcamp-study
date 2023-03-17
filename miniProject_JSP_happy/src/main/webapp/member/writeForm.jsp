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
<form name="writeForm" method="post" action="write.jsp">
<h2>회원가입</h2><br>
<table border = "1" cellpadding ="5" cellspacing="0">
	<tr>
		<th>이름</th>
		<td><input type="text" name = "name" id="name" placeholder="이름 입력" >
		<div id ="nameDiv"></div>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name = "id"  id= "id" placeholder="아이디 입력" size = "30">
			<input type="hidden" id="check" value="">
			<input type="button" value="중복체크" onclick="checkId()">
		<div id ="idDiv"></div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width=350><input type="password" id= "pwd" name = "pwd" size = "40" >
		<div id ="pwdDiv"></div>
		</td>
	</tr>
	<tr>
		<th>재확인</th>
		<td ><input type="password" id= "repwd" name = "repwd" size = "40" >
		<div id ="repwd"></div> 
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name = "gender" id="gender_m" value="0" checked="checked">
			<label for="gender_m">남자</label>
			&nbsp;&nbsp;
			<input type="radio" name = "gender" id="gender_w" value="1">
			<label for="gender_w">여자</label>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="text" id="email1" name ="email1" style="width:30%;"> @		
		<input type="text" id="email2"name ="email2" style="width:30%;" >
		<select name = email3 style="width:100px;" onchange="select()">
			   		<option value="">직접입력</option>
	    			<option value="naver.com">naver.com</option>
	    			<option value="gmail.com">gmail.com</option>
	    			<option value="nate.com">nate.com</option>
		    </select>
		<div id ="email"></div>
		</td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td>
		<select name = "tel1" style="width:80px;">
			   		<option value="">선택</option>
	    			<option value="010">010</option>
	    			<option value="011">011</option>
	    			<option value="019">019</option>
		    		</select>-
		<input type="text" name = "tel2" size = "7" > -
		<input type="text" name = "tel3" size = "7" >
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" name = "zipcode" id = "zipcode" size = "10" placeholder="우편번호" readonly/>
		<input type = "button" value ="우편번호검색" onclick="post()">
		<br> 
		<input type="text" name = "addr1" id = "addr1" size = "50" placeholder="주소" readonly/>
		<br> 
		<input type="text" name = "addr2" id = "addr2" size = "50" placeholder="상세주소"/>
		
		</td>
	</tr>
	<tr>
		<td colspan="2" align = "center">
			<input type = "button" value ="회원가입" onclick="checkWrite()">
			<input type = "reset" value ="다시작성">
	</tr>
</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">


function checkId(){
	var id = document.getElementById("id").value;//변수 잡아 주기
	
	document.getElementById("idDiv").innerText ="";//초기화 
	
	if(id=="")
	document.getElementById("idDiv").innerHTML = "<font color='magenta'>먼저 아이디를 입력하세요</font>";
	else
		window.open("./checkId.jsp?id="+id,"once","width=500 height=250 left=700 top=300");//once 명칭 넣어주면 창이 한번만 뜸
	
}


</script>
</body>
</html>
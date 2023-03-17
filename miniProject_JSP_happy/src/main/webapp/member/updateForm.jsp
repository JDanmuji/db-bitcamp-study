<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>

<%
	//데이터
	//String id = request.getParameter("id");
	String id = (String)session.getAttribute("memId");//세션으로 부터 값 얻어 오기

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.getMember(id);
	

%>
    

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

<body onload="pick()">
<form name="updateForm" method="get" action="updateJSP.jsp">

<img src="../image/icons8128.png" onclick="location.href='../index.jsp'"
 style ="cursor : pointer">
<h2>회원정보수정</h2><br>
<table border = "1" cellpadding ="5" cellspacing="0">
	<tr>
		<th>이름</th>
		<td><input type="text" name = "name" id="name" value="<%= memberDTO.getName() %>">
		<div id ="nameDiv"></div>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name = "id"  id= "id" size = "30" value="<%= id%>" readonly="readonly">
		<div id ="idDiv"></div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width=350><input type="password" id= "pwd" name = "pwd" size = "40" value="<%=memberDTO.getPwd() %>" readonly >
		<div id ="pwdDiv"></div>
		</td>
	</tr>
		<th>성별</th>
		<td>
			<input type="radio" name = "gender" id="gender_m" value="0" checked="checked"/>
			<label for="gender_m">남자</label>
			&nbsp;&nbsp;
			<input type="radio" name = "gender" id="gender_w" value="1"/>
			<label for="gender_w">여자</label>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="text" name ="email1" id= "email1" style="width:30%;" value="<%=memberDTO.getEmail1() %>"> @		
		<input type="text" name ="email2" id= "email2" style="width:30%;" value="<%=memberDTO.getEmail2() %>">
		<select name = "email3" id= "email3" style="width:100px;" onchange="select()">
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
	    			<option value="010" <%= memberDTO.getTel1().equals("010")? "selected" : ""%>>010</option>
	    			<option value="011" <%= memberDTO.getTel1().equals("011")? "selected" : ""%>>011</option>
	    			<option value="019" <%= memberDTO.getTel1().equals("019")? "selected" : ""%>>019</option>
		    		</select>-
		<input type="text" name = "tel2" size = "7" value="<%=memberDTO.getTel2() %>"> -
		<input type="text" name = "tel3" size = "7" value="<%=memberDTO.getTel3() %>">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" name = "zipcode" id = "zipcode" size = "10" placeholder="우편번호" readonly value="<%=memberDTO.getZipcode() %>">
		<input type = "button" value ="우편번호검색" onclick="post()">
		<br> 
		<input type="text" name = "addr1" id = "addr1" size = "50" placeholder="주소" readonly value="<%=memberDTO.getAddr1() %>"/>
		<br> 
		<input type="text" name = "addr2" id = "addr2" size = "50" placeholder="상세주소" value="<%=memberDTO.getAddr2() %>"/>
		
		</td>
	</tr>
	<tr>
		<td colspan="2" align = "center">
			<input type = "button" value ="회원정보수정" onclick="checkupdate()">
			<input type = "reset" value ="취소" onclick="location.href='../index.jsp'">
	</tr>
</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
function pick(){
	document.updateForm.gender[<%=memberDTO.getGender() %>].checked = true; //여자 선택
	document.updateForm.tel1.value = '<%=memberDTO.getTel1()%>'
}

</script>
</body>
</html>
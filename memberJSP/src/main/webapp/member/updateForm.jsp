<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
<%
	//데이터
	String id = request.getParameter("id");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = new MemberDTO();
	memberDTO = memberDAO.memberSearch(id);

	pageContext.setAttribute("memberDTO", memberDTO);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="updateForm" method="post" action="update.jsp">
 <table border="1" cellpadding="5" cellspacing="0">
  <tr>
  	<th>이름</th>
  	<td>
  	 <input type="text" name="name" id="name" placeholder="이름 입력" value="${memberDTO.name}">
  	 <div id="nameDiv"></div>
  	</td>
  </tr>
  
  <tr>
  	<th>아이디</th>
  	<td>
  	 <input type="text" name="id" id="id" size="30" placeholder="아이디 입력" value="${memberDTO.id}" disabled>
  	 <div id="idDiv"></div>
  	</td>
  </tr>
  
  <tr>
  	<th>비밀번호</th>
  	<td>
  	 <input type="password" name="pwd" id="pwd" size="40" value="${memberDTO.pwd}" >
  	 <div id="pwdDiv"></div>
  	</td>
  </tr>
  
  <tr>
  	<th>재확인</th>
  	<td>
  	 <input type="password" name="rdpwd" id="repwd" size="40" value="${memberDTO.pwd}"  >
  	</td>
  </tr>
  
  <tr>
   <th>성별</th>
    <td>
     <input type="radio" name="gender" id="gender_m" value="0" />
     <label for="gender_m">남자</label>			
     <input type="radio" name="gender" id="gender_f" value="1" />
     <label for="gender_f">여자</label>	
    </td>		
  </tr>
  
  <tr>
   <th>이메일</th>
   <td>
    <input type="text" name="email1" style="width: 120px;" value="${memberDTO.email1}">
    @
    <input type="text" name="email2" style="width: 120px;" value="${memberDTO.email2}">
    <select name="email3" id="email3" style="width: 120px;" onchange="select()" >
     <option value="">직접입력</option>
     <option value="naver.com">naver.com</option>
     <option value="gmail.com">gmail.com</option>
     <option value="nate.com">nate.com</option>
    </select>
   </td>
  </tr>
  
  <tr>
   <th>휴대폰</th>
   <td>
    <select name="tel1" id="tel1" style="width: 70px;">
     <option value="010">010</option>
     <option value="011">011</option>
     <option value="019">019</option>
     <option value="070">070</option>
    </select>
    <input type="hidden"  name="tel1" id="tel1" value="${memberDTO.tel1}">
    -
    <input type="text" name="tel2" style="width: 70px;" value="${memberDTO.tel2}">
    -
    <input type="text" name="tel3" style="width: 70px;" value="${memberDTO.tel3}">
   </td>
  </tr>
  
  <tr>
   <th>주소</th>
   <td>
    <input type="text" name="zipcode" id="zipcode" size="5" placeholder="우편번호" value="${memberDTO.zipcode}" readonly>
    <input type="button" value="우편번호검색" onclick="execDaumPostcode()">
    <br>
    <input type="text" name="addr1" id="addr1" style="width: 400px;" placeholder="주소" value="${memberDTO.addr1}" readonly/>
    <br>
    <input type="text" name="addr2" id="addr2" style="width: 400px;" placeholder="상세주소" value="${memberDTO.addr2}"/>
   </td>
  </tr>
  
  <tr>
  	<td colspan="2" align="center">
  	 <input type="button" value="수정하기" onclick="checkUpdate()">
  	 <input type="reset" value="다시작성">
  	</td>
  </tr>
 </table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">


window.onload = function(){
	
	var data =  '${memberDTO.email2}';
	if (${memberDTO.gender} == 0) {
		document.getElementById("gender_m").checked = true;
	} else {
		document.getElementById("gender_f").checked = true;
	}
	
	
	for(var i=0; i < document.getElementById("email3").length; i++) {
		
		if (document.getElementById("email3")[i].value ==data ){
			document.getElementById("email3")[i].selected = true;
		}
	}
	

	
	for(var i=0; i < document.getElementById("tel1").length; i++) {
		
		if (document.getElementById("tel1")[i].value =='${memberDTO.tel1}' ){
			document.getElementById("tel1")[i].selected = true;
		}
	}

}





</script>
</body>
</html>










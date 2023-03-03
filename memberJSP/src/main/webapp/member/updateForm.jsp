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


function checkUpdate() {
	document.getElementById("pwdDiv").innerText = "";
	
	if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호 입력";
	else
		document.getElementById("id").disabled = false;
		document.updateForm.submit();
}


function select(){
	document.updateForm.email2.value = document.updateForm.email3.value;
}

function checkWrite(){
	//if(document.updateForm.name.value == "") alert("이름 입력하세요")
	//if(document.getElementById("name").value == "") alert("이름 입력하세요")
	
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	
	if(document.getElementById("name").value == "")
		document.getElementById("nameDiv").innerText="이름 입력";
	else if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText="아이디 입력";
	else if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호 입력";
	else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
		document.getElementById("pwdDiv").innerText="비밀번호가 맞지 않습니다";
	else
		document.updateForm.submit();
}

/* Daum 우편번호 */
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

function memeberUpdateFormSelect() {
	
	
}




</script>
</body>
</html>










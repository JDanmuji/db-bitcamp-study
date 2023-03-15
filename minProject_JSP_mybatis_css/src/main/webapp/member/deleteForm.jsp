<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String result = "true";
	
	session.setAttribute("result", "true");
	result = session.getAttribute("result").toString();
	

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
<form name="deleteForm" method="post" action="delete.jsp">
 <table border="1" cellpadding="5" cellspacing="0">
  
   <tr>
  	<th>비밀번호 입력 : </th>
  	<td>
  	 <input type="password" name="pwd" id="pwd" size="40" >
  	 <input type="button" value="검색" onclick="checkDelete()">
  	 <div id="pwdDiv"></div>
  	</td>
   </tr>
  
 
 </table>
</form>

<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">


window.onload = function() {
	var result = ${result};
	
	if(!result) {
		var pwdDivTag = document.getElementById("pwdDiv");
		
		pwdDivTag.innerText="비밀번호가 맞지 않습니다";
	}
}
</script>

</body>
</html>
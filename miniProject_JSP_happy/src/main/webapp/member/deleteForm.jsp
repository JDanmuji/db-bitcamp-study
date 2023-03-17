<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>

<%
	String id = (String)session.getAttribute("memId");
	String memPwd = (String)session.getAttribute("memPwd");//세션에 있는 데이터
    String pwd = request.getParameter("pwd");//넘어온 데이터
    
    //세션
    
    //DB
    boolean exist = false;
    if(pwd!=null){
    	//MemberDAO memberDAO = MemberDAO.getInstance(); DB확인해서 가져오기
    	//exist = memberDAO.isexistPwd(id,pwd);//true,false을 위한 데이터 확인 "is"
    	if(memPwd.equals(pwd)) exist = true;
    }
    if(exist)response.sendRedirect("delete.jsp");
        
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#pwdDiv{
	color:red;
	font-weight:bold;
}
</style>
</head>
<body>
<form name ="deleteForm" method="post" action="deleteForm.jsp">
<div style="text-align :center">

		<td>비밀번호 입력 : <input type="password" id= "pwd" name = "pwd" size = "15" >
		<input type = "button" value ="검색" onclick ="checkDelete()">
		<input type = "reset" value ="취소" onclick="location.href='updateForm.jsp'">
		<br><br>
		<div id="pwdDiv">
				<%if(pwd !=null && !exist){%>
					비밀번호가 맞지 않습니다.
				<%}%>
		</div>
		</td>
		<div id ="pwdDiv"></div> 
		
	

</form>

<script type="text/javascript">
function checkDelete(){
	document.getElementById("pwdDiv").innerText="";
	
	if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
	
	else document.deleteForm.submit();
}

</script>
</body>
</html>
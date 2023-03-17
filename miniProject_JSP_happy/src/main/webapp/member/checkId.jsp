<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dad.MemberDAO"%>
<% 
	//데이터
	String id = request.getParameter("id");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean existId = memberDAO.isExistId(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(existId == true){ %>
	<form action="checkId.jsp">
	<h4 align="center"><%=id %>는 사용 불가능</h4>
	<br>
	아이디 <input type="text" name="id"> <input type="submit" value="중복체크">
	</form>
	<%}else{ %>
	<h4 align="center"><span style="color:orange;"><%=id %></span>는 사용 가능 합니다.</h4>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')">
	<%} %>
	
	
<script type="text/javascript">
function checkIdClose(id){
	opener.writeForm.id.value = id
	opener.writeForm.check.value = id
	window.close()
	opener.writeForm.pwd.focus()
}

</script>
</body>
</html>
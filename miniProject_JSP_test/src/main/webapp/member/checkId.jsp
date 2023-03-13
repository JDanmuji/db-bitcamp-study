<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%
	// 데이터
	String id = request.getParameter("id");
	
	// DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean existId = memberDAO.isExistId(id); // 아이디가 있다/true/사용 불가능/
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
<% if(existId) { %>
	<form name="checkIdForm" action="checkId.jsp">
		<img src="../image/sample1.jpg" width="75" height="75" alt="마시마로" 
		onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
		<h5>입력하신 <%=id %>은(는)<br>
		이미 사용중인 ID 입니다.<br>
		다른 ID를 입력하세요</h5>
		<input type="hidden" name="chResult" value="N" />
		아이디 <input type="text" name="id"><input type="submit" value="중복체크" >
	</form>
<%} else {%>
		<img src="../image/sample.png" width="80" height="80" alt="마시마로" 
		onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
		<h5>입력하신 <%=id %>은(는)<br>
		사용 가능한 아이디 입니다.</h5>
		<input type="hidden" name="ChResult" value="Y" />
		<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<% } %>

<script type="text/javascript">
function checkIdClose(id) {
	opener.writeForm.id.value = id
	opener.writeForm.check.value = id // 중복체크 버튼을 눌렀다는 확인
	window.close()
	opener.writeForm.pwd.focus()
	}
		  
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


html,
body {
  height: 100%;
}

body {
  margin: 0;
  background: linear-gradient(45deg, #49a09d, #5f2c82);
  font-family: sans-serif;
  font-weight: 100;
}

.container {
  position: absolute;
  top: 50px;
  left: 50px;
  
}

table {
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
}


div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="boardForm" method="post" action="/board/boardWrite.do">
 <table border="1" cellpadding="5" cellspacing="0">

  <tr>
  	<th>제목</th>
  	<td>
  	 <input type="text" name="subject" id="subject" size="40" placeholder="제목 입력" >
  	 <div id="subjectDiv"></div>
  	</td>
  </tr>
  <tr>
  	<td>  	 
  	 	
  	</td>
  	<td>
  	 
  	 
  	</td>
  </tr>
  <tr>
   <th>내용</th>
    <td>
     <textarea name="content" id="content" rows="15" cols="50"></textarea>
     <div id="contentDiv"></div>	
    </td>		
  </tr>
  
  
  <tr>
  	<td colspan="2" align="center">
  	<input type="button" value="목록" onclick="location.href='/board/boardList.do'">
  	 <!-- <input type="button" value="다시작성" onclick="resetBoard()"> -->
  	</td>
  </tr>
 </table>
</form>

<script type="text/javascript">

window.onload = function() {
	
	var loginId = '${loginId}';
	
	console.log(loginId);
	

	if(!loginId) {
		alert("먼저 로그인하세요.");
		window.location.href="http://localhost:8080/index.jsp";
		return;
	}
	
	var subject = '${selectList.subject}';
	var content = '${selectList.content}';
	
	document.getElementById("subject").value = subject;
	document.getElementById("content").value = content;


	
}


function resetBoard(){

	
	document.getElementById("subject").value = '${selectList.subject}';
	document.getElementById("content").value = '${selectList.content}';
}

</script>
<script type="text/javascript" src="../js/board.js"></script>

</body>
</html>
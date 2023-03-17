<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

div#subjectDiv{
	color:red;
	font-weight:bold;
	font-size:7pt;
}
div#contentDiv{
	color:red;
	font-weight:bold;
	font-size:7pt;
}

</style>
</head>
<body>
<form name ="boardWriteForm" method="post" action = "boardWrite.jsp">

<h3 style= color:#BE6DB7;><img src="../image/icons896.png" width="50" onclick="location.href='../index.jsp'"
 style ="cursor : pointer">글쓰기</h3>
<table style=background-color:#FFFAFA; border ="1" cellpadding = "5" cellspacing="0">
	<tr>
		<th style= color:#FF8787;>제목</th>
		<td colspan="2"><input type="text" name = "subject" id="subject" size=52 placeholder="제목 입력" >
		<div id ="subjectDiv"></div>
		</td>
	</tr>
	
	<tr>
		<th style= color:#FF8787;>내용</th>
		<td colspan="2"><textarea name="content" id="content" rows="20" cols="50" ></textarea>
		<div id ="contentDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align = "center">
			<input type = "button" value ="글쓰기" onclick="checkBoardWrite()" >
			<input type = "reset" value ="다시작성" >
	</tr>
</table>
</form>
<script type="text/javascript">
function checkBoardWrite(){
	document.getElementById("subjectDiv").innerText=""
	document.getElementById("contentDiv").innerText=""
	
	if(document.getElementById("subject").value == ""){
	document.getElementById("subjectDiv").innerText="제목을 입력하세요";
	document.getElementById("subject").focus();
	}
	else if(document.getElementById("content").value == ""){
		document.getElementById("contentDiv").innerText="내용을 입력하세요";
		document.getElementById("content").focus();
	}
	else 
		document.boardWriteForm.submit();
	}

</script>
</body>
</html>
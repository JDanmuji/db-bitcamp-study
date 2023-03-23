<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h5>입력하신 ${id}은(는)<br>
사용 가능한 아이디 입니다.</h5>
<input type="hidden" name="ChResult" value="Y" />
<input type="button" value="사용하기" onclick="checkIdClose('${id}')">

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









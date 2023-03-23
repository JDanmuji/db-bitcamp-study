<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">


window.onload = function() {
	var result = ${result};
	
	//result check
	if (result) {
		alert("글 작성 성공");		
		window.location.href="/board/boardList.do";
	} else {
		alert("글 작성 실패");
		window.history.back();
	}
	
}


</script>

</body>


</html>











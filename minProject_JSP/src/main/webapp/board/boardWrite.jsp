<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>
<%
	//데이터
	request.setCharacterEncoding("UTF-8"); //post인 경우
	String id = session.getAttribute("memId").toString();
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	//map 으로 처리

	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	boolean result = boardDAO.boardWrite(boardDTO);
	
	pageContext.setAttribute("result", result);

%>

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
		window.location.href="http://localhost:8080/index.jsp";
	} else {
		alert("글 작성 실패");
		window.history.back();
	}
	
}


</script>

</body>


</html>











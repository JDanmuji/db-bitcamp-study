<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>
<%
	//데이터
	request.setCharacterEncoding("UTF-8"); //post인 경우
	
	//map 으로 처리

	BoardDTO boardDTO = new BoardDTO();
	
	
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
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="boardForm" method="post" action="boardWrite.jsp">
 <table border="1" cellpadding="5" cellspacing="0">

  <tr>
  	<th>제목</th>
  	<td>
  	 <input type="text" name="subject" id="subject" size="40" placeholder="제목 입력">
  	 <div id="subjectDiv"></div>
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
  	<input type="button" value="글쓰기" onclick="checkBoardWrite()">
  	 <input type="reset" value="다시작성">
  	 <!-- <input type="button" value="글목록" onclick="clickList()"> -->
  	</td>
  </tr>
 </table>
</form>

<script type="text/javascript" src="../js/board.js"></script>
</body>
</html>
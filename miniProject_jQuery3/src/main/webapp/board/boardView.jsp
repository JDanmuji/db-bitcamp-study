<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.b\ean.BoardDTO" %>
<%
	//데이터
	request.setCharacterEncoding("UTF-8"); //post인 경우
	
	String loginId = null;
	int seq = Integer.parseInt(request.getParameter("seq"));

	if(session.getAttribute("memId") != null) {
		loginId = session.getAttribute("memId").toString();
	}

	
	//map 으로 처리

	BoardDTO selectList = new BoardDTO();
	
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	selectList = boardDAO.boardSelect(seq);

	pageContext.setAttribute("loginId", loginId);
	pageContext.setAttribute("selectList", selectList);

%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<input type="hidden" id="pg" value="${param.pg}">
<input type="hidden" id="seq" value="${param.seq}">
<form name="boardForm" method="post" action="boardWrite.jsp">
 <table border="1" cellpadding="5" cellspacing="0">

  <tr>
  	<th>제목</th>
  	<td>
  	 <input type="text" name="subject" id="subject" size="40" placeholder="제목 입력" >
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
  		<input type="button" value="목록" onclick="location.href='/board/boardList.do?pg=1'">
  	</td>
  </tr>
 </table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>

</body>
</html>
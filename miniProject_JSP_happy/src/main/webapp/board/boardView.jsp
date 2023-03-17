<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>

    
<%
	//데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardDTO boardDTO = boardDAO.getBoard(seq);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre{
white-space: pre-line;
word-break:break-all;
}
div{width : 100px;
}
td{
	font : italic bold 40px;
}
</style>
</head>
<body>
<%if(boardDTO != null){ %>
<form name ="boardView" method="post" action = "boardWrite.jsp">

<h3 style= color:#BE6DB7;><img src="../image/icons896.png" width="50" onclick="location.href='../index.jsp'"
 style ="cursor : pointer">글 상세보기</h3>
<table style=background-color:#FFFAFA; border ="1" cellpadding = "5" cellspacing="0" frame="hsides" rules="rows" >
	<tr>
		<td colspan="3">
			<h3><%=boardDTO.getSubject() %></h3>
		</td>
	</tr>
	<tr>
		
		<td width="200" align="center"><strong>글번호 : <%=boardDTO.getSeq()%></strong></td>
		<td width="200" align="center"> 작성자 : <%=boardDTO.getName()%></td>
		<td width="200" align="center">조회수 : <%=boardDTO.getHit()%> </td>
	</tr>
	<tr>
		<td colspan="3" height="250" valign="top">
			<div style="width: 100%; height:100%; overflow:auto;">
				<pre><%=boardDTO.getContent() %></pre>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2"  align = "left">
			<input type = "button" value ="목록" onclick="location.href='./boardList.jsp?pg=<%=pg%>'">
			
	</tr>
</table>
</form>
<%} %>

</body>
</html>
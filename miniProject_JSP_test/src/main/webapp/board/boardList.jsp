<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardPaging" %>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.HashMap" %>   
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %> 
<%
	//데이터
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//세션
	String memId = (String)session.getAttribute("memId");

	List<BoardDTO> list = new ArrayList<>();
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	
	// 페이징 처리 - 1페이지당 5개씩
	/*			startNum	endNum
	PG=1     PN>=1 AND RN<=5
	PG=2     PN>=6 AND RN<=10
	PG=3     PN>=11 AND RN<=15 
	 */
	 
	int endNum = pg * 5;
	int startNum = endNum - 4;
				
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("startNum", startNum);
	map.put("endNum", endNum);
	
	list = boardDAO.boardList(map);
	
	//페이징 처리
	int totalA = boardDAO.getTotalA();//총글수
	
	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	
	boardPaging.makePaginHTML();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.subjectA:link { color: black; text-decoration: none }
	.subjectA:visited { color: black; }
	.subjectA:hover { color: green; }
	.subjectA:active { color: black; }
	
	#currentPaging {
		color: red;
		border: 1px solid red;
		padding: 5px 8px; /* top / bottom, left / right */
		margin: 5px; /* top, bottom, left */
		cursor: pointer;
	}
	
	#paging {
		color: black;
		padding: 5px;
		margin: 5px;
		cursor: pointer;
	}
	
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	form {
		margin-left: auto;
		margin-right: auto;
		text-align: left;
	}	
	
</style>
</head>
<body>
	<div class="container">
	<img src="../image/sample.png" width="300" height="300" alt="마시마로" 
	onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
	<h3>글 목록</h3>
	<table border="1" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="100">조회수</th>
			<th width="150">작성일</th>
		</tr>
		
	<% if(list != null){ %>
		<% for(BoardDTO boardDTO : list) { %>
			<tr>
				<td align="center"><%=boardDTO.getSeq() %></td>
				<td>
					<a class="subjectA" href="boardView.jsp?seq=<%=boardDTO.getSeq() %>"><%=boardDTO.getSubject() %></a>
				</td>
				<td align="center"><%=boardDTO.getId() %></td>
				<td align="center"><%=boardDTO.getHit() %></td>
				<td align="center">
					<%= new SimpleDateFormat("yyyy.MM.dd").format(boardDTO.getLogtime()) %>
				</td>
			</tr>
		<%}//for %>
	<%}//for %>
</table>
<div style="margin-top: 15px; width: 850px; text-align: center;">
	<%=boardPaging.getPagingHTML() %>
</div>
<script type="text/javascript">
window.onload = function(){
	
	
	
}

function boardPaging(pg) {
	
	location.href = "boardList.jsp?pg=" + pg;
}

function isLogin(memId, seq, pg){
	
	if (memId == null) { 
		alert("먼저 로그인하세요");
	} else {
	
		location.href="boardView.jsp?seq=" + seq;
	}
}
</script>
</div>
</body>
</html>
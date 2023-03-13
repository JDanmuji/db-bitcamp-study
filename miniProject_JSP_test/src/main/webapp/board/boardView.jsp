<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("aaaa");
	// 데이터
	String id = (String)session.getAttribute("memId");
	int seq = Integer.parseInt(request.getParameter("seq"));
	//int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDTO boardDTO = new BoardDTO();
	System.out.println("tttt");
	// DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	System.out.println("sdksadasd");
	boardDTO = boardDAO.getBoard(seq); // 매개변수 없이 호출
	System.out.println("fsadfmdsflm");
	int hit = boardDTO.getHit(); // 현재 조회수 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
}
form {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

pre {
  	display: block;
	font-family: monospace;
	white-space: pre;
	margin: 1em 0;
}
</style>
</head>
<body>
	<%if (id == null) { 
		boardDAO.hitUpdate(hit, seq); // 조회수 변경 없음 %>
		<!-- 이거 안 쓰면 로그인 유·무와 상관없이 조회수가 1씩 증가한다. -->
		<script>
		location.href = "../member/loginForm.jsp"; // 로그인 페이지로 이동
		</script>

<% } else { %>
	<div class="container">
	<img src="../image/sample.png" width="300" height="300" alt="마시마로" 
	onclick="location.href='../index.jsp'" style="cursor: pointer;"><br>
	<h3>작성한 글 확인</h3>
	<form name="boardViewForm" method="post" action="">
		<table width="450" border="2" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
			<!-- width로 잡고 시작해야 글자가 안 깨진다.  -->
			<tr>
				<td colspan="3">
					<h2><%=boardDTO.getSubject() %></h2>
				</td>
			</tr>
	
			<tr>
				<td width="150" align="center">글번호: <%=boardDTO.getSeq() %></td>
				<td width="150" align="center">작성자: <%=boardDTO.getId() %></td>
				<td width="150" align="center">조회수: <%=boardDTO.getHit() %></td>
			</tr>
			
			<tr>
				<td colspan="3" height="250" valign="top">
					<div style="width: 100%; height: 100%; overflow: auto;"> <!-- 밑으로 긴 글일 때 스크롤바가 뜨게...  -->
						<pre style="white-space: pre-line; word-break: break-all;"><%=boardDTO.getContent() %></pre>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: left;">
	    			<input type="button" value="글 목록" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>
<% } %>
</div>
<script type="text/javascript">
window.onload = function(){
	
	console.log(1);
	
	
}


</script>
</body>
</html>
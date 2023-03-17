<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%> 
<%@page import="board.bean.BoardPaging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>

    
 <% 
 //세션확인을 위함

String memId = (String)session.getAttribute("memId");

//로그인 시 id 체크
int id= 0;
if(request.getParameter("id") !=null){
	id=Integer.parseInt(request.getParameter("id"));
}
 //목록 5개씩 출력
int pg = Integer.parseInt(request.getParameter("pg"));
int endNum = pg*5;
int startNum = endNum-4; 

//DB
Map<String, Integer> map = new HashMap<String, Integer>();
map.put("startNum",startNum);
map.put("endNum",endNum);


BoardDAO boardDAO = BoardDAO.getInstance(); 
List<BoardDTO> list = boardDAO.boardList(map);

//총글수 구하기
int totalA = boardDAO.getTotalA();
int totalP=(totalA + 4) /5;


//페이징 처리
BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);

boardPaging.makePagingHTML();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectA:link{color:#FF8E00; text-decoration:none;}
.subjectA:visited{color:#FF8E00;text-decoration:none;}
.subjectA:hover{color:pink;text-decoration:underline;cursor:pointer;}
.subjectA:active{color:#FF8E00;text-decoration:none;}
#currentPaging{
	color : red;
	text-decoration:underline;
	border: 1px solid red;
	padding:5px;
	margin:5px;/* top / bottom / left / right */
	cursor:pointer;
}
#Paging{
	color : black;
	text-decoration:none;
	border: 1px solid black;
	padding:5px;
	margin:5px;
	cursor:pointer;
}
a{face :"맑은고딕"; 
  color :"red";
  

}
</style>
</head>
<body>
<h2>글목록</h2><br>
<table border = "1" cellpadding ="5" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="150">작성자</th>
		<th width="100">조회수</th>
		<th width="150">작성일</th>
	</tr>
	<% if(list != null){%>
		<% for(BoardDTO boardDTO : list){ %>
	<tr>
		<td align = "center"><%=boardDTO.getSeq() %></td>
		<td><a class="subjectA" onclick="loginCheck('<%=memId%>',<%=boardDTO.getSeq()%>,<%=pg%>)"><%=boardDTO.getSubject() %></a></td>
		<td align = "center"><%=boardDTO.getId() %></td>
		<td align = "center"><%=boardDTO.getHit() %></td>
		<td align = "center">
			<%=new SimpleDateFormat("yyyy.MM.dd.").format(boardDTO.getLogtime())%></td>
	</tr>
	<% } %> 
	<%} %>
</table>
<div style= "margin-top:15px; width: 850px; text-align:center;" >
<%=boardPaging.getPagingHTML() %>
</div>

<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList.jsp?pg="+pg;
}
function loginCheck(memId,seq,pg){
	if(memId == 'null'){
		alert("로그인 하시기 바랍니다.")
		location.href="../member/loginForm.jsp"
	}else 
		location.href="boardView.jsp?seq=" + seq + "&pg=" +pg;

}
 

</script>
</body>
</html>
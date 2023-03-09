<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.bean.BoardPaging" %>

<%
	//페이징 번호
	
	String loginId = null;
	int pg = 1;
	
	if(request.getParameter("pg") != null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	
	if(session.getAttribute("memId") != null) {
		loginId = session.getAttribute("memId").toString();
	}

	
	
	int endNum = pg*5;
	int startNum = endNum-4;
	
	List<BoardDTO> list = new ArrayList<>(); 

	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	list = boardDAO.boardList(startNum, endNum);
	
	int total = boardDAO.getTotal();
	int paging = (total+4)/5;
	
	//int total = list.in
	request.setAttribute("list", list);
	request.setAttribute("paging", paging);
	request.setAttribute("pg", pg);
	
	//페이징 처리
	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(total);
	
	boardPaging.makePagingHTML();
	
	pageContext.setAttribute("loginId", loginId);
	
	/* <c:forEach var="i" begin="1" end="${paging}" step="1">
		<c:choose>
		<c:when test="${i == pg}">
			<div id='currentDiv'>
				<a id='currentPaging' href='./boardList.jsp?pg=${i}'>${i}</a>
			</div>&nbsp;
		</c:when> 
		<c:otherwise>
			<div id='pagingDiv'>
				<a  id='paging' href='./boardList.jsp?pg=${i}'>${i}</a>
			</div>&nbsp;
		</c:otherwise>
	</c:choose> 
</c:forEach> */
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

html,
body {
  height: 100%;
}

body {
  margin: 0;
  background: linear-gradient(45deg, #49a09d, #5f2c82);
  font-family: sans-serif;
  font-weight: 100;
}

.container {
  position: absolute;
  top: 50px;
  left: 50px;
  
}

table {
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
  padding: 15px;
  background-color: rgba(255,255,255,0.2);
  color: #fff;
}

th {
  text-align: left;
}

thead {
  th {
    background-color: #55608f;
  }
}

tbody {
  tr {
    &:hover {
      background-color: rgba(255,255,255,0.3);
    }
  }
  td {
    position: relative;
    &:hover {
      &:before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: -9999px;
        bottom: -9999px;
        background-color: rgba(255,255,255,0.2);
        z-index: -1;
      }
    }
  }
}

.divPaging {
	margin-top: 15px; 
	position: absolute;
	width: 850px; 
	text-align: center;
	  
}
.subjectA:link { color: black; text-decoration: none;}
.subjectA:visited { color: black; text-decoration: none;}
.subjectA:hover { color: green; text-decoration: underline;}
.subjectA:active { color: black; text-decoration: none;}

#currentDiv {
	float: left;  
	width: 20px; 
	height: 20px; 
	margin: 0 auto;
	margin-left: 5px;
}

#currentPaging{
	color: red;
	border: 1px solid red;
	padding: 5px 8px; /* top / bottom, left / right  */
	margin: 5px; /* top, right, bottom, left  */
	cursor: pointer;
}



#pagingDiv {
	float: left;  
	width: 20px; 
	height: 20px;
	margin: 0 auto; 
	margin-left: 5px;
}

#paging{
	color: black;
	padding: 5px;
	margin: 5px;
	cursor: pointer;
}


</style>
</head>
<body>
<form name="boardForm" method="post" action="boardWrite.jsp">
<div class="container">
 <table border="1" cellpadding="5" cellspacing="0">
	<thead>
  	<tr>
  		<th width="50">글번호</th>
  		<th width="200">제목</th>
  		<th width="80">작성자</th>
  		<th	width="50">조회수</th>
  		<th width="100">작성일</th>
  	</tr>
  </thead>
  
  <tbody>
  	<c:forEach var="list" items="${list}">
  		<tr>
        	<td width="50">${list.seq}</td>
        	<td width="200"><a class="subjectA" href="boardView.jsp?seq=${list.seq}">${list.subject}</a></td>
        	<td width="80">${list.name}</td>
        	<td width="50">${list.hit}</td>
        	<td width="100">${list.logTime}</td>
        </tr>
    </c:forEach>
 </tbody>
 
 </table>
 
 	<div class="divPaging">	
 		<%=boardPaging.getPagingHTML() %>
    </div>
 </div>
</form>

<script type="text/javascript">




function boardPaging(pg) {
	location.href = "boardList.jsp?pg=" + pg;
}

</script>
</body>
</html>
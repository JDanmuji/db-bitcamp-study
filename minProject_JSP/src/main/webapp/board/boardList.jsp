<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>

<%
	//페이징 번호
	int pg = Integer.parseInt(request.getParameter("pg"));
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
	position: absolute;
	  
}

#currentDiv {
	float: left;  
	width: 20px; 
	height: 20px; 
	margin: 0 auto;
	margin-left: 5px;
}

#currentPaging {
	color: #fff;
	
	font-family: sans-serif;
}

#pagingDiv {
	float: left;  
	width: 20px; 
	height: 20px;
	margin: 0 auto; 
	margin-left: 5px;
}


#paging {  
	color: #fff;
	text-decoration: none;
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
  	<th width="50">조회수</th>
  	<th width="100">작성일</th>
  </tr>
  </thead>
  
  <tbody>
  	<c:forEach var="list" items="${list}">
  		<tr>
        	<td width="50">${list.seq}</td>
        	<td width="200">${list.subject}</td>
        	<td width="80">${list.name}</td>
        	<td width="50">${list.hit}</td>
        	<td width="100">${list.logTime}</td>
        </tr>
    </c:forEach>

 </tbody>
 </table>
 
 <div class="divPaging">	
 <c:forEach var="i" begin="1" end="${paging}" step="1">
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
    </c:forEach>
   </div>
</div>
</form>
</body>
</html>
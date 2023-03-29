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

	String search = request.getParameter("search");
	String listSearch = request.getParameter("listSearch");
	
	int endNum = pg*5;
	int startNum = endNum-4;
	
	List<BoardDTO> list = new ArrayList<>(); 

	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	list = boardDAO.boardList(startNum, endNum, search, listSearch);
	
	int total = boardDAO.getTotal(search, listSearch);
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

	
%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		
		<!-- Wrapper -->
			<div id="wrapper">
				<article id="LIST">
					<h2 class="major">LIST</h2>
						<form name="boardForm" method="post" action="boardWrite.jsp">
							<table id="boardListTable">							
								<thead>
								  	<tr>
								  		<th width="50">No</th>
								  		<th width="200">Subject</th>
								  		<th width="80">Writer</th>
								  		<th	width="50">Views</th>
								  		<th width="100">Date</th>
								  	</tr>
								  </thead>
								  <%-- 
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
								  
								 </tbody> --%>
								 
								  
							</table>
							
								<div id=boardPagingDiv class="divPaging" align="center" style="font: bold italic 2.0em/1.0em;" >	
							 		<%=boardPaging.getPagingHTML() %>
							    </div>
							
							    
							    <div class="selectBox"  align="center" style="height: 300px; ">
							    	<ul class="actions">
							    	<li>
							 			<select name="search" id="search" style="width: 120px;">
							     		<option value="writer">작성자</option>
							     		<option value="subject">제목</option>
							    		</select>
							    	</li>
							    	<li>
							 			<input type="text" name="listSearch" id="listSearch" style="width: 200px;"></li>
							 			<li><input type="button" value="검색" onclick="checkWrite()"></li>
							 		</ul>
							 	</div>

						</form>
					
					</article>
				
					
				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</footer>
				
			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			
						
			<script type="text/javascript">
			
				
				function boardPaging(pg) {
					location.href = "boardList.jsp?pg=" + pg;
				}
				
				function checkWrite() {
					
					var search = document.getElementById("search").value;
					var listSearch = document.getElementById("listSearch").value;
					
					location.href = "boardList.jsp?pg=1&search=" + search + "&listSearch=" + listSearch;
				}
			
			
			
			</script>

	</body>
</html>

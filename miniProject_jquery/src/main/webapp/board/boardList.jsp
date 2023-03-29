<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style type="text/css">
	body {
		margin: 50px;
		background-color: #EDE9D5;
		font-family: serif;
		font-weight: 600;
	}
	h3 {
		color: #617143;
	}
	table {
		width: 600px;
		text-align: center;
		border-collapse: collapse;
		background-color: #EDE9D5;
		color: #617143;
		border: #E7AB9A 2px solid;
		border-left: transparent;
		border-right: transparent;
	}
	th {
		padding: 8px;
		background-color: #DF7857;
		color: #EDE9D5;
	}
	a, span {
		text-decoration: none;
		cursor: pointer;
	}
	
	.subjectA:link, .subjectA:visited {
		color: #617143;
	}
	.subjectA:hover, .subjectA:active {
		color: #DF7857; text-decoration: underline;
	}	
	#currentPaging, #paging, #prevNext {
		height: 20px;
		width: 20px;
		float:left;
		text-align:center;
		margin-right:10px;
		font-weight: 700;
		border-radius: 50%;
		color: #DF7857;
		border: 2px #DF7857 solid;
	}
	#currentPaging, #paging:hover, #paging:active {
		color: #617143;
		border: 2px #617143 solid;
	}
	#prevNext {
		width: 50px;
		padding: 2px 4px;
		color: #DF7857;
		border-radius: 50%;
		border: 2px transparent solid;
	}
	#prevNext:hover, #prevNext:active {
		border-radius: 10%;
		color: #617143;
		border: 2px #617143 solid;
	}
	.paging {
		color: #DF7857;
		padding: 5px;
	}
	.main {
		background-color: #E7AB9A;
		border: none;
		color: white;
		padding: 5px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 200px;
  		cursor: pointer;
	}
</style>
</head>

<body>
<h3><i>LIST</i></h3>
<form name="boardList">
<table id="boardListTable" border="1" cellpadding="10" cellspacing="0" rules="rows">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
<%-- 
<c:forEach var="boardDTO" items="${ list }">
	<tr>
		<td>${ boardDTO.seq }</td>
		
		<td>
			<c:if test="${ requestScope.memId == null }">
				<a class="subjectA" onclick="loginFirst()">${ boardDTO.subject }</a>
			</c:if>
			<c:if test="${ requestScope.memId != null }">
				<a class="subjectA" href="boardView.jsp?seq=${ boardDTO.seq }&pg=${ pg }">${ boardDTO.subject }</a>
			</c:if>
		</td>
		
		<td>${ boardDTO.name }</td>
		<td>${ boardDTO.hit }</td>
		<td>
			<fmt:formatDate value="${ boardDTO.logtime }" pattern="yyyy.MM.dd"/>
		</td>
	</tr>
</c:forEach>
 --%>	
 
</table>
<br>

<!-- 페이징 출력 클래스 -->
<div id=boardPagingDiv class="divPaging" align="center" style="font: bold italic 2.0em/1.0em;" >	

</div>

<input type="button" class="main" value="← main" onclick="location.href='http://localhost:8080/mvcMember/index.jsp'">
</form>

<form class="searchForm" method="get" action="boardList.do">
<select name="searchBy">
	<option value="name">작성자</option>
	<option value="subject">제목</option>
</select>
<input type="text" name="search" id="search">
<input type="hidden" name="pg" value=1>
<input type="submit" value="검색">
</form>
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
<script type="text/javascript">
function boardPaging(pg) {
	location.href="boardList.do?pg=" + pg;
}
function loginFirst() {
	alert("먼저 로그인하세요");
	location.href="http://localhost:8080/mvcMember/member/loginForm.do";
}
</script>
</body>
</html>
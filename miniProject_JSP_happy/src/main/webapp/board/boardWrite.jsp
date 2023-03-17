<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%> 
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
   
<% 
request.setCharacterEncoding("UTF-8");
//String seq = request.getParameter("seq");
//String id = request.getParameter("id");
//String name = request.getParameter("name");
String subject = request.getParameter("subject");
//String email = request.getParameter("email");
String content = request.getParameter("content");
//String ref = request.getParameter("ref");
//String lev = request.getParameter("lev");
//String step = request.getParameter("step");
//String pseq = request.getParameter("pseq");
//String reply = request.getParameter("reply");
//String hit = request.getParameter("hit");
//String logtime = request.getParameter("logtime");
//String seq_board = request.getParameter("seq_board");

//세션
String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

Map<String, String> map = new HashMap<String, String>();
map.put("id", id);
map.put("name", name);
map.put("email", email);
map.put("subject", subject);
map.put("content", content);
//Map 사용 시 내가 사용하고 싶은 값만 꺼내올 수 있음("이름",가져올 값)
//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardWrite(map);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload =function(){
	alert("글작성 완료");
	location.href="../index.jsp?pg=1";
}

</script>
</body>
</html>
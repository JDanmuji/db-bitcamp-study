<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
jstlStart.jsp - sendProc.jsp - sendResult.jsp 페이지 이동<br>
sendRedirect로 이동하므로 데이터는 공유되지 않음<br>
주소는 sendResult.jsp가 보임
<br><br>

jstlStart.jsp - forwardProc.jsp - forwardResult.jsp 페이지 이동<br>
forward로 이동하므로 데이터 공유됨<br>
주소는 forwardProc.jsp로 보이지만 결과는 forwardResult.jsp가  출력됨
<br><br>

<input type="button" value="sendRedirect" onclick="location.href='sendProc.jsp'">
<input type="button" value="forward" onclick="location.href='forwardProc.jsp'">

</body>
</html>
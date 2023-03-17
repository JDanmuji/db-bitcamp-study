<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="elInput2"  action="elResult2.jsp">
<h2>자바클래스의 메서드를 이용</h2>
<table border="1" cellpadding="5" cellspacing="0" >
<tr>
	<td width="70" align="center"><strong>X</strong></td>
	<td>
		<input type="text" name="x"  size="7" maxlength="3">
		<div id="xDiv"></div>
	</td>
</tr>

<tr>
	<td align="center"><strong>Y</strong></td>
	<td>
		<input type="text" name="y" size="7" maxlength="3">
		<div id="yDiv"></div>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="계산" >
		
		<!-- form 안 입력상자의 데이터들을 가져감 -->
		<input type="reset" value="취소">
	</td>
</tr>

</table>
</form>
</body>
</html>
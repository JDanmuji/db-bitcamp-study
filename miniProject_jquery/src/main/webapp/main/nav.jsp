<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
<jsp:include page="../member/loginForm.jsp"></jsp:include>
 --%>
 
<div>
	<c:if test="${empty memId}">
		<input type="button" value="로그인" onclick="location.href='/member/loginForm.do'"><br><br>
		<input type="button" value="회원가입" onclick="location.href='/member/writeForm.do'">
	</c:if>
	<c:if test="${not empty memId}">
		<h4>${memName} 님 로그인</h4>
		<input type="button" value="로그아웃" onclick="location.href='/member/logout.do'">
	</c:if>
	
</div>
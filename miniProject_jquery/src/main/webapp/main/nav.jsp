<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
<jsp:include page="../member/loginForm.jsp"></jsp:include>
 --%>
 
<div>
	<c:if test="${empty memId}">
		 <a href="/member/loginForm.do">
    	 	 <img src="/images/ropee3.png">
  		 </a>
		
		 <a href="/member/writeForm.do">
			<img src="/images/roppe4.png">
	  	 </a>
		
		<!-- <input type="button" value="로그인" onclick="location.href='/member/loginForm.do'"><br><br> -->
<!-- 		<input type="button" value="회원가입" onclick="location.href='/member/writeForm.do'"> -->
	</c:if>
	<c:if test="${not empty memId}">
		<h4>${memName} 님 로그인</h4>
		<a href="/member/logout.do" id="logoutBtn">
			<img src="/images/roppp6.png">
	  	 </a>
		<!-- <input type="button" value="로그아웃" onclick="location.href='/member/logout.do'"> -->
	</c:if>
	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

	$('#logoutBtn').click(function() {

		$.ajax({
			type : 'post', //get or post
			url : '/member/logout.do',
			data : {
			},
			dataType : 'text',
			success : function(data) {
				
				alert("로그아웃");
				location.href = '../index.jsp';
			},
			error : function(err) {
				console.log(err);
			}
			
		});
	
	});


</script>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 정보수정 화면으로 가기전에
	// 아이디 기준으로 회원정보를 조회해서 다음 화면으로 전달
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	
	MemberDTO memberDTO = new MemberDTO();
    	
      memberDTO.setName(name);
      memberDTO.setPwd(pwd);
      memberDTO.setGender(gender);
      memberDTO.setEmail1(email1);
      memberDTO.setEmail2(email2);
      memberDTO.setTel1(tel1);
      memberDTO.setTel2(tel2);
      memberDTO.setTel3(tel3);
      memberDTO.setZipcode(zipcode);
      memberDTO.setAddr1(addr1);
      memberDTO.setAddr2(addr2);
      memberDTO.setId(id);

      //DB
      MemberDAO memberDAO = MemberDAO.getInstance(); 
      memberDAO.memberUpdate(memberDTO);
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 회원정보 수정 완료</h3>

<script type="text/javascript">
window.onload=function(){
	alert("회원정보수정 완료!!");
	location.href = "loginForm.jsp";
}

</script>
</body>
</html>
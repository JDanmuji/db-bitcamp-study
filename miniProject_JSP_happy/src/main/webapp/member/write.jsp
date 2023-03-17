<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dad.MemberDAO"%>
   

<%
request.setCharacterEncoding("UTF-8");//post방식인 경우
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
memberDTO.setId(id);
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

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
int su = memberDAO.memberWrite(memberDTO);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<% if(su == 0) { %>
  <%= "회원가입 실패" %>
<input type='button' value='뒤로' onclick='history.go(-1)'>
<% } else { %>
  <%= "회원가입 성공" %>
<input type='button' value='로그인' onclick= 'location.href= "loginForm.jsp"'>
<% } %>

</body>
</head>
</html>
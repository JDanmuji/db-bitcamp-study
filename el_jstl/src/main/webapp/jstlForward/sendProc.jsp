<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
    
<%
//자바 역할
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");

//객체는 주소로 넘길 수 없다 (주소값이 넘어가서 문자열로 인식됨)
//setAttribute로 넘겨주어야 함
request.setAttribute("list", list);

//forward 없이 페이지 이동 바로 하면 안 넘어감
response.sendRedirect("sendResult.jsp");
%>
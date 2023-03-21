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

//response.sendRedirect("forwardResult.jsp");
//forward 없이 페이지 이동 바로 하면 안 넘어감
//request는 현재 페이지로 범위가 한정되므로 우선 forward하여 확장시켜주어야 함
%>

<!-- 가능하지만 이제 jsp 태그는 잘 사용되지 않음 -->
<!-- <jsp:forward page="forwardResult.jsp"/> -->

<!-- 디스패처 함수를 많이 사용함 -->
<%
//페이지 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); //상대주소
dispatcher.forward(request, response); //제어권 넘겨줌
%>
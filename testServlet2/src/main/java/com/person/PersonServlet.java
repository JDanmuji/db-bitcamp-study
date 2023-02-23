package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init() {
		System.out.println("init()");
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		String gender = "";
		
		if(!request.getParameter("gender_m").equals("")) {
			gender = "남자";
		} else {
			gender = "여자";
		}
		
		
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<ul>");
		out.println("<li> 이름  : " + name +  "</li>");
		out.println("<li> 성별  : " + gender +  "</li>");
		out.println("<li> 색깔  : " + color +  "</li>");
		out.println("<li> 취미  : ");
		for(int i = 0; i < hobby.length; i++) {
			out.println(hobby[i] +" ");	
		}
		out.println("</li>");
		
		out.println("<li> 과목  : ");
		for(int i = 0; i < subject.length; i++) {
			out.println(subject[i] +" ");	
		}
		out.println("</li>");
		
		
		
		out.println("</ul>");
		
	
		out.println("</body>");
		out.println("</html>");
	}
	
	public void destroy() {
		System.out.println("destroy()");
	}

}

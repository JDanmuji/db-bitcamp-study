package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class praramServlet
 */
/* @WebServlet("/praramServlet") */
public class praramServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(){
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		if(age >= 20) out.println("성인 입니다.");
		else out.println("청소년 입니다.");
		
		
		out.println("</body>");
		out.println("</html>");
		
	}
	
	public void destory() {


	}

}

package com.calc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**@WebServlet("/CalcServlet")
 * Servlet implementation class CalcServlet
 */

public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(){
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		out.println(x + "+" + y + "=" + add(x,y) + "<br>");
		out.println(x + "-" + y + "=" + sub(x,y) + "<br>");
		out.println(x + "*" + y + "=" + mul(x,y) + "<br>");
		out.println(x + "/" + y + "=" + div(x,y) + "<br>");
		out.println("<input type='button' value='뒤로' onclick='javascript:history.go(-1)'/>");
		out.println("<input type='button' value='뒤로' onclick=javascript:location.href='http://localhost:8080/testServlet/calc/input.html'>");
		out.println("<input type='button' value='연령제한' onclick=javascript:location.href='http://localhost:8080/testServlet/param.html'>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	public int add(int x, int y) {
		
		return x+y;
	}

	public int sub(int x, int y) {
		
		return x-y;
	}
	

	public int mul(int x, int y) {
	
		return x*y;
	}

	public double div(int x, int y) {
	
		return (double)x/y;
	}

	
	public void destory() {


	}

}

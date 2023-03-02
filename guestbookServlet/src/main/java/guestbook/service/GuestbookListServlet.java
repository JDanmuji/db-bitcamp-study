package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

/**
 * Servlet implementation class GuestbokkListServlet
 */
@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
	
		System.out.println("+++++" + pg);
		int endNum = pg*2;
		int startNum = endNum-1;
		 
		//DB 
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		ArrayList<GuestbookDTO> list = guestbookDAO.guestbookList(startNum, endNum);
		
		int total = guestbookDAO.getTotal();
		
		int paging = (total+1)/2;
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<style>");
		out.println("div {float: left; width: 20px; height: 20px; margin-left: 5px;}");
		out.println("#currentDiv {float: left; border: 1px red solid; width: 20px; height: 20px; margin-left: 5px;}");
		out.println("#currentPaging {color: red; text-decoration: none;}");
		out.println("#paging {color: blue; text-decoration: none;}");
		out.println("</style>");
		out.println("<body>");
	
		
		if(list != null) {
			
		for(GuestbookDTO guestbookDTO : list) {
			
				out.println("<form name='guestbookSearchForm'>");
				 out.println("<table border='1' cellpadding='5' cellspacing='0'>");
				  out.println("<tr>");
				  	out.println("<th>작성자</th>" ) ;
				  	out.println("<td width='100px'>");
				  	 out.println("<pre>" + guestbookDTO.getName() +  "</pre>");
				  	out.println("<th>작성일</th>" ) ;
				  	out.println("<td>");
				  	 out.println("<pre>" + guestbookDTO.getLogtime() +  "</pre>");
				  	out.println("</td>");
				  out.println("</tr>");
				  
				  out.println("<tr>");
				  	out.println("<th>이메일</th>");
				  	out.println("<td colspan='3'>");
				  	out.println("<pre>" + guestbookDTO.getEmail() +  "</pre>");
				  	out.println("</td>");
				  out.println("</tr>");
				  
				  out.println("<tr>");
				  out.println("<th>홈페이지</th>");
				  	out.println("<td colspan='3'>");
				  	out.println("<pre>" + guestbookDTO.getHomepage() +  "</pre>");
				  	out.println("</td>");
				  out.println("</tr>");
				  
				  out.println("<tr>");
				  out.println("<th>제목</th>");
				  	out.println("<td colspan='3'>");
				  	out.println("<pre>" + guestbookDTO.getSubject() +  "</pre>");
				  	
				  	out.println("</td>");
				  out.println("</tr>");
				  
				  out.println("<tr>");
				  out.println("<th>내용</th>");
				  	out.println("<td colspan='3'>");
				  	out.println("<pre>"+  guestbookDTO.getContent() + "</pre>");
				    out.println("</td>");		
				  out.println("</tr>");
				  
		
				 out.println("</table>");
				 out.println("<hr style='border-color: red; width: 700px; margin: 0;'>");
				out.println("</form>");
		
			
			}
		
		out.println("<br>");
		
		for(int i = 1; i <= paging; i++) {
			if (i == pg) {
				out.println("<div id='currentDiv'><a  id='currentPaging' href='http://localhost:8080/GuestbookListServlet?pg="+ i + "'>"+ i + "</a></div>&nbsp");
			} else {
				out.println("<div id='pagingDiv'><a  id='paging' href='http://localhost:8080/GuestbookListServlet?pg="+ i + "'>"+ i + "</a></div>&nbsp");	
			}
			
		}
		
		out.println("<br><br>");
		
		out.println("<input type='button' value='목록' onclick=location.href='http://localhost:8080/guestbook/guestbookSearch.html'");
		}
		out.println("</body>");
		out.println("</html>");
		//응답
	}

}

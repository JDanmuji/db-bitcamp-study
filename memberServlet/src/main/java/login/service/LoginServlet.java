package login.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//데이터
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("id");
		String passWd = request.getParameter("pwd");
		
		MemberDTO memberDTO = new MemberDTO();
		
		
		
		memberDTO.setId(id);
		memberDTO.setPassWd(passWd);
		
		
	
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		String name  = memberDAO.loginSelect(memberDTO);
		
		
		
		//응답
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		if (name.length() > 0) {
			
			out.println("<h3>" + name + "로그인 성공</h3>");	
		} else {
			
			out.println("<h3>아이디 또는 비밀번호가 맞지 않습니다.</h3>");
			
		}
			
		out.println("</body>");
		out.println("</html>");
	
	
	
	}

}

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
		MemberDTO memberDTO = new MemberDTO();
		
		String id = null;
		String passWd = null;
		String content = null;
		String selectName = null;

		
		//데이터
		request.setCharacterEncoding("UTF-8");
				
		id = request.getParameter("id");
		passWd = request.getParameter("pwd");
		
		memberDTO.setId(id);
		memberDTO.setPassWd(passWd);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		selectName  = memberDAO.loginSelect(memberDTO);
		
		
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		content = selectName.length() > 0 ? "<h3>" + selectName + "로그인 성공</h3>"
											: "<h3>아이디 또는 비밀번호가 맞지 않습니다.</h3>";
			
		out.println(content);	
			
		out.println("</body>");
		out.println("</html>");
	
	
	
	}

}

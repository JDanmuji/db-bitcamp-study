package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String passWd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
				
		
		
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		String tel = tel1 + tel2 + tel3; 
		
		String zipCode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO();
		
		
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPassWd(passWd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setZipCode(zipCode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		
	
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		int su = memberDAO.memberWrite(memberDTO);
		
		
		
		//응답
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		if(su == 0) {
			out.println("<h3>회원가입 실패</h3>");
			out.println("<input type='button' value='뒤로' onclick='history.go(-1)'");
		} else { 
			out.println("<h3>회원가입 성공</h3>");
			out.println("<input type='button' value='로그인' onclick=location.href='http://localhost:8080/login/login.html'");
			}
		out.println("</body>");
		out.println("</html>");
	
	
	
	}

}

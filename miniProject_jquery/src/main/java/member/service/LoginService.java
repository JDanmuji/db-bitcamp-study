package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String view;
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		String name = memberDAO.memberLogin(id, pwd);
		
		if (name == null) {
			
			view = "/loginForm.jsp";
			
		} else {
			
			//세션
			HttpSession session = request.getSession();
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			
			view = "/index.jsp";
		}
		
		return view;
	}

}

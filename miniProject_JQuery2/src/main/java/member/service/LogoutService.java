package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//세션
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");

		session.invalidate(); //한 번에 다 만료시키기

		return "/member/logout.jsp";
	}

}

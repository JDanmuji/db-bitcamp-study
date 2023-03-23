package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String view;
		// 데이터
		String id = request.getParameter("id");
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean existId = memberDAO.isExistId(id); // 아이디가 있다/true/사용 불가능/
		
		
		request.setAttribute("id", id);
		
		
		if (existId) {
			
			view = "/member/checkIdFail.jsp";
			
		} else {
			
			view = "/member/checkIdOk.jsp";
		}
		
		return view;
	}

}
package board.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//한글처리
		if (request.getMethod().equals("POST")) { //request.getMethod() form tag method 의미, get or post
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
						

		
		String loginId = null;
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		HttpSession session = request.getSession();
		session.setAttribute("memId", "11111");
		loginId = session.getAttribute("memId").toString();
//		
//		if(session.getAttribute("memId") != null) {
//			loginId = session.getAttribute("memId").toString();
//		}

		
		//map 으로 처리

		BoardDTO selectList = new BoardDTO();
		
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		selectList = boardDAO.boardSelect(seq);

		request.setAttribute("loginId", loginId);
		request.setAttribute("selectList", selectList);
		
		return "/board/boardView.jsp";
	}

}

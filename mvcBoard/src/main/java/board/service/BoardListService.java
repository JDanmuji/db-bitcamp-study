package board.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String loginId = null;
		int pg = 1;
		
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("memId", "11111");
		
		if(session.getAttribute("memId") != null) {
			loginId = session.getAttribute("memId").toString();
		}

		String search = request.getParameter("search");
		String listSearch = request.getParameter("listSearch");
		
		int endNum = pg*5;
		int startNum = endNum-4;
		
		List<BoardDTO> list = new ArrayList<>(); 

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		list = boardDAO.boardList(startNum, endNum, search, listSearch);
		
		int total = boardDAO.getTotal(search, listSearch);
		int paging = (total+4)/5;
		
		//int total = list.in
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("pg", pg);
		
		//페이징 처리
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(total);
		
		boardPaging.makePagingHTML();
		
		
		request.setAttribute("loginId", loginId);
		request.setAttribute("boardPaging", boardPaging.makePagingHTML());
		
		return "/board/boardList.jsp";
	}

}

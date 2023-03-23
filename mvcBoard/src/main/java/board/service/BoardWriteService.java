package board.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

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
		
		//map 으로 처리
		BoardDTO boardDTO = new BoardDTO();
		String id = "11111";
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		//map 으로 처리

		boardDTO.setId(id);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boolean result = boardDAO.boardWrite(boardDTO);
		
		request.setAttribute("result", result);

		System.out.println(result);
		
		return "/board/boardWrite.jsp";
	}

}

package board.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import board.bean.BoardDTO;
import board.bean.BoardPaging;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		//Data
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg*5;
		int startNum = endNum-4;
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		String searchBy = request.getParameter("searchBy");
		String search = request.getParameter("search");
		List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
		
		int totalA = boardDAO.getTotalA();
		int totalP = (totalA + 4) / 5;
		
		JSONObject json  = new JSONObject();
		
		if(list != null) {
			JSONArray array = new JSONArray();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				
				temp.put("ref", boardDTO.getRef());
				temp.put("lev", boardDTO.getLev());
				temp.put("step", boardDTO.getStep());
				temp.put("pseq", boardDTO.getPseq());
				temp.put("reply", boardDTO.getReply());
				temp.put("hit", boardDTO.getHit());
				temp.put("logtime",sdf.format(boardDTO.getLogtime()) );
				
				array.add(temp);
				
				json.put("list", array);
			}
		}
		
		
		
		//Pagination
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setCurrentPage(pg);
		boardPaging.setTotalA(totalA);
		
		//boardPaging.makePagingHTML();
		
		json.put("pagingHtml", boardPaging.makePagingHTML().toString());

		/*
		 * request.setAttribute("list", list); request.setAttribute("boardPaging",
		 * boardPaging);
		 */
		
		
		
		request.setAttribute("json", json);
		request.setAttribute("display", "/board/boardList.jsp?pg=1");
		return "/index.jsp";
	}
}

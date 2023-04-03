package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		BoardDTO boardDTO = boardDAO.getBoard(seq);
	
		System.out.println(boardDTO);
		System.out.println(seq);
		System.out.println(pg);
		
		//List객체를 json으로 변환시켜서 보내야 한다.
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		System.out.println(boardDTO.getSeq());
		JSONObject json = new JSONObject();
		json.put("seq", boardDTO.getSeq());
		json.put("id", boardDTO.getId());
		json.put("name", boardDTO.getName());
		json.put("email", boardDTO.getEmail());
        json.put("subject", boardDTO.getSubject());
        json.put("content", boardDTO.getContent());
        json.put("ref", boardDTO.getRef());
        json.put("lev", boardDTO.getLev());
        json.put("step", boardDTO.getStep());
        json.put("pseq", boardDTO.getPseq());
        json.put("reply", boardDTO.getReply());
        json.put("hit", boardDTO.getHit());
        json.put("logtime", sdf.format(boardDTO.getLogtime())); //Date -> String으로 변환
        
		String idCheck = (!id.equals(boardDTO.getId().toString())) ? "no" : "ok";
		

		json.put("idCheck", idCheck);
		
		request.setAttribute("json", json);
		return "/board/getBoard.jsp";
	}

}











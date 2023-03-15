package board.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import lombok.Getter;
import lombok.Setter;
import member.bean.MemberDTO;



public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}


	public BoardDAO() {
		InputStream inputStream;
		
		try {
			inputStream = Resources.getResourceAsStream("/conf/mybatis-config.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean boardWrite(BoardDTO boardDTO) {
		boolean result =  false;
		
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int su  = sqlSession.insert("boardSQL.boardWrite", boardDTO);
		sqlSession.commit();
		sqlSession.close();
		
		
	
		
		result = su > 0 ? true : false; //실행 - 개수 리턴
		
		return result;
		
	}
	
	public  List<BoardDTO> boardList(int startNum, int endNum, String search, String listSearch) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("startNum", startNum);
		param.put("endNum", endNum);
		param.put("search", search);
		param.put("listSearch", listSearch);
		

		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> selectList = sqlSession.selectList("boardSQL.boardList", param);
		sqlSession.close();
		
		
		return selectList;
	
	}
	
	
	public BoardDTO boardSelect(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.boardSelect", seq);
		sqlSession.close();
		
		
		return boardDTO;
	}
	
	
	public int getTotal(String search, String listSearch) {

		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("search", search);
		param.put("listSearch", listSearch);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int total = sqlSession.selectOne("boardSQL.getTotal", param);
		sqlSession.close();

		
		return  total;
	}


	
	
}













package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	
	private static BoardDAO boardDAO = new BoardDAO();
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	public BoardDAO() {
		InputStream inputStream;
		try {
			//만들어 놓은 환경설정 파일 읽어옴
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			//환경설정 파일 읽은 것을 기반으로 sql 세션 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //SqlSession 생성하는 메소드
		int su = sqlSession.insert("boardSQL.boardWrite", map); //("mapper xml 파일 안에 있는 태그의 id명", 넘겨줄 데이터)
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public List<BoardDTO> boardList(int startNum, int endNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public List<BoardDTO> boardSearch(String searchBy, String search) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		map.put("searchBy", searchBy);
		map.put("search", search);
		list = sqlSession.selectList("boardSQL.boardSearch", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	
	public BoardDTO boardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.boardView", seq);
		sqlSession.close();
		return boardDTO;
	}
}
package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import board.dao.BoardDAO;
import member.bean.MemberDTO;



public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;

	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}

	public BoardDAO() {
			try {
				InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}


	public void boardWrite(Map<String,String>map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.selectOne("boardSQL.boardWrite", map);// xml의 namespace 값 설정
		sqlSession.close();
			
	}
	public List<BoardDTO> boardList(Map<String, Integer>map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list= sqlSession.selectList("boardSQL.boardWrite", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");// xml의 namespace 값 설정
		sqlSession.close();
		return totalA;
	}

	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);// xml의 namespace 값 설정
		sqlSession.close();
		return boardDTO;
	}

	

}

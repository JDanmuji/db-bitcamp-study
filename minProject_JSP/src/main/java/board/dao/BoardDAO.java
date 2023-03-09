package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;
import lombok.Getter;
import lombok.Setter;
import member.bean.MemberDTO;


public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private String username = "system";
//	private String password = "oracle";
	
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}

	//overload
	public static void close(Connection conn, PreparedStatement pstmt) {
		
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); //Tomcat 의 경우
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		try {
//			Class.forName(driver); //Class타입으로 생성
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
		
	}
	
//	public void getConnection() {
//		
//		try {
//			conn = DriverManager.getConnection(url, username, password);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//	}
	
	public boolean boardWrite(BoardDTO boardDTO) {
		boolean result =  false;
		
//		this.getConnection(); //접속
		String sql = "INSERT INTO board SELECT seq_board.nextval, m.id, m.name, (m.email1 || '@' || m.email2) as email, ?, ?, seq_board.CURRVAL, 0, 0, 0, 0, 0, sysdate FROM member m WHERE m.id =?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);//생성
			
			//?에 데이터 주입
			pstmt.setString(1, boardDTO.getSubject());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setString(3, boardDTO.getId());
			
			result = pstmt.executeUpdate() == 1? true : false; //실행 - 개수 리턴			
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
		}
		
		return result;
	}
	
	public  List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<>();
		
//		this.getConnection(); //접속
		//String sql = "SELECT seq, subject, name, hit, to_char(logtime, 'YYYY.MM.DD') as logTime FROM BOARD WHERE 1=1";
		
		String sql = "select b.seq, b.subject, b.name, b.hit, b.logtime from (SELECT rownum as rn, a.* from (select seq, subject, name, hit, to_char(logtime, 'YYYY.MM.DD') as logtime FROM board order by seq desc) a) b where b.rn >=? and b.rn <=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);//생성
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			//if 문 이었따..
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setSeq(rs.getString("seq"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setHit(rs.getString("hit"));
				boardDTO.setLogTime(rs.getString("logTime"));

				list.add(boardDTO);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
		}
		
		return list;
	}
	
	
	public BoardDTO boardSelect(int seq) {
		BoardDTO boardDTO = new BoardDTO();
		
		boolean result =  false;
		
//		this.getConnection(); //접속
		String sql = "select seq, subject, content from board where seq = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);//생성
			
			//?에 데이터 주입
			pstmt.setInt(1, seq);
			
			ResultSet rs = pstmt.executeQuery();
			
			//if 문 이었따..
			while(rs.next()) {
				
				
				boardDTO.setSeq(rs.getString("seq"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				
				
				
			}
						
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
		}
		
		return boardDTO;
	}
	
	
	public int getTotal() {
		int total = 0;
	
		
//		this.getConnection();
		String sql = "select count(*) as cnt from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

	         //query문 수행하고 결과셋 객체 얻어오기 
	        ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
	        	
				total =  Integer.parseInt(rs.getString("cnt"));
	        	 
	        }
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BoardDAO.close(conn, pstmt);
			
		};
		
		return total;
	}


	
	
}













package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import guestbook.bean.GuestbookDTO;




public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement  pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String name = "system";
	private String passwd = "oracle";
	
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO();
	
	
	public static GuestbookDAO getInstance() {
		return guestbookDAO;
	}
	


	private static void close(Connection conn, PreparedStatement pstmt) {

		try {
			
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public GuestbookDAO() {
		//driver loading
		try {
			Class.forName(driver);
			System.out.println("db연결");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	public void getConnection()  {
	
		try {
			conn = DriverManager.getConnection(url, name, passwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int guestbookWrite(GuestbookDTO guestbookDTO)  {
		int su = 0;
		//String seq = "seq_guestbook.NEXTVAL";
		
		this.getConnection();
		String sql = "insert into guestbook values(seq_guestbook.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setString(1, seq);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
		
			
			su = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			GuestbookDAO.close(conn, pstmt);
			
		};
		
		return su; 
	}

//	
//	public String loginSelect(GuestbookDAO guestbookDAO)  {
//		String name = "";
//		this.getConnection();
//		String sql = "select name  from member where id=? and pwd=?";
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			
//			pstmt.setString(1, memberDTO.getId());
//			pstmt.setString(2, memberDTO.getPassWd());
//			
//			
//	         //query문 수행하고 결과셋 객체 얻어오기 
//	        ResultSet rs = pstmt.executeQuery();
//			
//			
//			while(rs.next()) {
//	        	
//	        	 name = rs.getString("name");
//	        	 
//	        }
//			
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			GuestbookDAO.close(conn, pstmt);
//			
//		};
//		
//		return name; 
//	}


	
	
	
}
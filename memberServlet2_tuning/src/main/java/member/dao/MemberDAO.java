package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Scanner;

import member.bean.MemberDTO;



public class MemberDAO {
	private Connection conn;
	private PreparedStatement  pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String name = "system";
	private String passwd = "oracle";
	
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
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
	
	public int memberWrite(MemberDTO memberDTO)  {
		int su = 0;
		this.getConnection();
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPassWd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipCode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			su = pstmt.executeUpdate();
			
			
			
		} catch (SQLIntegrityConstraintViolationException e) {
			su = 2;
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MemberDAO.close(conn, pstmt);
			
		};
		
		return su; 
	}

	
	public String loginSelect(MemberDTO memberDTO)  {
		String name = "";
		this.getConnection();
		String sql = "select name  from member where id=? and pwd=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPassWd());
			
			
	         //query문 수행하고 결과셋 객체 얻어오기 
	        ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
	        	
	        	 name = rs.getString("name");
	        	 
	        }
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MemberDAO.close(conn, pstmt);
			
		};
		
		return name; 
	}



	private static void close(Connection conn, PreparedStatement pstmt) {

		try {
			
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	
}

package member.dao;

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

import lombok.Getter;
import lombok.Setter;
import member.bean.MemberDTO;



public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
		InputStream inputStream;
		
		try {
			inputStream = Resources.getResourceAsStream("/conf/mybatis-config.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	public int memberWrite(MemberDTO memberDTO) {
		
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int su  = sqlSession.insert("memberSQL.memberWrite", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
		
		return su;
		
	}
	
	public MemberDTO memberSearch(String id){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberSearch", id);
		sqlSession.close();
		
		
		return memberDTO;
	}

	public String memberLogin(String id, String pwd){
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("id", id);
		param.put("pwd", pwd);
		
		System.out.println(param);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String name = sqlSession.selectOne("memberSQL.memberLogin", param);
		sqlSession.close();
		
	
		return name;		
	}
	

	public boolean memberUpdate(MemberDTO memberDTO) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int resultReturn = sqlSession.update("memberSQL.memberUpdate",  memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
		boolean result = resultReturn > 0 ? true : false;
		
		return result;
	}
	
	
	public boolean memberDelete(String id, String pwd){
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("id", id);
		param.put("pwd", pwd);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();

		int resultReturn = sqlSession.delete("memberSQL.memberDelete", param);
		sqlSession.commit();
		sqlSession.close();		
			

		boolean result = resultReturn > 0 ? true: false;
		
		return result;
	}
	
	

	 public boolean isExistId(String id) { 
		 SqlSession sqlSession = sqlSessionFactory.openSession();// 생성
		 int existId = sqlSession.selectOne("memberSQL.isExistId", id);
		 sqlSession.commit();
		 
		 boolean result = existId > 0 ? true: false;
		 
		 return result;
			 
	 }
	 
	 
}













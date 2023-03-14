package user.dao;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static UserDAO userDAO = new UserDAO();
	
	//싱글톤
	public static UserDAO getInstance() {
		return userDAO;
	}
	
	public UserDAO() {
		InputStream inputStream;
		
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
	}


	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> selectList = sqlSession.selectList("userSQL.getUserList");
		sqlSession.close();
		
		
		return selectList;
	}
	
	public int userSelect(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt =  sqlSession.selectOne("userSQL.userSelect", userDTO);
		sqlSession.close();
		
		return cnt;
	}

	public void update(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();		
	}
	
	
	public List<UserDTO> search(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> selectList = sqlSession.selectList("userSQL.search", userDTO);
		sqlSession.close();
		
		
		return selectList;
	}

	public void delete(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.delete("userSQL.delete", userDTO);
		sqlSession.commit();
		sqlSession.close();		
		
	}

	




}

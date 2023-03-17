package member.dad;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;

	private static MemberDAO memberDAO = new MemberDAO();

	// 생성자를 중복 생성하면 메모리 할당이 많이 필요하므로 불필요
	// 위 static으로 고정 생성자 생성
	public static MemberDAO getInstance() {
		return memberDAO;
	}

	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");

			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.memberWrite", memberDTO);// xml의 namespace 값 설정
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public MemberDTO memberLogin(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);// xml의 namespace 값 설정
		sqlSession.close();
		return memberDTO;
	}

	public MemberDTO getMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember", id);// xml의 namespace 값 설정
		sqlSession.close();
		return memberDTO;
	}

	public void memberUpdate(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();// 생성
		sqlSession.update("memberSQL.update", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	/*
	 * public boolean isexistPwd(String id, String pwd) { boolean exist = false;
	 * 
	 * String sql = "select * from member where id=? and pwd=?"; getConnection();
	 * return(exist); }
	 */
	public void memberDelete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();// 생성
		sqlSession.delete("memberSQL.delete", id);
		sqlSession.commit();
	}
	
	 public boolean isExistId(String id) { 
		 SqlSession sqlSession = sqlSessionFactory.openSession();// 생성
		 boolean existId= sqlSession.selectOne("memberSQL.delete", id);
		 sqlSession.commit();
		 return(existId);
			 
	 }
	 
	

}

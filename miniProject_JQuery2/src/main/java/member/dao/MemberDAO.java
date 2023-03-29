package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private SqlSessionFactory sqlSessionFactory; //sql 세션을 만들기 위해 필요
	public MemberDAO() {
		try {
			//만들어 놓은 환경설정 파일 읽어옴
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//환경설정 파일 읽은 것을 기반으로 sql 세션 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //SqlSession 생성하는 메소드
		int su = sqlSession.insert("memberSQL.memberWrite", memberDTO); //("mapper xml 파일 안에 있는 태그의 id명", 넘겨줄 데이터)
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public MemberDTO memberLogin(String id, String pwd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		sqlSession.close();
		return memberDTO;
	}
	
	public MemberDTO memberUpdateForm(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberUpdateForm", id);
		sqlSession.close();
		return memberDTO;
	}
	
	public int memberUpdate(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.update("memberSQL.memberUpdate", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public int memberDelete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.delete("memberSQL.memberDelete", id);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public boolean checkId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean existId = false;
		
		if (sqlSession.selectOne("memberSQL.checkId", id) != null)
				existId = true;
		return existId;
	}
}

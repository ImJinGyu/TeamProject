package com.itwillbs.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.memberMapper";
	
	public void insertMember(MemberDTO mT) {
		sqlSession.insert(NAMESPACE + ".InsertMember", mT);
	}
	
	public Map<String, String> userlogin(MemberDTO mT) {
		
		return sqlSession.selectOne(NAMESPACE + ".userlogin",mT);
	}
	
	public Map<String, String> iddup(Map<String ,String> dupMap) {
		return sqlSession.selectOne(NAMESPACE + ".iddup", dupMap);
	}
	
	public void updatePass(MemberDTO mT) {
		sqlSession.update(NAMESPACE + ".updatePass", mT);
	}
	
	public void updateUser(MemberDTO mT) {
		sqlSession.update(NAMESPACE + ".updateUser", mT);
	}
	public Map<String, String> selectUser(MemberDTO mT) {
		return sqlSession.selectOne(NAMESPACE + ".selectUser", mT);
	}
	public void deleteUser(MemberDTO mT) {
		sqlSession.delete(NAMESPACE + ".deleteUser", mT);
	}
}

package com.itwillbs.dao;

import java.util.List;
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
	
	public Map<String, String> userlogin(MemberDTO mT) {
		
		return sqlSession.selectOne(NAMESPACE + ".userlogin",mT);
	}
}

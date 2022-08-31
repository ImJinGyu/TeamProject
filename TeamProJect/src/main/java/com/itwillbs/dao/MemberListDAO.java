package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberListDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.MemberListMapper";
	
	// 전체 회원 목록 조회
	public List<MemberDTO> getmemberList(MemberDTO memberDTO) {
		return sqlSession.selectList(NAMESPACE + ".getmemberList", memberDTO); 
	}


}


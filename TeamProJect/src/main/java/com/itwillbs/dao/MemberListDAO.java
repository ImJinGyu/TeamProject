package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.QnaDTO;

@Repository
public class MemberListDAO {
//	ㄴ
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.MemberListMapper";
	private static final String NAMESPACE2="com.itwillbs.mappers.adminMapper";
	
	// 전체 회원 목록 조회
	public List<MemberDTO> getmemberList(MemberDTO memberDTO) {
		return sqlSession.selectList(NAMESPACE + ".getmemberList", memberDTO); 
	}
	
	public List<QnaDTO> selectQna(Map<String, Integer> para){
		return sqlSession.selectList(NAMESPACE2 + ".selectQna", para);
	}
	
	public void updateAnwser(QnaDTO qT) {
		System.out.println(qT);
		sqlSession.update(NAMESPACE2 + ".updateAnwser", qT);
	}
	
	public int qnaCount(QnaDTO qT) {
		return sqlSession.selectOne(NAMESPACE2 + ".qnaCount", qT);
	}
	
	public Map<String ,Object> customCount() {
		return sqlSession.selectOne(NAMESPACE2 + ".customCount");
	}
	
	public int pensioncount() {
		return sqlSession.selectOne(NAMESPACE2 + ".pensionCount");
	}
}


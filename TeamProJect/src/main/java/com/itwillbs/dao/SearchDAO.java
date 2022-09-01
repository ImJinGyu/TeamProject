package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;

@Repository
public class SearchDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.BusinessMapper";
	
	/* 검색된 펜션 리스트 가져오기 */
	public List<PensionDTO> getPensionList(Map map) {
		return sqlSession.selectList(NAMESPACE+".getPensionList", map);
	}

//	public List<PensionRmDTO> getRoomList() {
//		return sqlSession.selectList(NAMESPACE+".getRoomList");
//	}
//
//	public ReviewDTO getReviewCount() {
//		System.out.println("searchDAO getReview");
//		return sqlSession.selectOne(NAMESPACE+".getReviewCount");
//	}

	

}

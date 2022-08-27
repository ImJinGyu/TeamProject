package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BusinessDTO;

@Repository
public class BusinessDAO {
	
	// 마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	// memberMapper파일에 정의된 전체 이름을 변수에 저장
	private static final String namespace = "com.itwillbs.mappers.BusinessMapper";

	
	public void registerRoom(BusinessDTO businessDTO) {
		sqlSession.insert(namespace+".registerRoom", businessDTO);
	}

	
//	public Integer getMaxNum() {
//		return sqlSession.selectOne(namespace+".getMaxNum");
//	}
	
	
	

}

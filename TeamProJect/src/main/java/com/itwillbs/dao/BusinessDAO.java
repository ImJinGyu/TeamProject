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

	
	public void registerRoom(BusinessDTO businessDTO3) {
		sqlSession.insert(namespace+".registerRoom", businessDTO3);
	}


	public void registerPen(BusinessDTO businessDTO) {
		sqlSession.insert(namespace+".registerPen", businessDTO);
		
	}


	public void pensionAttach(BusinessDTO businessDTO2) {
		sqlSession.insert(namespace+".pensionAttach", businessDTO2);
		
	}

	
//	public Integer getMaxNum() {
//		return sqlSession.selectOne(namespace+".getMaxNum");
//	}
	
	
	

}

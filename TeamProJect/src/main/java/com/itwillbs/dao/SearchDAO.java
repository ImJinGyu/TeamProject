package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PensionDTO;

@Repository
public class SearchDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.BusinessMapper";
	
	public List<PensionDTO> getPensionList() {
		
		return sqlSession.selectList(NAMESPACE+".getPensionList");
	}

	

}

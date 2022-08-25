package com.itwillbs.dao;

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
	
	public Map<String, String> getSearchList(PensionDTO pensionDTO) {
		// TODO Auto-generated method stub
		return null;
	}
	

}

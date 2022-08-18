package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DAO1 {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.memberMapper";
	
	public List<Map<String, String>> userSelect() {
		return sqlSession.selectList(NAMESPACE + ".userSelect");
		
	}	
}

package com.itwillbs.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwillbs.mappers.paymentMapper";
	
//	public Map
	public void insertreservation(Map<String, Object> sMap) {
		sqlSession.insert(NAMESPACE + ".rsp", sMap);
	}
}
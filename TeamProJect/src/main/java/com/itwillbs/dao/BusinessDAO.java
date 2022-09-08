package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.MemberDTO;

@Repository
public class BusinessDAO {
	
	// 마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	// memberMapper파일에 정의된 전체 이름을 변수에 저장
	private static final String namespace = "com.itwillbs.mappers.BusinessMapper";

	
	public void registerRoom(Map<String, Object> registerRoom) {
		sqlSession.insert(namespace+".registerRoom", registerRoom);
	}


	public void registerPen(BusinessDTO businessDTO) {
		sqlSession.insert(namespace+".registerPen", businessDTO);
		
	}


	public void pensionAttach(BusinessDTO businessDTO2) {
		sqlSession.insert(namespace+".pensionAttach", businessDTO2);
		
	}


	public void pensionRoom(Map<String, Object> pensionRoom) {
		sqlSession.insert(namespace+".pensionRoom", pensionRoom);
		
	}


	public List<BusinessDTO> getRoomList(BusinessDTO businessDTO) {
		
		return sqlSession.selectList(namespace+".getRoomList", businessDTO);
	}



	public void updateRoomList(BusinessDTO businessDTO) {
		sqlSession.update(namespace+".updateRoomList", businessDTO);
		
	}


	public void deleteRoomList(BusinessDTO businessDTO) {
		sqlSession.delete(namespace+".deleteRoomList", businessDTO);
		
	}


	public int reservationCount(String user_id) {
		return sqlSession.selectOne(namespace+".reservationCount", user_id);
	}


	
//	public Integer getMaxNum() {
//		return sqlSession.selectOne(namespace+".getMaxNum");
//	}
	
	
	

}

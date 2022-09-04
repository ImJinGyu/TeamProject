package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PensionDTO;



@Repository
public class SearchDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.itwillbs.mappers.BusinessMapper";
	
	/* 검색된 펜션 리스트 가져오기 */
	public List<PensionDTO> getPensionList(Map map) {
		return sqlSession.selectList(NAMESPACE+".getPensionList", map);
	}

	/* 페이징 */
	public int pensionCount(PensionDTO pensionDTO) {
		return sqlSession.selectOne(NAMESPACE + ".pensionCount", pensionDTO);
	}

	/* (여수어때참고) 카테고리 기능(미정) 추가 시 구현 */
//	public List<PensionDTO> getListWithFilter(@Param("cri") CriteriaPension cri, @Param("pension") PensionDTO pT) {
//		return sqlSession.selectList(NAMESPACE+".getListWithFilter");
//	}



	

}

package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.PensionDTO;


@Service
public class SearchService {

	@Inject
	private SearchDAO searchDAO;
	
	
	/* 펜션리스트 가져오기 */
	public List<PensionDTO> getPensionList(Map map) {
		return searchDAO.getPensionList(map);
	}

	/* 페이징 */
	public int pensionCount(PensionDTO pensionDTO) {
		return searchDAO.pensionCount(pensionDTO);
	}


	
	/* (여수어때참고) 카테고리 기능(미정) 추가 시 구현 */
//	public List<PensionDTO> getListWithFilter(CriteriaPension cri, PensionDTO pT) {
//		List<PensionDTO> list = searchDAO.getListWithFilter(cri, pT);
//		
//		return list;
//	}





}

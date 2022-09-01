package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;

@Service
public class SearchService {

	@Inject
	private SearchDAO searchDAO;
	
	
	/* 검색된 펜션리스트 가져오기 */
	public List<PensionDTO> getPensionList(Map map) {
		return searchDAO.getPensionList(map);
	}

	/* 삭제해도 되는 코드 추후 삭제예정 (지연) */
//	public List<PensionRmDTO> getRoomList() {
//		return searchDAO.getRoomList();
//	}
//
//
//	public ReviewDTO getReviewCount() {
//		return searchDAO.getReviewCount();
//	}



}

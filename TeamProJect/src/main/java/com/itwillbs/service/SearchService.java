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
//	@Inject
//	private SearchDAO searchDAO;

	@Inject
	private SearchDAO searchDAO;
	
	
	public List<PensionDTO> getPensionList() {
//		System.out.println("서치서비스 getPensionList");
		return searchDAO.getPensionList();
	}


//	public List<PensionRmDTO> getRoomList() {
//		return searchDAO.getRoomList();
//	}
//
//
//	public ReviewDTO getReviewCount() {
//		return searchDAO.getReviewCount();
//	}
//


}

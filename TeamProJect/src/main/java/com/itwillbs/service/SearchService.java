package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.BusinessDTO;
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
	
	/* pen_name에 해당하는 펜션 정보 가져오기 (지원) */
	public PensionDTO getPensionDetail(String pen_name) {
		System.out.println("SearchDAO getPensionDetail()");
		return searchDAO.getPensionDetail(pen_name);
	}

	/* pen_name에 해당하는 방 리스트 가져오기 (지원) */
	public List<BusinessDTO> getSearchRoomList(String pen_name) {
		System.out.println("SearchDAO getRoomList()");
		return searchDAO.getSearchRoomList(pen_name);
	}

	public List<PensionDTO> getTopList(PensionDTO pensionDTO) {
		return searchDAO.getTopList(pensionDTO);
	}

	public BusinessDTO getRoomDetail(int room_id) {
		return searchDAO.getRoomDetail(room_id);
	}
	




}

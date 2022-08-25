package com.itwillbs.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.PensionDTO;

@Service
public class SearchService {

	private SearchDAO searchDAO;

	public Map<String, String> getSearchList(PensionDTO pensionDTO) {
		return searchDAO.getSearchList(pensionDTO);
	}
}

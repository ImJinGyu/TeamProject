package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BusinessDTO;

@Service
public class BusinessService {
	
	@Inject
	private BusinessDAO businessDAO;

	
	public void registerRoom(BusinessDTO businessDTO) {
		
//		if(businessDAO.getMaxNum() == null) {
//			businessDTO.setRoomNum("1");
//		} else {
//			businessDTO.setRoomNum((businessDAO.getMaxNum()+1)+"");
//		}
		
		
		businessDAO.registerRoom(businessDTO);
	}
	
	
	
}

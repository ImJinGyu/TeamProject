package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BusinessDTO;

@Service
public class BusinessService {
	
	@Inject
	private BusinessDAO businessDAO;

	
	public void registerRoom(BusinessDTO businessDTO3) {
		
//		if(businessDAO.getMaxNum() == null) {
//			businessDTO.setRoomNum("1");
//		} else {
//			businessDTO.setRoomNum((businessDAO.getMaxNum()+1)+"");
//		}
		
		
		businessDAO.registerRoom(businessDTO3);
	}


	public void registerPen(BusinessDTO businessDTO) {
		
		businessDAO.registerPen(businessDTO);
		
	}


	public void pensionAttach(BusinessDTO businessDTO2) {
		businessDAO.pensionAttach(businessDTO2);
		
	}
	
	
	
}

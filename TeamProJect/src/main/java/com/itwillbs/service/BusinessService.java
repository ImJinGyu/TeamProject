package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BusinessDTO;

@Service
public class BusinessService {
	
	@Inject
	private BusinessDAO businessDAO;

	
	public void registerRoom(Map<String, Object> registerRoom) {
		
//		if(businessDAO.getMaxNum() == null) {
//			businessDTO.setRoomNum("1");
//		} else {
//			businessDTO.setRoomNum((businessDAO.getMaxNum()+1)+"");
//		}
		
		
		businessDAO.registerRoom(registerRoom);
	}


	public void registerPen(BusinessDTO businessDTO) {
		
		businessDAO.registerPen(businessDTO);
		
	}


	public void pensionAttach(BusinessDTO businessDTO2) {
		businessDAO.pensionAttach(businessDTO2);
		
	}


	public void pensionRoom(Map<String, Object> pensionRoom) {
		businessDAO.pensionRoom(pensionRoom);
		
	}
	
	
	
}

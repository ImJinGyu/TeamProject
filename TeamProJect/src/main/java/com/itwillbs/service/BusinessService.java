package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.MemberDTO;

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


	public List<BusinessDTO> getRoomList(BusinessDTO businessDTO) {
		
		return businessDAO.getRoomList(businessDTO);
	}



	public void updateRoomList(BusinessDTO businessDTO) {
		businessDAO.updateRoomList(businessDTO);
		
	}


	public void deleteRoomList(BusinessDTO businessDTO) {
		businessDAO.deleteRoomList(businessDTO);
		
	}


	public int reservationCount(String user_id) {
		
		return businessDAO.reservationCount(user_id);
	}
	
	
	
}

package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReservationDAO;
import com.itwillbs.domain.ReservationDTO;

@Service
public class ReservationService {

	@Inject
	private ReservationDAO reservationDAO;
	
	public List<ReservationDTO> listReservationAll(ReservationDTO reservationDTO){
		return reservationDAO.listReservationAll(reservationDTO);
	}
	
}

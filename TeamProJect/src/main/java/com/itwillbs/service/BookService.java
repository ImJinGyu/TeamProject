package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BookDAO;
import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;
import com.itwillbs.domain.ReservationDTO;
@Service
public class BookService {
	
	
	@Inject
	private BookDAO bookDAO;
	

	public List<ReservationDTO> listReservation(ReservationDTO reservationDTO) {
		return bookDAO.listReservation(reservationDTO);
	}


	public ReservationDTO getMember(String user_id) {
		return bookDAO.getMember(user_id);
	}


	public ReservationDTO listReservation2(ReservationDTO reservationDTO) {
		return bookDAO.listReservation2(reservationDTO);
	}


	public List<ReservationDTO> getListCheckReservation(String pen_id) {
		return bookDAO.getListCheckReservation(pen_id);
	}


//	public void cancelReservation(String res_number) {
//		bookDAO.cancelReservation(res_number);
//		
//	}
//	public boolean cancelReservation(Long reservationNum) {
//		roomMapper.checkoutRoom(mapper.read(reservationNum).getRoomNum());
//		paymentMapper.updateStatus(reservationNum);
//		boolean result = mapper.updateStatus(reservationNum) > 0;
//		return result;


//	public List<BookDTO> listReservation(MemberDTO memberDTO, MemberDTO memberDTO2, PensionDTO pensionDTO,
//			PensionRmDTO pensionRmDTO, BookDTO bookDTO) {
//		return bookDAO.listReservation(memberDTO ,memberDTO2,pensionDTO,pensionRmDTO,bookDTO);
//	}
	
	
}

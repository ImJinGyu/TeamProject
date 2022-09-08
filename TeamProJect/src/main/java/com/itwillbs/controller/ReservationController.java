package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.service.BookService;


@Controller
public class ReservationController {
	
	

	@Inject
	private BookService bookService;
	
	
	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
	public String listReservation(ReservationDTO reservationDTO  , Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		
		reservationDTO.setUser_id(user_id);
		
		List<BookDTO> listReservation = bookService.listReservation(reservationDTO);
		
		model.addAttribute("listReservation", listReservation);
		return "teamProJect/business/listReservation";
	}
	
//	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
//	public String checkReservation(ReservationDTO reservationDTO  , Model model, HttpSession session,String date1, String date2) throws ParseException{
//		String user_id = (String)session.getAttribute("user_id");
//		
//		List<BookDTO> listReservation2 = bookService.listReservation(reservationDTO);
//		
//		model.addAttribute("listReservation", listReservation2);
//		model.addAttribute("date1", date1);
//		model.addAttribute("date2", date2);
//		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
//		Date startDate = new Date(dateFormat.parse(date1).getTime());
//		Date endDate = new Date(dateFormat.parse(date2).getTime());
//		
//		long calculate = endDate.getTime() - startDate.getTime();
//		int days = (int)(calculate / (1000 * 60 * 60 *24));
//		
//		model.addAttribute("days", days);
//		
//		return "teamProJect/business/checkReservation";
//				
//				
//	}
	
	
}


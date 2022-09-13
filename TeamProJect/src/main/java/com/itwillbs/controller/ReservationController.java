package com.itwillbs.controller;


import java.text.ParseException;
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
		
		List<ReservationDTO> listReservation = bookService.listReservation(reservationDTO);
		
		model.addAttribute("listReservation", listReservation);
		return "teamProJect/business/listReservation";
	}
	
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation(ReservationDTO reservationDTO, Model model, HttpSession session){
		String user_id = (String)session.getAttribute("user_id");
		
		reservationDTO.setUser_id(user_id);;
		
		System.out.println(reservationDTO.toString());
		
		List<ReservationDTO> listReservation2 = bookService.listReservation(reservationDTO);
		System.out.println(listReservation2.toString());
		List<ReservationDTO> listReservation3 = bookService.getListCheckReservation(reservationDTO);
		System.out.println(listReservation3.toString());
		if(listReservation3.size() > 0) {
			model.addAttribute("reservation2",listReservation3 );
			return "teamProJect/business/checkReservation";
		} else {
			return "redirect:/business/b_index";
		}
	}
	
//	@RequestMapping(value = "/business/cancelReservation", method = RequestMethod.GET)
//	public String cancelReservation(String res_number) {
//		bookService.cancelReservation(res_number);
//		return "teamProJect/business/checkReservation";
//	}
		
//		System.out.println(reservationDTO2.getPen_id().toString());
		
		
				
				
	
	
}


package com.itwillbs.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.MemberDTO;
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
	
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation(ReservationDTO reservationDTO, Model model, HttpSession session) throws ParseException{
		String user_id = (String)session.getAttribute("user_id");
		ReservationDTO reservationDTO2 = bookService.getMember(user_id);
		System.out.println(reservationDTO2.getPen_id().toString());
		System.out.println(reservationDTO2.getCheck_in_d());
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date beginDate = formatter.parse(reservationDTO2.getCheck_in_d()); 
		Date endDate = formatter.parse(reservationDTO2.getCheck_out_d()); 
		long diff = endDate.getTime() - beginDate.getTime();
		System.out.println(beginDate);
		System.out.println(endDate);
		return "teamProJect/business/checkReservation";
				
				
	}
	
	
}


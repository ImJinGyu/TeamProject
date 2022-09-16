package com.itwillbs.controller;


import java.text.ParseException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
		System.out.println(listReservation2.get(0).getPen_id());
		List<ReservationDTO> listReservation3 = bookService.getListCheckReservation(listReservation2.get(0).getPen_id());
		System.out.println(listReservation3.toString());
		if(listReservation3.size() > 0) {
			model.addAttribute("reservation2",listReservation3 );
			return "teamProJect/business/checkReservation";
		} else {
			return "redirect:/business/b_index";
		}
	}
	
	@RequestMapping(value = "/business/cancelReservation", method = RequestMethod.GET)
	public String cancelReservation(ReservationDTO reservationDTO, Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		reservationDTO.setUser_id(user_id);
		List<ReservationDTO> listReservation3 = bookService.listReservation(reservationDTO);
		if(listReservation3.size() > 0) {
			String Res_num = listReservation3.get(0).getRes_number();
			
			bookService.cancelReservation(Res_num);
			return "redirect:/business/b_index";
		} else {
			return "redirect:teamProJect/business/checkReservation";
		}
		
		
	}
	
	@RequestMapping(value = "/business/listPayment", method = RequestMethod.GET)
	public String listPayment(ReservationDTO reservationDTO  , Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");		
		String user_type = (String)session.getAttribute("user_type");
		
		if(user_type == null) user_type = "0";
		if(user_type.equals("2")) {
			
			reservationDTO.setUser_id(user_id);;
			List<ReservationDTO> listReservation = bookService.listReservation(reservationDTO);
			
			model.addAttribute("listReservation3", listReservation);	
			
			return "teamProJect/business/listPayment";
		} else {
			return "teamProJect/business/msg";
		}
	}
		
		
				
				
	
	
}


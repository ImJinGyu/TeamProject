package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.BookDAO;
import com.itwillbs.domain.BookDTO;
import com.itwillbs.service.BookService;


@Controller
public class ReservationController {
	
	
///	
//	@Inject
//	private BookDAO bookDAO;
//	private BookDTO bookDTO;
//	private BookService bookService;
//	
	
//	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
//	public String listReservation(HttpServletRequest req, Model model) {
//		 String num =req.getParameter("num");
//		 List<BookDTO> list = bookService.listReservation(num);
//			model.addAttribute("reservation", list);
//		return "teamProJect/business/listReservation";
//	}
	
//	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
//	public String checkReservation() {
//				
//		return "teamProJect/business/checkReservation";
//	}
	
	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
	public String listReservation() {
		return "teamProJect/business/listReservation";
	}
	
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation() {
				
		return "teamProJect/business/checkReservation";
	}
}


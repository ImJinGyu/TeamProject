package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.BookDAO;
import com.itwillbs.domain.BookDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.PensionRmDTO;
import com.itwillbs.service.BookService;


@Controller
public class ReservationController {
	
	

	@Inject
	private BookService bookService;
	
	
	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
	public String listReservation(BookDTO bookDTO , Model model) {
		 List<BookDTO> listReservation = bookService.listReservation(bookDTO);
			model.addAttribute("listReservation", listReservation);
		return "teamProJect/business/listReservation";
	}
	
	

//	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
//	public String listReservation(BookDTO bookDTO , Model model, HttpSession session) {
//		 List<BookDTO> listReservation = bookService.listReservation(bookDTO);
//		 	bookDTO.setPEN_ID(session.getAttribute("user_id").toString());
//			model.addAttribute("listReservation", listReservation);
//		return "teamProJect/business/listReservation";
//	}
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation() {
				
		return "teamProJect/business/checkReservation";
	}
}


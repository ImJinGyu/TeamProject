package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BusinessController {
	
	@RequestMapping(value = "/business/b_myPage", method = RequestMethod.GET)
	public String b_myPage() {
				
		return "teamProJect/business/b_myPage";
	}
	
	
	@RequestMapping(value = "/business/b_index", method = RequestMethod.GET)
	public String b_index() {
				
		return "teamProJect/business/b_index";
	}
	
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation() {
				
		return "teamProJect/business/checkReservation";
	}
	
	@RequestMapping(value = "/business/listPayment", method = RequestMethod.GET)
	public String listPayment() {
				
		return "teamProJect/business/listPayment";
	}
	
	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
	public String listReservation() {
				
		return "teamProJect/business/listReservation";
	}
	
	@RequestMapping(value = "/business/roomList", method = RequestMethod.GET)
	public String roomList() {
				
		return "teamProJect/business/roomList";
	}
	
	@RequestMapping(value = "/business/roomRegister", method = RequestMethod.GET)
	public String roomRegister() {
				
		return "teamProJect/business/roomRegister";
	}
	
}

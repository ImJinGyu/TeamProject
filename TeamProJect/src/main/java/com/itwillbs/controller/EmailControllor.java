package com.itwillbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.service.MailSendService;

@Controller
public class EmailControllor {
	
	@Autowired
	private MailSendService mailService;

	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String email() {
		return "teamProJect/email";
	}
	
	
	@RequestMapping(value = "/emailsend", method = RequestMethod.GET)
	@ResponseBody
	public String emailsend(String email) {
		return mailService.joinEmail(email);
	}
}

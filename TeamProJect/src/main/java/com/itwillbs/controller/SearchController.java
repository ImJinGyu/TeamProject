package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
	
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home() {
				
		return "teamProJect/search/main";
	}

}

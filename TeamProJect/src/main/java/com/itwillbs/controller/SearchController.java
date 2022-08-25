package com.itwillbs.controller;

import java.time.format.DateTimeFormatter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.SearchService;

import util.DateParse;

@Controller
public class SearchController {
	
	@Inject
	private SearchService searchService;
	
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		return "teamProJect/search/main";
	}

	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
	public String search(HttpServletRequest request, HttpServletResponse response) {

		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		return "teamProJect/search/searchP";
	}
	

//	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
//	public String searchList(HttpServletRequest request, PensionDTO pensionDTO) {
//		
//		Map<String, String> searchMap = searchService.getSearchList(pensionDTO);
//		
//		
//		
//		return "teamProJect/search/searchP";
//	}

}

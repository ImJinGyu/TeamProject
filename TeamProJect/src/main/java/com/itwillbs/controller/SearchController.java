package com.itwillbs.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.service.SearchService;

import util.DateParse;

@Controller
public class SearchController {
	
	@Inject
	private SearchService searchService;
	
	@Inject
	private SearchDAO searchDAO;
	
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		return "teamProJect/search/main";
	}

//	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
//	public String search(HttpServletRequest request, HttpServletResponse response) {
//
//		DateParse dateParse = new DateParse();
//		String today = dateParse.getTodayPlus(0);
//		String tomorrow = dateParse.getTodayPlus(1);
//		request.setAttribute("today", dateParse.strToDate(today));
//		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
//		
//		return "teamProJect/search/searchP";
//	}
	
	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {

		/* 검색창 날짜 */
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		
		/* 검색된 펜션 리스트 불러오기 */
		List<PensionDTO> pensionList = searchService.getPensionList();
		model.addAttribute("pensionList", pensionList);
		
		/* 펜션 방 정보 불러오기 */
		/*
		 * List<PensionRmDTO> rmList = searchService.getRoomList();
		 * model.addAttribute("rmList", rmList);
		 * 
		 * ReviewDTO rvDTO = searchService.getReviewCount();
		 */
		
		return "teamProJect/search/searchP";
		
	}
	

}

package com.itwillbs.controller;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.SuppressAjWarnings;
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
	
	
	// main 주소 맵핑 + 메인 검색창 날짜 설정
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		
		
		
		return "teamProJect/search/main";
	}
	
	/* 숙소리스트 불러오기 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {

		/* 검색창 조건 컬럼 */
		String pen_address = request.getParameter("pen_address");
		String pen_name = request.getParameter("pen_name");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		String rm_resable_num = request.getParameter("rm_resable_num");
		
		Map map = new HashMap();
		map.put("pen_address", pen_address == null ? "" : pen_address);
		map.put("pen_name", pen_name);
		map.put("rm_resable_num", rm_resable_num);
		
		/* 펜션 리스트 불러오기 */
		System.out.println(map);
		List<PensionDTO> pensionList = searchService.getPensionList(map);

		/* 기존 검색창 날짜 오늘, 내일 날짜로 설정 */
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		
		// yyyyMMdd -> yyyy-MM-dd
		today = dateParse.strToDate(today);
		tomorrow = dateParse.strToDate(tomorrow);
		
		/* 카테고리 별 검색 시 현재 날짜로 날짜 설정 */
		if(rm_checkin == null) rm_checkin = today;
		if(rm_checkout == null) rm_checkout = tomorrow;
		
		request.setAttribute("pensionList", pensionList);
		request.setAttribute("pen_address", pen_address);
		request.setAttribute("pen_name", pen_name);
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("rm_resable_num", rm_resable_num);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		

		
		
		return "teamProJect/search/searchP";
		
	}
	

}

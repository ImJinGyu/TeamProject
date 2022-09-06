package com.itwillbs.controller;

import java.nio.file.spi.FileSystemProvider;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dao.SearchDAO;
import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PagingDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.service.SearchService;


import util.DateParse;

@Controller
public class SearchController {
	
//	// 결제 api 연동 (정우)
//	private IamportClient api;
	
	@Inject
	private SearchService searchService;
	
	@Inject
	private SearchDAO searchDAO;
	
	
	// 메인 검색창 날짜 설정
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		
		
		
		return "teamProJect/search/main";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
	public String list(PensionDTO pensionDTO, HttpServletRequest request, Model model) {
		
		int totalCount = searchService.pensionCount(pensionDTO);
		String spageNum = request.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		} else {
			ipageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
//		System.out.println(ipageNum );
//		System.out.println(ipageNum );
		PagingDTO pT = new PagingDTO(ipageNum, totalCount);
		model.addAttribute("page", pT);
		
		int index = (pT.getPageNum() - 1) * pT.getAmount();
//		int amount = pT.getAmount();
		int amount = 10;
		

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
		map.put("index", index);
		map.put("amount", amount);
		
		
		/* 펜션 리스트 불러오기 */
		List<PensionDTO> pensionList = searchService.getPensionList(map);
		model.addAttribute("pensionList", pensionList);
		System.out.println(pensionList.size());
		model.addAttribute("page", map);
//		System.out.println(pensionList);

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
		
//		request.setAttribute("pensionList", pensionList);
		request.setAttribute("pen_address", pen_address);
		request.setAttribute("pen_name", pen_name);
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("rm_resable_num", rm_resable_num);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		
		return "teamProJect/search/searchP";
		
	}
	public void listajax2() {
		
	}
	@ResponseBody
	@RequestMapping(value = "/search/searchPajax", method = RequestMethod.GET)
	public List<PensionDTO> listajax(@RequestParam String count, String index2, PensionDTO pensionDTO, HttpServletRequest request, Model model) {
		System.out.println(count + "-count");
		
		int amount = Integer.parseInt(count.toString());
		int totalCount = searchService.pensionCount(pensionDTO);
		String spageNum = request.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		} else {
			ipageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
//		System.out.println(ipageNum );
//		System.out.println(ipageNum );
		PagingDTO pT = new PagingDTO(ipageNum, totalCount);
		model.addAttribute("page", pT);
		
		int index = (Integer.parseInt(index2) - 1) * pT.getAmount();
		
		System.out.println(index + "-index");
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
		map.put("index", index);
		map.put("amount", amount);
		
		
		/* 펜션 리스트 불러오기 */
		List<PensionDTO> pensionList = searchService.getPensionList(map);
		for (PensionDTO dto : pensionList) {
			dto.setRm_price(dto.getRm_price().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
		}
		System.out.println(pensionList.size() + " - list");
		model.addAttribute("pensionList", pensionList);
		model.addAttribute("page", map);
		System.out.println(pensionList);
		

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
		
//		request.setAttribute("pensionList", pensionList);
		request.setAttribute("pen_address", pen_address);
		request.setAttribute("pen_name", pen_name);
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("rm_resable_num", rm_resable_num);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		return pensionList;
	}


	
	
	
	/* 아직 수정할거 많음 펜션 정보 + 방 리스트 불러오기 (지원) */
	@RequestMapping(value = "/search/pensionDetail", method = RequestMethod.GET)
	public String pensionDetail(HttpServletRequest request, Model model) {
		
		/* 파라미터 값(펜션 이름) 저장 */
		String pen_name = request.getParameter("pen_name");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		
		System.out.println("펜션 이름 : " + pen_name);
		System.out.println("checkin : " + rm_checkin + " / checkout : " + rm_checkout);
		
		/* 해당 펜션 정보, 방 리스트 불러오기 */
		PensionDTO pensionDTO = searchService.getPensionDetail(pen_name);
		List<BusinessDTO> searchRoomList = searchService.getSearchRoomList(pen_name);

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
		

		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));
		
		/* model에 펜션 정보, 방 리스트 저장 */
		model.addAttribute("pensionDTO", pensionDTO);
		model.addAttribute("searchRoomList", searchRoomList);
		model.addAttribute("rm_checkin", rm_checkin);
		model.addAttribute("rm_checkout", rm_checkout);
		model.addAttribute("today", today);
		model.addAttribute("tomorrow", tomorrow);
		
		return "teamProJect/search/pensionDetail";
		
	}
	
	/* 손 거의 안댐 수정할거 많음 펜션 정보 + 방 리스트 불러오기 (지원) */
	@RequestMapping(value = "/search/reserve", method = RequestMethod.GET)
	public String reserve(HttpServletRequest request, Model model) {
		
		String pen_name = request.getParameter("pen_name");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		
		System.out.println("펜션 이름 : " + pen_name);
		System.out.println("checkin : " + rm_checkin + " / checkout : " + rm_checkout);
		
		PensionDTO pensionDTO = searchService.getPensionDetail(pen_name);
		
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		
		model.addAttribute("pensionDTO", pensionDTO);
		model.addAttribute("rm_checkin", rm_checkin);
		model.addAttribute("rm_checkout", rm_checkout);
		
		return "teamProJect/search/reserve";
		
	}
	
	// 결제 api (정우)
//	public HomeController() {
//		
//		// REST API 키와 REST API secret 을 아래처럼 순서대로 입력
//		this.api = new IamportClient("3157873113568822", "8Nt0l6CyajA08fjZvXoh2i5q4Y1yA8IvKoy8mEDxUpJCpkzT6klss5rDe4W4TqXiPDGC6NejJPvriujx");
//	}
//	

}

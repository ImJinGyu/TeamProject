package com.itwillbs.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PagingDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.BusinessService;
import com.itwillbs.service.MemberListService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ReservationService;
import com.itwillbs.service.ReviewService;
import com.itwillbs.service.SearchService;


@Controller
public class AdminController {
	
	@Inject
	private MemberListService memberListService;
	
	@Inject
	private ReservationService reservationService;
	
	@Inject
	private SearchService searchService;
	
	@Inject
	private ReviewService reviewservice;
	
	
	@RequestMapping(value = "/admin/a_myPage", method = RequestMethod.GET)
	public String a_myPage() {
		return "teamProJect/admin/a_myPage";
	}
	
	@RequestMapping(value = "/admin/a_pensionlist", method = RequestMethod.GET)
	public String a_pensionlist(Model model) {
		List<PensionDTO> pensionList = memberListService.pensionlist();
		for (PensionDTO pensionDTO : pensionList) {
			Integer a = Integer.parseInt(pensionDTO.getStar());
			pensionDTO.setStar(a.toString());
		}
		model.addAttribute("list",pensionList);
		return "teamProJect/admin/a_pensionlist";
	}
	
	@RequestMapping(value = "/admin/a_reviewlist", method = RequestMethod.GET)
	public String a_reviewlist(Model model, HttpServletRequest req) {
		
		int totalCount = reviewservice.reviewcount2();
		String spageNum = req.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		}else {
			ipageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		Map<String, Object> sMap = new HashMap<String, Object>();
		sMap.put("index", para.get("index"));
		sMap.put("amount", para.get("amount"));
		List<ReviewDTO> reviewlist = reviewservice.selectreviewlist(sMap);
		System.out.println(reviewlist);
		model.addAttribute("list",reviewlist);
		return "teamProJect/admin/a_reviewlist";
	}
	
	@RequestMapping(value = "/admin/a_index", method = RequestMethod.GET)
	public String a_index(Model model) {
		Map<String ,Object> sMap = memberListService.customCount();
		System.out.println(sMap);
		model.addAttribute("Map",sMap);
		
		return "teamProJect/admin/a_index";
	}
	
	@RequestMapping(value = "/admin/a_listInquiry", method = RequestMethod.GET)
	public String a_listInquiry(QnaDTO qT, HttpServletRequest req, Model model) {
		
		int totalCount = memberListService.qnaCount(qT);
		String spageNum = req.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		}else {
			ipageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		List<QnaDTO> qList =  memberListService.selectQna(para);
		model.addAttribute("list",qList);
		return "teamProJect/admin/a_listInquiry";
	}
	
	@RequestMapping(value ="/admin/a_memberList", method = RequestMethod.GET)
	public String a_memberList(Model model , HttpServletRequest req, MemberDTO MemberDTO) {
		

		// ?????? ?????? ?????? ??????
		List<MemberDTO> memberList = memberListService.getMemberList(MemberDTO);
		for (MemberDTO mT2 : memberList) {
			String user_type = mT2.getUser_type();
			String type = "";
			switch (user_type) {
			case "0": type = "?????????"; break;
			case "1": type = "????????????"; break;
			case "2": type = "????????????"; break;
			}
			mT2.setUser_type(type);
		}
		model.addAttribute("mList", memberList);
		
		return "teamProJect/admin/a_memberList";
	}
	
	@RequestMapping(value = "/admin/a_listInquiryPro", method = RequestMethod.POST)
	public String a_listInquiry(QnaDTO qT) {
		qT.setAnswer_time(new FunctionClass().nowTime("yyyy-MM-dd HH:mm"));
		qT.setReply("Y");
		System.out.println(qT);
		memberListService.updateAnwser(qT);
		return "redirect:/admin/a_listInquiry";
	}
	
	@RequestMapping(value = "/admin/a_paymentlist", method = RequestMethod.GET)
	public String a_paymentlist(Model model) {
		List<Map<String, Object>> list = memberListService.selectpay();
		System.out.println(list);
		model.addAttribute("list", list);
		return "teamProJect/admin/a_paymentlist";
	}
	
	@RequestMapping(value = "/admin/a_listReservationAll", method = RequestMethod.GET)
	public String a_listReservationAll(Model model, ReservationDTO reservationDTO) {
		
		List<ReservationDTO> listReservationAll = reservationService.listReservationAll(reservationDTO);
		model.addAttribute("listReservationAll", listReservationAll);
		
		return "teamProJect/admin/a_listReservationAll";
	}
		
}	
		

	
//	@RequestMapping(value = "/admin/roomList", method = RequestMethod.GET)
//	public String roomList() {
//				
//		return "teamProJect/admin/roomList";
//	}
	
//	@RequestMapping(value = "/admin/roomRegister", method = RequestMethod.GET)
//	public String roomRegister() {
//				
//		return "teamProJect/admin/roomRegister";
//	}
	
//	@RequestMapping(value = "/admin/roomRegisterPro", method = RequestMethod.POST)
//	public String roomRegisterPro(HttpServletRequest request, MultipartFile RM_IMAGE) throws Exception {
//		
//		// ????????? ?????? ?????? => ????????????_???????????? ??????
//		UUID uuid = UUID.randomUUID();
//		String filename= uuid.toString()+"_"+RM_IMAGE.getOriginalFilename();
//		// ????????? ?????? file.getBytes() => upload/????????????_???????????? ??????
////				File uploadFile = new File(upload??????,????????????);
//		File uploadFile = new File(uploadPath,filename);
//				
//		FileCopyUtils.copy(RM_IMAGE.getBytes(), uploadFile);
//		
//		
//		BusinessDTO businessDTO = new BusinessDTO();
//		businessDTO.setRM_NAME(request.getParameter("RM_NAME"));
////		businessDTO.setDeadline(request.getParameter("deadline"));
////		businessDTO.setPrice(request.getParameter("price"));
//		businessDTO.setRM_IMAGE(filename);
//		
//		
//		
//		businessService.registerRoom(businessDTO);
//				
//		return "redirect:/business/roomList";
//	}
//	
	
	
	
	



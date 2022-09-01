package com.itwillbs.controller;

import java.io.File;
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
import com.itwillbs.domain.QnaDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.BusinessService;
import com.itwillbs.service.MemberListService;
import com.itwillbs.service.MemberService;


@Controller
public class AdminController {
	
	@Inject
	private MemberListService memberListService;
//	ㄴ
	
	@RequestMapping(value = "/admin/a_myPage", method = RequestMethod.GET)
	public String a_myPage() {
				
		return "teamProJect/admin/a_myPage";
	}
	
	@RequestMapping(value = "/admin/a_index", method = RequestMethod.GET)
	public String a_index() {
				
		return "teamProJect/admin/a_index";
	}
	
	@RequestMapping(value = "/admin/a_listInquiry", method = RequestMethod.GET)
	public String a_listInquiry(HttpServletRequest req, Model model) {
		int totalCount = memberListService.qnaCount();
		String spageNum = req.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		}else {
			ipageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		PagingDTO pT = new PagingDTO(ipageNum, totalCount);
		model.addAttribute("page", pT);
		
		int index = (pT.getPageNum() - 1) * pT.getAmount();
		int amount = pT.getAmount();
		Map<String, Integer> para = new HashMap<String, Integer>();
		para.put("index", index);
		para.put("amount", amount);
		
		List<QnaDTO> qList =  memberListService.selectQna(para);
		System.out.println(qList);
		model.addAttribute("list",qList);
		return "teamProJect/admin/a_listInquiry";
	}
	
	@RequestMapping(value ="/admin/a_memberList", method = RequestMethod.GET)
	public String a_memberList(Model model , HttpServletRequest req, MemberDTO MemberDTO) {
		

		// 전체 회원 목록 조회
		List<MemberDTO> memberList = memberListService.getMemberList(MemberDTO);
		for (MemberDTO mT2 : memberList) {
			String user_type = mT2.getUser_type();
			String type = "";
			switch (user_type) {
			case "0": type = "관리자"; break;
			case "1": type = "일반회원"; break;
			case "2": type = "업체회원"; break;
			}
			mT2.setUser_type(type);
		}
		model.addAttribute("mList", memberList);
		System.out.println(memberList);
		
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
//		// 업로드 파일 이름 => 랜덤문자_파일이름 변경
//		UUID uuid = UUID.randomUUID();
//		String filename= uuid.toString()+"_"+RM_IMAGE.getOriginalFilename();
//		// 업로드 파일 file.getBytes() => upload/랜덤문자_파일이름 복사
////				File uploadFile = new File(upload경로,파일이름);
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
	
	
	
	



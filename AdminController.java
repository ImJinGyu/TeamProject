package com.itwillbs.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.service.BusinessService;
import com.itwillbs.service.MemberService;

@Controller
public class AdminController {
	
//	@Inject
//	private BusinessService businessService;
	
	@RequestMapping(value = "/admin/a_myPage", method = RequestMethod.GET)
	public String a_myPage() {
				
		return "teamProJect/admin/a_myPage";
	}
	
	@RequestMapping(value = "/admin/a_index", method = RequestMethod.GET)
	public String a_index() {
				
		return "teamProJect/admin/a_index";
	}
	
	@RequestMapping(value = "/admin/a_memberList", method = RequestMethod.GET)
	public String listPayment() {
				
		return "teamProJect/admin/a_memberList";
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
	
	
	
	
}


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
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.BusinessService;

@Controller
public class BusinessController {
	
	@Inject
	private BusinessService businessService;
	
	// 업로드 경로
//		Resource(name = "servlet-context.xml에 있는 업로드 경로의 id값")
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	@Resource(name="uploadPath2")
//	private String uploadPath2;
	
	@RequestMapping(value = "/business/b_myPage", method = RequestMethod.GET)
	public String b_myPage() {
				
		return "teamProJect/business/b_myPage";
	}
	
	
	@RequestMapping(value = "/business/b_index", method = RequestMethod.GET)
	public String b_index() {
				
		return "teamProJect/business/b_index";
	}
	
	
	
	@RequestMapping(value = "/business/listPayment", method = RequestMethod.GET)
	public String listPayment() {
				
		return "teamProJect/business/listPayment";
	}
	
	
	
	@RequestMapping(value = "/business/roomList", method = RequestMethod.GET)
	public String roomList() {
				
		return "teamProJect/business/roomList";
	}
	
	@RequestMapping(value = "/business/roomRegister", method = RequestMethod.GET)
	public String roomRegister() {
				
		return "teamProJect/business/roomRegister";
	}
	
	@RequestMapping(value = "/business/roomRegisterPro", method = RequestMethod.POST)
	public String roomRegisterPro(MemberDTO memberDTO, HttpServletRequest request, MultipartFile RM_IMAGE, MultipartFile PEN_IMAGE) throws Exception {
		
		// 업로드 파일 이름 => 랜덤문자_파일이름 변경
		UUID uuid = UUID.randomUUID();
		String filename= uuid.toString()+"_"+RM_IMAGE.getOriginalFilename();
		String filename2= uuid.toString()+"_"+PEN_IMAGE.getOriginalFilename();
		// 업로드 파일 file.getBytes() => upload/랜덤문자_파일이름 복사
//				File uploadFile = new File(upload경로,파일이름);
		File uploadFile = new File(uploadPath,filename);
		File uploadFile2 = new File(uploadPath,filename2);
				
		FileCopyUtils.copy(RM_IMAGE.getBytes(), uploadFile);
		FileCopyUtils.copy(PEN_IMAGE.getBytes(), uploadFile2);
			
		
		
		BusinessDTO businessDTO = new BusinessDTO();
		BusinessDTO businessDTO2 = new BusinessDTO();
		BusinessDTO businessDTO3 = new BusinessDTO();
		// pension
		businessDTO.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO.setUSER_ID(request.getParameter("PEN_ID"));
		businessDTO.setPEN_NAME(request.getParameter("PEN_NAME"));
		businessDTO.setPEN_NUMBER(request.getParameter("PEN_TEL"));
		businessDTO.setPEN_ZIPCODE(request.getParameter("postNum"));
		businessDTO.setPEN_ADDRESS(request.getParameter("user_address") +" "+request.getParameter("user_address2"));
		
		// pension_Attach
		businessDTO2.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO2.setPEN_IMAGE(filename2);
		
		// room_Attach
		businessDTO3.setRM_NAME(request.getParameter("RM_NAME"));
//		businessDTO2.setCheckin(request.getParameter("checkin"));
//		businessDTO2.setCheckout(request.getParameter("checkout"));
//		businessDTO2.setPeople(request.getParameter("people"));
//		businessDTO2.setRM_Price(request.getParameter("RM_Price"));
		businessDTO3.setRM_IMAGE(filename);
		
		// pension
		businessService.registerPen(businessDTO);
		// pension_attach
		businessService.pensionAttach(businessDTO2);
		// room_attach
		businessService.registerRoom(businessDTO3);
				
		return "redirect:/business/roomList";
	}
	
	@RequestMapping(value = "/business/mypage/listReservation", method = RequestMethod.GET)
	public String b_listReservation() {
				
		return "teamProJect/business/mypage/listReservation";
	}
	
	@RequestMapping(value = "/business/mypage/listInquiry", method = RequestMethod.GET)
	public String b_listInquiry() {
				
		return "teamProJect/business/mypage/listInquiry";
	}
	
	
	
}

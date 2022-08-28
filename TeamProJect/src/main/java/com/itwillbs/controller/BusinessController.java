
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

@Controller
public class BusinessController {
	
	@Inject
	private BusinessService businessService;
	
	// 업로드 경로
//		Resource(name = "servlet-context.xml에 있는 업로드 경로의 id값")
	@Resource(name="uploadPath")
	private String uploadPath;
	
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
	public String roomRegisterPro(HttpServletRequest request, MultipartFile RM_IMAGE) throws Exception {
		
		// 업로드 파일 이름 => 랜덤문자_파일이름 변경
		UUID uuid = UUID.randomUUID();
		String filename= uuid.toString()+"_"+RM_IMAGE.getOriginalFilename();
		// 업로드 파일 file.getBytes() => upload/랜덤문자_파일이름 복사
//				File uploadFile = new File(upload경로,파일이름);
		File uploadFile = new File(uploadPath,filename);
				
		FileCopyUtils.copy(RM_IMAGE.getBytes(), uploadFile);
		
		
		BusinessDTO businessDTO = new BusinessDTO();
		businessDTO.setRM_NAME(request.getParameter("RM_NAME"));
//		businessDTO.setDeadline(request.getParameter("deadline"));
//		businessDTO.setPrice(request.getParameter("price"));
		businessDTO.setRM_IMAGE(filename);
		
		
		
		businessService.registerRoom(businessDTO);
				
		return "redirect:/business/roomList";
	}
	
	
	
	
	
}

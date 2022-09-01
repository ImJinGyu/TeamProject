package com.itwillbs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String roomRegisterPro(MemberDTO memberDTO, HttpServletRequest request, MultipartHttpServletRequest RM_IMAGE, MultipartFile PEN_IMAGE) throws Exception {
			
		
		// PENSION
		// 업로드 파일 이름 => 랜덤문자_파일이름 변경
		UUID uuid = UUID.randomUUID();
		String filename2= uuid.toString()+"_"+PEN_IMAGE.getOriginalFilename();
		// 업로드 파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		// File uploadFile = new File(upload경로,파일이름);
		// File uploadFile = new File(uploadPath,filename);
		File uploadFile2 = new File(uploadPath,filename2);
						
		// FileCopyUtils.copy(RM_IMAGE.getBytes(), uploadFile);
		FileCopyUtils.copy(PEN_IMAGE.getBytes(), uploadFile2);
		
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO = new BusinessDTO();
		// address 주소 부분이 기본 주소 와 상세주소로 나뉘어 2개의 파라미터값을 받아올 String변수 생성
		String address = request.getParameter("user_address") +" "+request.getParameter("user_address2");
		
		businessDTO.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO.setUSER_ID(request.getParameter("PEN_ID"));
		businessDTO.setPEN_NAME(request.getParameter("PEN_NAME"));
		businessDTO.setPEN_NUMBER(request.getParameter("PEN_TEL"));
		businessDTO.setPEN_ZIPCODE(request.getParameter("postNum"));
		businessDTO.setPEN_ADDRESS(address);
		
		businessService.registerPen(businessDTO);
		
		// PENSION_Attach
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO2 = new BusinessDTO();
		businessDTO2.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO2.setPEN_IMAGE(filename2);
		
		businessService.pensionAttach(businessDTO2);
		
		// PENSION_ROOM
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO3 = new BusinessDTO();
		
		// Form에서 accordion으로 동일 name의 여러 parameter값을 가져와야하기때문에
		// String[] 배열로 parameterValues값을 담는다
		// ( 1개의 prameter값은 getParameterValue, 2개 이상은 getParameterValues 사용)
		String[] NAME = request.getParameterValues("RM_NAME");
		String[] CHECKIN = request.getParameterValues("checkin");
		String[] CHECKOUT = request.getParameterValues("checkout");
		String[] RESABLE_NUM = request.getParameterValues("people");
		String[] PRICE = request.getParameterValues("RM_Price");
		
		String PEN_ID = request.getParameter("PEN_ID");
		String RM_NAME = "";
		String RM_CHECKIN = "";
		String RM_CHECKOUT = "";
		String RM_RESABLE_NUM = "";
		String RM_PRICE = "";
		String RES_STATUS = "0"; // 예약상태를 따로 입력하지않고 하드코딩했음
		Map<String, Object> pensionRoom = new HashMap<String, Object>();
		
		// 배열에 있는 값들을 DB에 입력하기 위해
		// 반복문 for문을 사용
		for(int i = 0; i < NAME.length; i++) {
			
			System.out.println(NAME[i]);
			System.out.println(CHECKIN[i]);
			System.out.println(CHECKOUT[i]);
			System.out.println(RESABLE_NUM[i]);
			System.out.println(PRICE[i]);
			
			RM_NAME = NAME[i];
			RM_CHECKIN = CHECKIN[i];
			RM_CHECKOUT = CHECKOUT[i];
			RM_RESABLE_NUM = RESABLE_NUM[i];
			RM_PRICE = PRICE[i];
			
			businessDTO3.setPEN_ID(PEN_ID);
			businessDTO3.setRM_NAME(RM_NAME);
			businessDTO3.setRM_CHECKIN(RM_CHECKIN);
			businessDTO3.setRM_CHECKOUT(RM_CHECKOUT);
			businessDTO3.setRM_RESABLE_NUM(RM_RESABLE_NUM);
			businessDTO3.setRM_PRICE(RM_PRICE);
			businessDTO3.setRES_STATUS(RES_STATUS);
			
			// DTO 객체의 여러 값을 List에 담기위한 List 객체 생성
			List<BusinessDTO> room = new ArrayList<BusinessDTO>();
			room.add(businessDTO3);
			
			// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용 
			pensionRoom.put("room", room);
		
			businessService.pensionRoom(pensionRoom);
		}
		
		
		// ROOM_ATTACH
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO4 = new BusinessDTO();
		
		// Form에서 accordion으로 동일 name의 여러 parameter값을 가져와야하기때문에
		// String[] 배열로 parameterValues값을 담는다
		// ( 1개의 prameter값은 getParameterValue, 2개 이상은 getParameterValues 사용)
		String[] RM_NAMES = request.getParameterValues("RM_NAME");
		String result = "";
		String filename = "";
		
		// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용 
		Map<String, Object> registerRoom = new HashMap<String, Object>();
		
		// input태그의 file타입의 여러 동일이름의 parameter값을 List 담기위한 코드
		List<MultipartFile> fileList = RM_IMAGE.getFiles("RM_IMAGE");
		
		// 배열에 있는 값들을 DB에 입력하기 위해
		// 반복문 for문을 사용 
		for(int i = 0; i < RM_NAMES.length; i++) {
			
			// RM_NAMES 값들이 잘넘어오는 지 확인하기 위한 println 코드
			// 확인 후 주석 처리
			// System.out.println(RM_NAMES[i]);
			
			result = RM_NAMES[i];
			filename = uuid.toString()+"_"+fileList.get(i).getOriginalFilename();
			
			// filename 값들이 잘넘어오는지 확인하기위한 println 코드
			// 확인 후 주석 처리
			// System.out.println(filename);
			
			businessDTO4.setRM_NAME(result);
			businessDTO4.setRM_IMAGE(filename);
			
			// DTO 객체의 여러 값을 List에 담기위한 List 객체 생성
			List<BusinessDTO> roomAttach = new ArrayList<BusinessDTO>();
			roomAttach.add(businessDTO4);
			
			// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용
			registerRoom.put("roomAttach", roomAttach);
		
			businessService.registerRoom(registerRoom);
		}
		
		
		
				
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

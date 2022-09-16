package com.itwillbs.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
	private IamportClient api;
	@Inject
	private PaymentService service;
	
	public PaymentController() {
		// REST API 키와 REST API secret 입력
		this.api = new IamportClient("3157873113568822", "8Nt0l6CyajA08fjZvXoh2i5q4Y1yA8IvKoy8mEDxUpJCpkzT6klss5rDe4W4TqXiPDGC6NejJPvriujx");
	}
	
	@ResponseBody
	@RequestMapping(value="search/insertReservation", method = RequestMethod.POST)
	public String paymenByImpUid (@RequestParam Map<String, Object> para){
		
		Map<String, Object> sMap = para;
		sMap.put("res_number", para.get("pen_id").toString().concat(para.get("room_id").toString().concat(new FunctionClass().nowTime("yyyyMMddHHmmss"))));
		sMap.put("res_time", new FunctionClass().nowTime("yyyy-MM-dd HH:mm:ss"));
		System.out.println(sMap);
		service.insertreservation(sMap);
		
		
		return "redirect:/member/mypage/listReservation";
		
	}
	
	
	
}

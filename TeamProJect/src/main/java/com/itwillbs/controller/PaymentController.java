package com.itwillbs.controller;

import org.springframework.stereotype.Controller;

import com.siot.IamportRestClient.IamportClient;

@Controller
public class PaymentController {
	
	private IamportClient api;
	
	public PaymentController() {
		// REST API 키와 REST API secret 입력
		this.api = new IamportClient("3157873113568822", "8Nt0l6CyajA08fjZvXoh2i5q4Y1yA8IvKoy8mEDxUpJCpkzT6klss5rDe4W4TqXiPDGC6NejJPvriujx");
	}
	
	
}

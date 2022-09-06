package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PaymentDAO;

@Service
public class PaymentService {

	@Inject
	private PaymentDAO paymentdao;
	
}

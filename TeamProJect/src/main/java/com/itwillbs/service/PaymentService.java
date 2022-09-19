package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PaymentDAO;

@Service
public class PaymentService {
	
	@Inject
	private PaymentDAO paymentdao;
		
	public void insertreservation(Map<String, Object> sMap) {
		paymentdao.insertreservation(sMap);
	}
	
	public void cancelReservation(Map<String, Object> sMap) {
		paymentdao.cancelreservation(sMap);
	}
}


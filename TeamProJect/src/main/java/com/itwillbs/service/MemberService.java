package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO dao;
	
	public List<Map<String, String>> select() {
		return dao.userSelect();
	}
	
	public Map<String, String> userlogin(Map<String, String> uMap) {
		return dao.userlogin(uMap);
	}
}

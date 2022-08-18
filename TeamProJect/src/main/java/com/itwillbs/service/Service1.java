package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.DAO1;

@Service
public class Service1 {
	
	@Inject
	private DAO1 dao;
	
	public List<Map<String, String>> select() {
		return dao.userSelect();
	}
}

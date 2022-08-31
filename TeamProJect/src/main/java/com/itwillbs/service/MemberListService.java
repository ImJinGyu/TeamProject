package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.catalina.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberListDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberListService {
	
	@Inject
	private MemberListDAO memberListDAO;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) {
		System.out.println("getmemberList");
		return memberListDAO.getmemberList(memberDTO);
	}
	
}
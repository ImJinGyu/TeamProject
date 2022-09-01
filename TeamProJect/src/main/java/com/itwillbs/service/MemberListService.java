package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.catalina.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberListDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.QnaDTO;

@Service
public class MemberListService {
//	ㄴ
	@Inject
	private MemberListDAO memberListDAO;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) {
		System.out.println("getmemberList");
		return memberListDAO.getmemberList(memberDTO);
	}
	
	public List<QnaDTO> selectQna(Map<String, Integer> para){
		return memberListDAO.selectQna(para);
	}
	public void updateAnwser(QnaDTO qT) {
		memberListDAO.updateAnwser(qT);
	}
	
	public int qnaCount() {
		return memberListDAO.qnaCount();
	}
}
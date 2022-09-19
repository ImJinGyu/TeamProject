package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.catalina.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberListDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PensionDTO;
import com.itwillbs.domain.QnaDTO;

@Service
public class MemberListService {

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
	
	public int qnaCount(QnaDTO qT) {
		return memberListDAO.qnaCount(qT);
	}
	
	public Map<String ,Object> customCount() {
		return memberListDAO.customCount();
	}
	
	public int pensioncount() {
		return memberListDAO.pensioncount();
	}
	public long paymentsum() {
		return memberListDAO.paymentsum();
	}
	
	public List<Map<String, Object>> selectpay(){
		return memberListDAO.selectpay();
	}
	
	public List<PensionDTO> pensionlist(){
		return memberListDAO.pensionlist();
	}
}
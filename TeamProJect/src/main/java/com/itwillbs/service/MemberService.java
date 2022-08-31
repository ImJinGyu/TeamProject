package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.QnaDTO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO dao;
	
	public void insertMember(MemberDTO mT) {
		dao.insertMember(mT);
	}
	
	public Map<String, String> userlogin(MemberDTO mT) {
		return dao.userlogin(mT);
	}
	
	public Map<String, String> iddup(Map<String ,String> dupMap) {
		return dao.iddup(dupMap);
	}
	
	public void updatePass(MemberDTO mT) {
		dao.updatePass(mT);
	}
	public void updateUser(MemberDTO mT) {
		dao.updateUser(mT);
	}
	
	public Map<String, String> selectUser(MemberDTO mT) {
		return dao.selectUser(mT);
	}
	
	public void deleteUser(MemberDTO mT) {
		dao.deleteUser(mT);
	}
	public void insertqna(QnaDTO qT) {
		dao.insertqna(qT);
	}
	public int selectQnaMaxCount(QnaDTO qT) {
		return dao.selectQnaMaxCount(qT);
	}
	public List<QnaDTO> selectqnalist(MemberDTO mT) {
		return dao.selectqnalist(mT);
	}
}

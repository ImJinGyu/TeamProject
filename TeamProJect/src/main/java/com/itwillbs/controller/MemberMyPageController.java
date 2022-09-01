package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.QnaDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.MemberService;

@Controller
public class MemberMyPageController {
	
	@Inject
	private MemberService service;
	
	
	@RequestMapping(value = "/member/m_myPage", method = RequestMethod.GET)
	public String m_myPage() {
		return "teamProJect/member/m_myPage";
	}
	
	@RequestMapping(value = "/member/passcheck", method = RequestMethod.GET)
	public String passcheck(HttpServletRequest req, Model model) {
		model.addAttribute("type", req.getParameter("type"));
		return "teamProJect/member/passcheck";
		
	}
	
	@RequestMapping(value = "/member/deletecustom", method = RequestMethod.GET)
	public String deletecustom(MemberDTO mT, HttpSession session) {
		String user_id = session.getAttribute("user_id").toString();
		String user_type = session.getAttribute("user_type").toString();
		mT.setUser_id(user_id);
		mT.setUser_type(user_type);
		service.deleteUser(mT);
		session.invalidate();
		return "teamProJect/member/deletecustom";
	}
	
	@RequestMapping(value = "/member/userpasscheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(MemberDTO mT, HttpSession session, HttpServletRequest req, Model model) {
		String formtype = req.getParameter("type");
		
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		Map<String, String> mT2 = service.selectUser(mT);
		model.addAttribute("MemberDTO", mT2);
		
		//API 로그인 회원
		if(mT.getPassword() == null) {
			if(formtype.equals("u")) {
				return "teamProJect/member/modify";
			}else if(formtype.equals("d")){
				return "redirect:/member/deletecustom";
			}
		}
		
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		Map<String, String> userMap = service.userlogin(mT);
		if(mT.getPassword().equals(userMap.get("PASSWORD").toString())) {
			if(formtype.equals("u")) {
				return "teamProJect/member/modify";
			}else if(formtype.equals("d")){
				return "redirect:/member/deletecustom";
			}
			
		}
		req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
		return "teamProJect/member/loginPro";
		
	}
	
	@RequestMapping(value = "/member/updateuser", method = RequestMethod.POST)
	public String updateuser(MemberDTO mT, HttpSession session) {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		service.updateUser(mT);
		return "redirect:/search/main";
	}
	
	@RequestMapping(value = "/member/mypage/listReservation", method = RequestMethod.GET)
	public String listReservation() {
		return "teamProJect/member/mypage/listReservation";
	}
	
	@RequestMapping(value = "/member/mypage/listInquiry", method = RequestMethod.GET)
	public String listInquiry(MemberDTO mT, HttpSession session, Model model) {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		
		List<QnaDTO> qnalist = service.selectqnalist(mT);
		model.addAttribute("list", qnalist);
		return "teamProJect/member/mypage/listInquiry";
	}
	
	@RequestMapping(value = "/member/mypage/qnainput", method = RequestMethod.GET)
	public String qnainput(QnaDTO qT, HttpSession session) {
		
		qT.setUser_id(session.getAttribute("user_id").toString());
		qT.setUser_type(session.getAttribute("user_type").toString());
		qT.setTime(new FunctionClass().nowTime("yyyy-MM-dd HH:mm"));
		qT.setReply("N");
		service.insertqna(qT);
		return "redirect:/member/mypage/listInquiry";
	}
}


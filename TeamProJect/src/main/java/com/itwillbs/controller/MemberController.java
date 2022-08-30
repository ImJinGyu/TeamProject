package com.itwillbs.controller;

import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
				
		return "teamProJect/member/login";
	}
	

	@RequestMapping(value = "/member/loginPro", method = RequestMethod.GET)
	public String loginPro(MemberDTO mT, HttpServletRequest req){
		
		System.out.println(mT.getUser_id());
		System.out.println(mT.getPassword());
		System.out.println(mT.getUser_type());
		Map<String, String> userMap = service.userlogin(mT);
		System.out.println(userMap);
		if(userMap == null) {
			req.setAttribute("msg", "아이디가 존재하지 않습니다.");
			return "teamProJect/member/loginPro";
		}
		if(mT.getPassword().equals(userMap.get("PASSWORD").toString())) {
			HttpSession session = req.getSession();
			session.setAttribute("user_id", mT.getUser_id());
			session.setAttribute("user_type", userMap.get("USER_TYPE"));
			return "redirect:/search/main";
		}
		req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
		return "teamProJect/member/loginPro";
		
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/search/main";
	}
	
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() {
				
		return "teamProJect/member/join";
	}
	
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.GET)
	public String joinPro(MemberDTO mT, HttpServletRequest req) {
		service.insertMember(mT);		
		return "teamProJect/member/joinPro";
	}
	
	@RequestMapping(value = "/member/m_myPage", method = RequestMethod.GET)
	public String m_myPage() {
		return "teamProJect/member/m_myPage";
	}
	
	@RequestMapping(value = "/member/passSearch", method = RequestMethod.GET)
	public String passSearch(HttpServletRequest req, Model model) {
		model.addAttribute("user_type", req.getParameter("user_type"));
		return "teamProJect/member/passSearch";
	}
	
	@RequestMapping(value = "/member/repass", method = RequestMethod.GET)
	public String repass(MemberDTO mT, HttpServletRequest req, Model model) {
		
		mT.setUser_type(req.getParameter("user_type"));
		model.addAttribute("memberDTO", mT);
		return "teamProJect/member/repass";
	}
	
	@RequestMapping(value = "/member/repassPro", method = RequestMethod.POST)
	public String repassPro(MemberDTO mT, HttpServletRequest req) {
		mT.setUser_id(req.getParameter("user_id"));
		mT.setUser_type(req.getParameter("user_type"));
		service.updatePass(mT);
		return "teamProJect/member/repassPro";
	}
	
	// 아이디 중복확인
	@RequestMapping(value = "/member/iddup", method = RequestMethod.GET)
	@ResponseBody
	public String iddup(@RequestParam Map<String ,String> dupMap) {
		
		String id = dupMap.get("user_id");
		String t = dupMap.get("user_type");
		System.out.println(id);
		System.out.println(t);
		
		if(id.equals("")) return "false1";
		if(!(id.contains("@"))) return "false2";
		Map<String, String> uMap = service.iddup(dupMap);
		if(uMap == null) return "true";
		return "false";
	}
	
	@RequestMapping(value = "/member/passcheck", method = RequestMethod.GET)
	public String passcheck() {
		return "teamProJect/member/passcheck";
		
	}
	
	@RequestMapping(value = "/member/modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(MemberDTO mT, HttpSession session, HttpServletRequest req, Model model) {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		System.out.println(mT);
		Map<String, String> mT2 = service.selectUser(mT);
		System.out.println(mT2);
		model.addAttribute("MemberDTO", mT2);
		if(mT.getPassword() == null) return "teamProJect/member/modify";
		
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		Map<String, String> userMap = service.userlogin(mT);
		if(mT.getPassword().equals(userMap.get("PASSWORD").toString())) {
			return "teamProJect/member/modify";
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
}


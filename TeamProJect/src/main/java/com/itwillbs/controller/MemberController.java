package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
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
	
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() {
				
		return "teamProJect/member/join";
	}
	
	
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.GET)
	public String joinPro(MemberDTO mT, HttpServletRequest req) {
		service.insertMember(mT);		
		return "teamProJect/member/joinPro";
	}
//	
	// 아이디 중복확인
	@RequestMapping(value = "/member/iddup", method = RequestMethod.GET)
	@ResponseBody
	public String iddup(@RequestParam Map<String ,String> dupMap) {
		String id = dupMap.get("user_id");
		if(id.equals("")) return "false1";
		if(!(id.contains("@"))) return "false2";
		Map<String, String> uMap = service.iddup(dupMap);
		if(uMap == null) return "true";
		return "false";
	}
}

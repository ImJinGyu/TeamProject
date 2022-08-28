package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.KakaoService;
import com.itwillbs.service.MemberService;

@Controller
public class API_loginContrller {
	
	@Inject
	private MemberService service;
	private final static String _naver = "_naverAPIlogin";
	private final static String _kakao = "_kakaoAPIlogin";
	
	@RequestMapping(value = "/apilogin/api_naver_login", method = RequestMethod.GET)
	public String naverloginAPI() {
		return "teamProJect/apilogin/api_naver_login";
	}
	
	@RequestMapping(value = "/apilogin/itwillnaverlogin", method = RequestMethod.GET)
	public String naver_callback(HttpSession session) {
		return "teamProJect/apilogin/naver_login_callback";
	}
	
	@RequestMapping(value = "/apilogin/naverlogin", method = RequestMethod.GET)
	public String naverlogin(HttpServletRequest req, HttpSession session) {
		
		String user_id = req.getParameter("user_id").concat(_naver);
		String user_name = req.getParameter("user_name");
		String user_type = req.getParameter("user_type");
		
		
		Map<String, String> userMap = new HashMap<String, String>();
		userMap.put("user_id", user_id);
		userMap.put("user_name", user_name);
		userMap.put("user_type", user_type);
		MemberDTO mT = newMemberDTO(user_id, user_name, user_type);
		
		Map<String, String> uMap = service.iddup(userMap);
		if(uMap == null) service.insertMember(mT);
		sessionSet(session, user_id, user_type);
		return "redirect:/search/main";
	}
	
	@RequestMapping(value = "/apilogin/kakao_login", method = RequestMethod.GET)
	public String kakao_callback(String code, HttpSession session) throws Exception{
		KakaoService kakaoservice = new KakaoService();
		String token = kakaoservice.getToken(code);
		Map<String, String> kakaoMap = kakaoservice.getUserInfo(token);
		
		String user_id = kakaoMap.get("user_id") + _kakao;
		String user_name = kakaoMap.get("user_name");
		String user_type = kakaoMap.get("user_type");
		
		kakaoMap.put("user_id", user_id);
		
		Map<String, String> uMap = service.iddup(kakaoMap);
		MemberDTO mT = newMemberDTO(user_id, user_name, user_type);
		
		if(uMap == null) service.insertMember(mT);
		sessionSet(session, user_id, user_type);
		return "redirect:/search/main";
	}
	
	private void sessionSet(HttpSession session, String user_id, String user_type) {
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_type", user_type);
	}
	private MemberDTO newMemberDTO(String user_id, String user_name, String user_type) {
		MemberDTO mT = new MemberDTO();
		mT.setUser_id(user_id);
		mT.setUser_name(user_name);
		mT.setUser_type(user_type);
		return mT;
	}
}

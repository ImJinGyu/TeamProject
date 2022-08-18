package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.TotalDTO;
import com.itwillbs.service.Service1;

@Controller
public class Controllor {
	
	@Inject
	private Service1 service1;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		TotalDTO dto = new TotalDTO();
		
		dto.arr = service1.select();
		System.out.println(dto.arr.get(0));
		JSONObject o = new JSONObject(dto.arr.get(0));
		System.out.println(o);
		return "teamProJect/test";
	}
	
	@RequestMapping(value = "/Test5", method = RequestMethod.GET)
	public String test5() {

		return "redirect:/test";
	}
}

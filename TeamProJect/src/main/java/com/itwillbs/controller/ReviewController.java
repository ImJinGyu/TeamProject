package com.itwillbs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.ReviewService;


@Controller
public class ReviewController {
	
	@Inject
	private ReviewService service;
	private static final String uploadPath = "D:\\TeamProject\\TeamProJect\\src\\main\\webapp\\resources\\images\\reviewimage";

	
	@ResponseBody
	@RequestMapping(value = "/search/reviewimagePro", method = RequestMethod.POST)
	public void reviewimagePro(@RequestParam("files") ArrayList<MultipartFile> filelist) throws Exception{
		
	    for (MultipartFile file : filelist) {
	    	UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + file.getOriginalFilename();
			File uploadfile = new File(uploadPath,filename);
			FileCopyUtils.copy(file.getBytes(), uploadfile);
			service.insertimage(filename);
			
		}
	}
	
	@RequestMapping(value = "/search/reviewPro", method = RequestMethod.POST)
	public String reviewPro(ReviewDTO rT) {
		System.out.println(123);
		int count = service.reviewcount();
		rT.setRev_num(count);
		rT.setRev_date(new FunctionClass().nowTime("yyyy-MM-dd"));
		System.out.println(rT);
		service.insertreview(rT);
		return "redirect:/search/main";
	}
	
//	@RequestMapping(value = "/review", method = RequestMethod.GET)
//	public String test(Model model) throws Exception{
//		String pen_id = "1";
//		Map<String, Object> avg = service.staravg(pen_id);
//		model.addAttribute("avg", avg);
//		
//		List<ReviewDTO> rList = service.selectreviewlist(pen_id);
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		for (ReviewDTO dto : rList) {
//			Date nowdate = formatter.parse(new FunctionClass().nowTime("yyyy-MM-dd"));
//			int stamp = 24*60*60*1000;
//			
//			
//			if(dto.getRev_date() != null && !("".equals(dto.getRev_date()))) {
//				Date rdate = formatter.parse(dto.getRev_date());
//				Long rt = (nowdate.getTime() - rdate.getTime())  / stamp;
//				if(rt == 0) {
//					dto.setRev_date("ToDay ReView");
//				}else {
//					dto.setRev_date(rt.toString() + "일 전");
//				}
//			}
//			
//			if(dto.getAns_date() != null && !("".equals(dto.getAns_date()))) {
//				Date adate = formatter.parse(dto.getAns_date());
//				Long at = (nowdate.getTime() - adate.getTime())  / stamp;
//				if(at == 0) {
//					dto.setAns_date("ToDay Answer");
//				}else {
//					dto.setAns_date(at.toString() + "일 전");
//				}
//			}
//			
//		}
//		System.out.println(rList);
//		model.addAttribute("List", rList);
//		return "teamProJect/review";
//	}
}

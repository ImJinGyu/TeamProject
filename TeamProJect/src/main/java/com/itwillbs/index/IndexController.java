package com.itwillbs.index;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.TotalDTO;
import com.itwillbs.service.Service1;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;


@Controller
public class IndexController {
	

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home() {
				
		return "teamProJect/main";
	}
	
	
	
	
	
	

	
}

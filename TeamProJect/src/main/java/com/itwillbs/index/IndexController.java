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
	
	

	@RequestMapping(value = "/reservationList/reserveList", method = RequestMethod.GET)
	public String reserveList() {
				
		return "teamProJect/reservationList/reserveList";
	}
	
	
	@RequestMapping(value = "/business/roomInsert", method = RequestMethod.GET)
	public String roomInsert() {
				
		return "teamProJect/business/roomInsert";
	}
	
	@RequestMapping(value = "/business/roomUpdate", method = RequestMethod.GET)
	public String roomUpdate() {
				
		return "teamProJect/business/roomUpdate";
	}
	
	@RequestMapping(value = "/business/roomDelete", method = RequestMethod.GET)
	public String roomDelete() {
				
		return "teamProJect/business/roomDelete";
	}

	
}

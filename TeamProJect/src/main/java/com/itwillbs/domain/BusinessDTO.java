package com.itwillbs.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BusinessDTO {
	
	private String RM_NAME;
	private String deadline;
	private String price;
	private String roomNum;
	
	private String RM_IMAGE;

	public String getRM_NAME() {
		return RM_NAME;
	}
	public void setRM_NAME(String rM_NAME) {
		RM_NAME = rM_NAME;
	}
	public String getRM_IMAGE() {
		return RM_IMAGE;
	}
	public void setRM_IMAGE(String rM_IMAGE) {
		RM_IMAGE = rM_IMAGE;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

}

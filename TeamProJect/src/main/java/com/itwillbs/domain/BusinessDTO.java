package com.itwillbs.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BusinessDTO {
	
	private String PEN_ID;
	private String USER_ID;
	private String PEN_NAME;
	private String PEN_ZIPCODE;
	private String PEN_ADDRESS;
	private String PEN_NUMBER;
	private String PEN_IMAGE;
	private String RM_NAME;
	private String checkin;
	private String checkout;
	private String people;
	private String RM_Price;
	private String RM_IMAGE;
	

	public String getPEN_NAME() {
		return PEN_NAME;
	}
	public void setPEN_NAME(String pEN_NAME) {
		PEN_NAME = pEN_NAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPEN_NUMBER() {
		return PEN_NUMBER;
	}
	public void setPEN_NUMBER(String pEN_NUMBER) {
		PEN_NUMBER = pEN_NUMBER;
	}
	public String getPEN_ID() {
		return PEN_ID;
	}
	public void setPEN_ID(String pEN_ID) {
		PEN_ID = pEN_ID;
	}

	public String getPEN_ZIPCODE() {
		return PEN_ZIPCODE;
	}
	public void setPEN_ZIPCODE(String pEN_ZIPCODE) {
		PEN_ZIPCODE = pEN_ZIPCODE;
	}
	public String getPEN_ADDRESS() {
		return PEN_ADDRESS;
	}
	public void setPEN_ADDRESS(String pEN_ADDRESS) {
		PEN_ADDRESS = pEN_ADDRESS;
	}
	public String getPEN_IMAGE() {
		return PEN_IMAGE;
	}
	public void setPEN_IMAGE(String pEN_IMAGE) {
		PEN_IMAGE = pEN_IMAGE;
	}
	public String getRM_NAME() {
		return RM_NAME;
	}
	public void setRM_NAME(String rM_NAME) {
		RM_NAME = rM_NAME;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getRM_Price() {
		return RM_Price;
	}
	public void setRM_Price(String rM_Price) {
		RM_Price = rM_Price;
	}
	public String getRM_IMAGE() {
		return RM_IMAGE;
	}
	public void setRM_IMAGE(String rM_IMAGE) {
		RM_IMAGE = rM_IMAGE;
	}
	
	
	

}

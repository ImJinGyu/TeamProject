package com.itwillbs.domain;

public class ReservationDTO {
	
	private String res_number;
	private String user_id;
	private String pen_id;
	private String check_in_d;
	private String check_out_d;
	private String check_in_t;
	private String check_out_t;
	private String res_time;
	
	public String getRes_number() {
		return res_number;
	}
	public void setRes_number(String res_number) {
		this.res_number = res_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPen_id() {
		return pen_id;
	}
	public void setPen_id(String pen_id) {
		this.pen_id = pen_id;
	}
	public String getCheck_in_d() {
		return check_in_d;
	}
	public void setCheck_in_d(String check_in_d) {
		this.check_in_d = check_in_d;
	}
	public String getCheck_out_d() {
		return check_out_d;
	}
	public void setCheck_out_d(String check_out_d) {
		this.check_out_d = check_out_d;
	}
	public String getCheck_in_t() {
		return check_in_t;
	}
	public void setCheck_in_t(String check_in_t) {
		this.check_in_t = check_in_t;
	}
	public String getCheck_out_t() {
		return check_out_t;
	}
	public void setCheck_out_t(String check_out_t) {
		this.check_out_t = check_out_t;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	
	@Override
	public String toString() {
		return "ReservationDTO [res_number=" + res_number + ", user_id=" + user_id + ", pen_id=" + pen_id
				+ ", check_in_d=" + check_in_d + ", check_out_d=" + check_out_d + ", check_in_t=" + check_in_t
				+ ", check_out_t=" + check_out_t + ", res_time=" + res_time + "]";
	}
	
}

	// BookDTO -> ReservationDTO 수정_정우
//public class BookDTO {
//	
//	private String RES_NUMBER;
//	private String USER_ID; 
//	private String PEN_ID;
//	private String CHECK_IN;
//	private String CHECK_OUT;
//	private String RES_TIME;
//	
//	
//	public String getRES_NUMBER() {
//		return RES_NUMBER;
//	}
//	public void setRES_NUMBER(String rES_NUMBER) {
//		RES_NUMBER = rES_NUMBER;
//	}
//	public String getUSER_ID() {
//		return USER_ID;
//	}
//	public void setUSER_ID(String uSER_ID) {
//		USER_ID = uSER_ID;
//	}
//	public String getPEN_ID() {
//		return PEN_ID;
//	}
//	public void setPEN_ID(String pEN_ID) {
//		PEN_ID = pEN_ID;
//	}
//	public String getCHECK_IN() {
//		return CHECK_IN;
//	}
//	public void setCHECK_IN(String cHECK_IN) {
//		CHECK_IN = cHECK_IN;
//	}
//	public String getCHECK_OUT() {
//		return CHECK_OUT;
//	}
//	public void setCHECK_OUT(String cHECK_OUT) {
//		CHECK_OUT = cHECK_OUT;
//	}
//	public String getRES_TIME() {
//		return RES_TIME;
//	}
//	public void setRES_TIME(String rES_TIME) {
//		RES_TIME = rES_TIME;
//	}
//	
//	
	


package com.cafeHi.www.user.dto;


public class UserDTO {
	private String user_seq;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_contact;
	private String user_email_id; // 계정 찾기 목적
	private String user_email_address; // 계정 찾기 목적
	private String user_road_address;
	private String user_jibun_address;
	private String user_detail_address;
	
	


	public UserDTO() {
	
	}




	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_id() {
		return user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_contact() {
		return user_contact;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	
	public String getUser_detail_address() {
		return user_detail_address;
	}


	public void setUser_detail_address(String user_detail_address) {
		this.user_detail_address = user_detail_address;
	}


	public String getUser_road_address() {
		return user_road_address;
	}


	public String getUser_jibun_address() {
		return user_jibun_address;
	}


	public void setUser_road_address(String user_road_address) {
		this.user_road_address = user_road_address;
	}


	public void setUser_jibun_address(String user_jibun_address) {
		this.user_jibun_address = user_jibun_address;
	}

	public String getUser_email_id() {
		return user_email_id;
	}


	public String getUser_email_address() {
		return user_email_address;
	}


	public void setUser_email_id(String user_email_id) {
		this.user_email_id = user_email_id;
	}


	public void setUser_email_address(String user_email_address) {
		this.user_email_address = user_email_address;
	}




	@Override
	public String toString() {
		return "UserDTO [user_seq=" + user_seq + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_contact=" + user_contact + ", user_email_id=" + user_email_id
				+ ", user_email_address=" + user_email_address + ", user_road_address=" + user_road_address
				+ ", user_jibun_address=" + user_jibun_address + ", user_detail_address=" + user_detail_address + "]";
	}






	



	
	
	
}

package com.cafeHi.www.member.dto;

import java.util.List;

import lombok.Data;

@Data
public class AdminDTO {

	private int admin_code;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_contact;
	private String admin_email;
	private String enabled;
	private List<AdminAuthDTO> authList;
	
}

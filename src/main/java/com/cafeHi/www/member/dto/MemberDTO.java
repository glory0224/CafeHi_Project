package com.cafeHi.www.member.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO implements Serializable{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int member_code;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_contact;
	private String member_email; // 계정 찾기 목적
	private String member_road_address;
	private String member_jibun_address;
	private String member_detail_address;
	private boolean enabled;
	private List<MemberAuthDTO> authList;
}

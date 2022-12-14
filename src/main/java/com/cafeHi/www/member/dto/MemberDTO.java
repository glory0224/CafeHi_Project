package com.cafeHi.www.member.dto;

import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	private String member_seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_contact;
	private String member_email; // ���� ã�� ����
	private String member_road_address;
	private String member_jibun_address;
	private String member_detail_address;
	private boolean enabled;
	private List<AuthDTO> authList;
}
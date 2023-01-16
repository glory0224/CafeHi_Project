package com.cafeHi.www.member.dto;

import lombok.Data;

@Data
public class MemberAuthDTO {
	private int member_auth_code;
	private int member_code;
	private String auth;
}

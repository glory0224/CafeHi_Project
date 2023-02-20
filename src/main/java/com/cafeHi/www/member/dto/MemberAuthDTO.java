package com.cafeHi.www.member.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberAuthDTO {
	private int member_auth_code; // 사용자 정보 권한 코드 
	private int member_code; // 사용자 코드 
	private String member_auth; // 스프링 시큐리티 사용자 권한 : ROLE_USER, ROLE_ADMIN ...
	private LocalDateTime member_auth_writetime; // 사용자 정보 권한 등록일
	private LocalDateTime member_auth_updatetime; // 사용자 정보 권한 수정일
}

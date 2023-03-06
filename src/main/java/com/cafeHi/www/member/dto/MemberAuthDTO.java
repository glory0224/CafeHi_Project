package com.cafeHi.www.member.dto;

import java.time.LocalDateTime;

import com.cafeHi.www.member.MemberAuthName;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class MemberAuthDTO {
	private int member_auth_code; // ����� ���� ���� �ڵ� 
	private int member_code; // ����� �ڵ� 
	private String member_auth; // ������ ��ť��Ƽ ����� ���� : ROLE_USER, ROLE_ADMIN ...
	private LocalDateTime member_auth_writetime; // ����� ���� ���� �����
	private LocalDateTime member_auth_updatetime; // ����� ���� ���� ������

	
	// ��� ���� ���� �޼���
		public void setMemberAuthInfo() {
			this.member_auth = MemberAuthName.ROLE_USER.toString();
			this.member_auth_writetime = LocalDateTime.now();
			this.member_auth_updatetime = LocalDateTime.now();
		}
		
	// ��� ���� ���� �޼���
		public void updateMemberAuthTime(String memberAuthName) {
			this.member_auth = memberAuthName;
			this.member_auth_updatetime = LocalDateTime.now();
		}
	
}

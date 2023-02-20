package com.cafeHi.www.member.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberAuthDTO {
	private int member_auth_code; // ����� ���� ���� �ڵ� 
	private int member_code; // ����� �ڵ� 
	private String member_auth; // ������ ��ť��Ƽ ����� ���� : ROLE_USER, ROLE_ADMIN ...
	private LocalDateTime member_auth_writetime; // ����� ���� ���� �����
	private LocalDateTime member_auth_updatetime; // ����� ���� ���� ������
}

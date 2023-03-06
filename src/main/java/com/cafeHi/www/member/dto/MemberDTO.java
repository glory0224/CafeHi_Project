package com.cafeHi.www.member.dto;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int member_code;  // ����� �ڵ�(�⺻Ű)
	private int member_auth_code; // ����� ���� �ڵ� 
	private String member_id; // ����� ���̵�
	private String member_pw; // ����� ��й�ȣ
	private String member_name; // ����� �̸� 
	private String member_contact; // ����� ����ó
	private String member_email; // ����� ���� ������ �̸���
	private String member_road_address; // ����� ���θ� �ּ� 
	private String member_jibun_address; // ����� ���� �ּ�
	private String member_detail_address; // ����� �� �ּ� 
	private boolean enabled; // ������ ��ť��Ƽ ���� ��� ����
	private LocalDateTime member_writetime; // ����� �����
	private LocalDateTime member_updatetime; // ����� ������
	private List<MemberAuthDTO> authList; // ���� ����Ʈ 
	
	public void setMemberDateTime() {
		this.member_writetime = LocalDateTime.now(); 
		this.member_updatetime = LocalDateTime.now();
	}
	
}

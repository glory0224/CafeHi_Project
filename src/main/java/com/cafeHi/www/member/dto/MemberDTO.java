package com.cafeHi.www.member.dto;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class MemberDTO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int member_code;  // 사용자 코드(기본키)
	private String member_id; // 사용자 아이디
	private String member_pw; // 사용자 비밀번호
	private String member_name; // 사용자 이름 
	private String member_contact; // 사용자 연락처
	private String member_email; // 사용자 계정 인증용 이메일
	private String member_road_address; // 사용자 도로명 주소 
	private String member_jibun_address; // 사용자 지번 주소
	private String member_detail_address; // 사용자 상세 주소 
	private boolean enabled; // 스프링 시큐리티 권한 사용 여부
	private LocalDateTime member_writetime; // 사용자 등록일
	private LocalDateTime member_updatetime; // 사용자 수정일
	private List<MemberAuthDTO> authList; // 권한 리스트 
	
	
	
	
	
	public void setMemberDateTime() {
		this.member_writetime = LocalDateTime.now(); 
		this.member_updatetime = LocalDateTime.now();
	}
	
	public void updateMemberDateTime() {
		this.member_updatetime = LocalDateTime.now();
	}
	
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public void setMember_contact(String member_contact) {
		this.member_contact = member_contact;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public void setMember_road_address(String member_road_address) {
		this.member_road_address = member_road_address;
	}

	public void setMember_jibun_address(String member_jibun_address) {
		this.member_jibun_address = member_jibun_address;
	}

	public void setMember_detail_address(String member_detail_address) {
		this.member_detail_address = member_detail_address;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public MemberDTO(String member_id, String member_pw, String member_name, String member_contact, String member_email,
			String member_road_address, String member_jibun_address, String member_detail_address, boolean enabled,
			LocalDateTime member_writetime, LocalDateTime member_updatetime) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_contact = member_contact;
		this.member_email = member_email;
		this.member_road_address = member_road_address;
		this.member_jibun_address = member_jibun_address;
		this.member_detail_address = member_detail_address;
		this.enabled = enabled;
		this.member_writetime = member_writetime;
		this.member_updatetime = member_updatetime;
	}


	
}

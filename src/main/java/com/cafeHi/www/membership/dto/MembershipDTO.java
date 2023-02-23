package com.cafeHi.www.membership.dto;

import java.time.LocalDateTime;

import com.cafeHi.www.membership.MembershipGrade;

import lombok.Data;

@Data
public class MembershipDTO {
	
	private int membership_code;
	private int member_code;
	private String membership_grade;
	private int membership_point;
	private int membership_update_point;
	private LocalDateTime membership_writetime;
	private LocalDateTime membership_updatetime;
	
	
	// MyBatis data bind 과정에서 데이터 모델의 필드 순서가 다를떄 에러가 발생하는데
	// 해결 방법은  인수가 없는 생성자를 추가하면됨. 
	public MembershipDTO() {
		super();
	}
	
	public MembershipDTO(int member_code, String membership_grade, int membership_point,
			LocalDateTime membership_writetime, LocalDateTime membership_updatetime) {
		super();
		this.member_code = member_code;
		this.membership_grade = membership_grade;
		this.membership_point = membership_point;
		this.membership_writetime = membership_writetime;
		this.membership_updatetime = membership_updatetime;
	}




	
	
	
	
	
	
}

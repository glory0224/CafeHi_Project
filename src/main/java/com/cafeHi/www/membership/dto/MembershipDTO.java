package com.cafeHi.www.membership.dto;

import java.time.LocalDateTime;

import com.cafeHi.www.membership.MembershipGrade;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MembershipDTO {
	
	private int membership_code;
	private int member_code;
	private String membership_grade;
	private int membership_point;
	private int membership_new_point;
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


	// 회원 멤버쉽 정보 설정 메서드
		public void setMembershipInfo(int member_code) {
			this.member_code = member_code;
			this.membership_grade = MembershipGrade.STANDARD.toString();
			this.membership_point = 0;
			this.membership_writetime = LocalDateTime.now();
			this.membership_updatetime = LocalDateTime.now();
		}

		
		// 회원 멤버쉽 정보 수정 메서드 
		public void updateMembershipInfo(String membershipGradeName, int totalPoint) {
			this.membership_grade = membershipGradeName;
			this.membership_point = totalPoint;
			this.membership_updatetime = LocalDateTime.now();
		}

		// 자동 주입 받을 대상에 대한 setter
		
		public void setMembership_point(int membership_point) {
			this.membership_point = membership_point;
		}

		public void setMembership_new_point(int membership_new_point) {
			this.membership_new_point = membership_new_point;
		}

		public void setMember_code(int member_code) {
			this.member_code = member_code;
		}
		
		
	
}

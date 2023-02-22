package com.cafeHi.www.membership.service;


import org.springframework.stereotype.Service;

import com.cafeHi.www.membership.dao.membershipDAO;
import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipImpl implements MembershipService{

	private final membershipDAO membershipDAO;
	
	
	@Override
	public void insertMembership(MembershipDTO member) {
		
		membershipDAO.insertMembership(member);
		
	}

	@Override
	public MembershipDTO getMembership(int member_code) {
		
		
		
		return membershipDAO.getMembership(member_code);
	}

	@Override
	public void plusMembershipPoint(Long point) {
		
		membershipDAO.plusMembershipPoint(point);
	}
	
	
	//멤버쉽 계산 메소드
	
	public long CalMembershipPoint() {
		
		// 비지니스 로직
		
		// 멤버쉽 등급 
		
		// VIP = 주문한 메뉴 가격의 20%를 point 적립
		
		// Gold = 주문한 메뉴 가격의 15%를 point 적립
		
		// Silver = 주문한 메뉴 가격의 10%를 point 적립
		
		// Standard = 주문한 메뉴 가격의 5%를 point 적립
		
		
		// 필요한 매개변수
		
		// member_code -> order 정보 -> orderMenu 정보 -> 메뉴 총 금액 * (등급별 % 적용) ? 
		
		
		long num = 100L;
		
		return num;
		
	}

	

}

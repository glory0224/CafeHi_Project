package com.cafeHi.www.membership.service;


import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

public interface MembershipService {

	public void insertMembership(MemberDTO member);
	public myMembershipDTO getMembership(int member_code);
	
	public void plusMembershipPoint(Long point);
	
}

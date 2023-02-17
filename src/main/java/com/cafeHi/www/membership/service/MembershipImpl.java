package com.cafeHi.www.membership.service;


import org.springframework.stereotype.Service;

import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dao.membershipDAO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipImpl implements MembershipService{

	private final membershipDAO membershipDAO;
	
	
	@Override
	public void insertMembership(MemberDTO member) {
		
		membershipDAO.insertMembership(member);
		
	}

	@Override
	public myMembershipDTO getMembership(int member_code) {
		
		
		
		return membershipDAO.getMembership(member_code);
	}

	@Override
	public void plusMembershipPoint(Long point) {
		// TODO Auto-generated method stub
		
	}

	

}

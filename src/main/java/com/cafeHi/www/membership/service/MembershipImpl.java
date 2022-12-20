package com.cafeHi.www.membership.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dao.membershipDAO;
import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

@Service
public class MembershipImpl implements MembershipService{

	@Autowired
	membershipDAO membershipDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public void insertMembership(MemberDTO member) {
		
		membershipDAO.insertMembership(member);
		
	}

	@Override
	public myMembershipDTO getMembership(String member_id) {
		
		
		
		return membershipDAO.getMembership(member_id);
	}

	

}

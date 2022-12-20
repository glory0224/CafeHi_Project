package com.cafeHi.www.membership.service;

import java.util.List;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

public interface MembershipService {

	public void insertMembership(MemberDTO member);
	public myMembershipDTO getMembership(String member_id);
}

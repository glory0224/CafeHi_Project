package com.cafeHi.www.membership.service;


import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

public interface MembershipService {

	public void insertMembership(MembershipDTO membership);
	public MembershipDTO getMembership(int member_code);
	
	public void updateMembershipPoint(MembershipDTO membership);
	
	public void minusMembershipPoint(MembershipDTO getMembership, orderMenuDTO orderMenu);
	
	
}

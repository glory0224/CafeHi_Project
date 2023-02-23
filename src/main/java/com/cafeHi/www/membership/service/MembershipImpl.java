package com.cafeHi.www.membership.service;


import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import com.cafeHi.www.membership.MembershipGrade;
import com.cafeHi.www.membership.dao.membershipDAO;
import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
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
	public void updateMembershipPoint(MembershipDTO membership) {
		
		// ���ο� ����Ʈ + ���� ����Ʈ
		int totalPoint =  membership.getMembership_new_point() + membership.getMembership_point();
		
		log.info("totalPoint = {}", totalPoint);
		
		// ȸ�� Grade ���� ���� 

		
		if (MembershipGrade.STANDARD.getBasePoint() <= totalPoint && totalPoint < MembershipGrade.SILVER.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.STANDARD.getGrade());
		}
		
		if (MembershipGrade.SILVER.getBasePoint() <= totalPoint && totalPoint < MembershipGrade.GOLD.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.SILVER.getGrade());
		}
		
		if (MembershipGrade.GOLD.getBasePoint() <= totalPoint && totalPoint < MembershipGrade.VIP.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.GOLD.getGrade());
		}
		
		if (MembershipGrade.VIP.getBasePoint() <= totalPoint) {
			membership.setMembership_grade(MembershipGrade.VIP.getGrade());
		}

		
		log.info("MembershipGrade = {}", membership.getMembership_grade());
		
		membership.setMembership_point(totalPoint);
		
		log.info("total membership point = {}", membership.getMembership_point());
		
		// ����Ʈ ���� ��¥ ����
		membership.setMembership_updatetime(LocalDateTime.now());
		
		membershipDAO.updateMembershipPoint(membership);
	}


	

}

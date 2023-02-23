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
		
		
		
		int updatePoint = membership.getMembership_update_point();
		int myPoint = membership.getMembership_point();
		
		log.info("updatePoint = {}" , updatePoint);
		log.info("myPoint = {}" , myPoint);
		
		// 회원 Grade 변경 로직 
		
		if (myPoint + updatePoint >= MembershipGrade.VIP.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.VIP.getGrade());
		}
		else if (myPoint + updatePoint >= MembershipGrade.GOLD.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.GOLD.getGrade());
		}
		else if (myPoint + updatePoint >= MembershipGrade.SILVER.getBasePoint()) {
			membership.setMembership_grade(MembershipGrade.SILVER.getGrade());
		}
		
		int totalPoint = updatePoint + myPoint;
		log.info("totalPoint = {}" , totalPoint);
		
		membership.setMembership_point(updatePoint + myPoint);
		
		log.info("total membership point = {}", membership.getMembership_point());
		
		// 포인트 수정 날짜 저장
		membership.setMembership_updatetime(LocalDateTime.now());
		
		membershipDAO.updateMembershipPoint(membership);
	}


	

}

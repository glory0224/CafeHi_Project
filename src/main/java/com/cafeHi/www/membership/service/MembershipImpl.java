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
	
	
	//����� ��� �޼ҵ�
	
	public long CalMembershipPoint() {
		
		// �����Ͻ� ����
		
		// ����� ��� 
		
		// VIP = �ֹ��� �޴� ������ 20%�� point ����
		
		// Gold = �ֹ��� �޴� ������ 15%�� point ����
		
		// Silver = �ֹ��� �޴� ������ 10%�� point ����
		
		// Standard = �ֹ��� �޴� ������ 5%�� point ����
		
		
		// �ʿ��� �Ű�����
		
		// member_code -> order ���� -> orderMenu ���� -> �޴� �� �ݾ� * (��޺� % ����) ? 
		
		
		long num = 100L;
		
		return num;
		
	}

	

}

package com.cafeHi.www.membership.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class membershipDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMembership(MembershipDTO membership) {
		sqlSessionTemplate.insert("MembershipDAO.insertMembership", membership);
	}
	
	public MembershipDTO getMembership(int member_code) {
		
		return sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_code);
		
	}

	public void plusMembershipPoint(Long point) {
		sqlSessionTemplate.insert("MembershipDAO.plusMembershipPoint", point);
	}
	
}

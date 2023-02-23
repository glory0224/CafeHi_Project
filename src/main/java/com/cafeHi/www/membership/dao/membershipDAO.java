package com.cafeHi.www.membership.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class membershipDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMembership(MembershipDTO membership) {
		sqlSessionTemplate.insert("MembershipDAO.insertMembership", membership);
	}
	
	public void updateMembershipPoint(MembershipDTO membership) {
		
		
		sqlSessionTemplate.update("MembershipDAO.updateMembershipPoint", membership);
	}
	
	public MembershipDTO getMembership(int member_code) {
		
		return sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_code);
		
	}

	
	
}

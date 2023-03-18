package com.cafeHi.www.membership.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
public class MembershipDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMembership(MembershipDTO membership) {
		sqlSessionTemplate.insert("MembershipDAO.insertMembership", membership);
	}
	
	public int updateMembershipPoint(MembershipDTO membership) {
		
		return sqlSessionTemplate.update("MembershipDAO.updateMembershipPoint", membership);
	}
	
	public MembershipDTO getMembership(int member_code) {
		
		return sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_code);
		
	}

	public int recoveryPoint(MembershipDTO getMembership) {
		return sqlSessionTemplate.update("MembershipDAO.recoveryMembershipPoint", getMembership);
	}

	
	
}

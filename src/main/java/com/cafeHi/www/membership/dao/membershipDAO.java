package com.cafeHi.www.membership.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class membershipDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMembership(MemberDTO member) {
		sqlSessionTemplate.insert("MembershipDAO.insertMembership", member);
	}
	
	public myMembershipDTO getMembership(int member_code) {
		
		myMembershipDTO result = sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_code);
		
		
		return sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_code);
		
	}

	public void plusMembershipPoint(Long point) {
		sqlSessionTemplate.insert("MembershipDAO.plusMembershipPoint", point);
	}
	
}

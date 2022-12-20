package com.cafeHi.www.membership.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.membership.dto.myMembershipDTO;

@Repository
public class membershipDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMembership(MemberDTO member) {
		sqlSessionTemplate.insert("MembershipDAO.insertMembership", member);
	}
	
	public myMembershipDTO getMembership(String member_id) {
		
		myMembershipDTO result = sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_id);
		
		System.out.println(result);
		return sqlSessionTemplate.selectOne("MembershipDAO.getMembership", member_id);
		
	}
	
}

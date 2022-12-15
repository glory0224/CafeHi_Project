package com.cafeHi.www.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDTO getMemberId(String find_id) {
		if(sqlSessionTemplate.selectOne("MemberDAO.getMemberId", find_id) != null) {
			
			return sqlSessionTemplate.selectOne("MemberDAO.getMemberId", find_id);
		}
			return null;
		
	}
	
	
	
	public int idCheck(String member_id) {
		int result = sqlSessionTemplate.selectOne("MemberDAO.checkId", member_id);
		return result;
	}
	
	
	
	public MemberDTO getMember(MemberDTO member) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", member);
	}
	
	public MemberDTO readMember(String member_id) {
		return sqlSessionTemplate.selectOne("MemberDAO.readMember", member_id);
		
	}
	
	
	public void insertMember(MemberDTO member) {
		System.out.println("DAO 매핑");
		sqlSessionTemplate.insert("MemberDAO.insertMember", member);
	}
	

	public void insertMemberAuth(AuthDTO memberauth) {
		sqlSessionTemplate.insert("MemberDAO.insertMemberAuth", memberauth);
	}
	

	public void updateMember(MemberDTO member) {
		System.out.println("업데이트 매핑");
		sqlSessionTemplate.update("MemberDAO.updateMember", member);;
	}

	public void deleteMember(MemberDTO member) {
		sqlSessionTemplate.delete("MemberDAO.deleteMember", member);
	}

	public void updateMemberId(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberId", member);
	}

	public void updateMemberName(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberName", member);		
	}

	public void updateMemberContact(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberContact", member);
	}

	public void updateMemberAddress(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberAddress", member);		
	}

	public void updateMemberDetailAddress(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberDetailAddress", member);
	}

	public void updateMemberEmail(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.updateMemberEmail", member);
	}



	
	
	
}

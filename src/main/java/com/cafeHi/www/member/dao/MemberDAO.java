package com.cafeHi.www.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDTO getMemberId(MemberDTO member) {
		if(sqlSessionTemplate.selectOne("MemberDAO.getMemberId", member) != null) {
			
			return sqlSessionTemplate.selectOne("MemberDAO.getMemberId", member);
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
		
		sqlSessionTemplate.insert("MemberDAO.insertMember", member);
	}
	

	public void insertMemberAuth(AuthDTO memberauth) {
		sqlSessionTemplate.insert("MemberDAO.insertMemberAuth", memberauth);
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


	
	// 이메일 중복
	public int checkEmail(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkEmail", email);
	}
	
	// 해당하는 이메일의 아이디 찾기
	public MemberDTO findEmailId(MemberDTO member) {
		
		return sqlSessionTemplate.selectOne("MemberDAO.findEmailId", member);
	}
	
	// 이메일을 통한 임시 비밀번호 찾기
	public void findPw(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.findPw", member);
	}
	
}

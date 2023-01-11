package com.cafeHi.www.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAO {
	
	//MyBatis
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	// ȸ�� CRUD
	public MemberDTO getMember(MemberDTO member) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", member);
	}
	
	public MemberDTO readMember(String member_code) {
		return sqlSessionTemplate.selectOne("MemberDAO.readMember", member_code);
		
	}
	
	public void insertMember(MemberDTO member) {
		
		sqlSessionTemplate.insert("MemberDAO.insertMember", member);
	}
	
	public void insertMemberAuth(AuthDTO memberauth) {
		sqlSessionTemplate.insert("MemberDAO.insertMemberAuth", memberauth);
	}
	
	public void deleteMember(int member_code) {
		sqlSessionTemplate.delete("MemberDAO.deleteMember", member_code);
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


	
	// �ߺ� Ȯ��
	public int checkEmail(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkEmail", email);
	}
	
	public int idCheck(String member_id) {
		int result = sqlSessionTemplate.selectOne("MemberDAO.checkId", member_id);
		return result;
	}
	
	// �ش��ϴ� �̸����� ���̵� ã��
	public MemberDTO findEmailId(MemberDTO member) {
		
		return sqlSessionTemplate.selectOne("MemberDAO.findEmailId", member);
	}
	
	// �̸����� ���� �ӽ� ��й�ȣ ã��
	public void findPw(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.findPw", member);
	}
	
}

package com.cafeHi.www.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
public class MemberDAO {
	
	//MyBatis
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	// 회원 CRUD
	public MemberDTO getMember(MemberDTO member) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", member);
	}
	
	public MemberDTO readMember(String member_code) {
		return sqlSessionTemplate.selectOne("MemberDAO.readMember", member_code);
		
	}
	
	public void insertMember(MemberDTO member) {
		
		sqlSessionTemplate.insert("MemberDAO.insertMember", member);
	}
	
	public void insertMemberAuth(MemberAuthDTO memberauth) {
		sqlSessionTemplate.insert("MemberDAO.insertMemberAuth", memberauth);
	}
	
	public void deleteMember(int member_code) {
		sqlSessionTemplate.delete("MemberDAO.deleteMember", member_code);
	}
	
	public void deleteMemberAuth(int member_code) {
		sqlSessionTemplate.delete("MemberDAO.deleteMemberAuth", member_code);
	}

	public int updateMemberName(MemberDTO member) {
		
		return sqlSessionTemplate.update("MemberDAO.updateMemberName", member);		
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


	
	// 중복 확인
	public int checkEmail(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkEmail", email);
	}
	
	public int idCheck(String member_id) {
		int result = sqlSessionTemplate.selectOne("MemberDAO.checkId", member_id);
		return result;
	}
	
	// 해당하는 이메일의 아이디 찾기
	public MemberDTO findEmailId(MemberDTO member) {
		
		return sqlSessionTemplate.selectOne("MemberDAO.findEmailId", member);
	}
	
	// 이메일을 통한 임시 비밀번호 찾기
	public void findPw(MemberDTO member) {
		sqlSessionTemplate.update("MemberDAO.findPw", member);
	}

	public List<MemberDTO> getMemberList(Map<String, Object> auth) {
		return sqlSessionTemplate.selectList("MemberDAO.getMemberList", auth);
	}

	public int getMemberNum(String mem_auth) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMemberNum", mem_auth);
	}

	
	
}

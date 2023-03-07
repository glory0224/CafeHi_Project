package com.cafeHi.www.member.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	
	// 회원 CRUD
	public MemberDTO findMemberById(String member_id);
	public List<MemberDTO> getMemberList(Map<String, Object> auth);
	public int insertMember(MemberDTO member);
	public int insertMemberAuth(MemberAuthDTO memberauth);
	
	public void updateMemberName(MemberDTO member);
	public void updateMemberContact(MemberDTO member);
	public void updateMemberAddress(MemberDTO member);
	public void updateMemberDetailAddress(MemberDTO member);
	public void updateMemberEmail(MemberDTO member);
	
	public void deleteMember(int member_auth_code);	

	// 중복 확인
	public int checkEmail(String email);
	public int idCheck(String member_code);
	
	// 아이디 찾기
	public MemberDTO findEmailId(MemberDTO member);
	
	// 비밀번호 찾기 
	public void findPw(MemberDTO member);
	
	// 회원 리스트 페이징
	public int getMemberNum(String mem_auth);
	
	
	
	
	
}

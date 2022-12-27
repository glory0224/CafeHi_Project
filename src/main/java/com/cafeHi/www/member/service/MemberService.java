package com.cafeHi.www.member.service;

import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	public MemberDTO getMember(MemberDTO member);
	public void insertMemberAuth(AuthDTO memberauth);
	public MemberDTO readMember(String member_id);
	public int idCheck(String member_id);
	
	
	public void insertMember(MemberDTO member);
	public void deleteMember(MemberDTO member);
	
	// 정보수정
	//public void updateMemberId(MemberDTO member);
	public void updateMemberName(MemberDTO member);
	public void updateMemberContact(MemberDTO member);
	public void updateMemberAddress(MemberDTO member);
	public void updateMemberDetailAddress(MemberDTO member);
	public void updateMemberEmail(MemberDTO member);
	
	// 중복 확인
	public int checkEmail(String email);
	
	// 아이디 찾기
	public MemberDTO findEmailId(MemberDTO member);
	public MemberDTO getMemberId(MemberDTO member);
	
	
	
	
	
}

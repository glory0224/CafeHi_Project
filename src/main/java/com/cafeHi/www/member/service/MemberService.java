package com.cafeHi.www.member.service;

import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	public MemberDTO getMemberId(String find_id);
	public MemberDTO getMember(MemberDTO member);
	public MemberDTO readMember(String member_id);
	public int idCheck(String member_id);
	
	
	public void insertMember(MemberDTO member);
	public void updateMember(MemberDTO member);
	public void deleteMember(MemberDTO member);
	
	// ��������
	public void updateMemberId(MemberDTO member);
	public void updateMemberName(MemberDTO member);
	public void updateMemberContact(MemberDTO member);
	public void updateMemberAddress(MemberDTO member);
	public void updateMemberDetailAddress(MemberDTO member);
	public void updateMemberEmail(MemberDTO member);
	
	
	
	
}
package com.cafeHi.www.member.service;

import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	
	// ȸ�� CRUD
	public MemberDTO getMember(MemberDTO member);
	public MemberDTO readMember(String member_code);
	public void insertMember(MemberDTO member);
	public void insertMemberAuth(AuthDTO memberauth);
	public void updateMemberName(MemberDTO member);
	public void updateMemberContact(MemberDTO member);
	public void updateMemberAddress(MemberDTO member);
	public void updateMemberDetailAddress(MemberDTO member);
	public void updateMemberEmail(MemberDTO member);
	public void deleteMember(MemberDTO member);
	

	// �ߺ� Ȯ��
	public int checkEmail(String email);
	public int idCheck(String member_code);
	
	// ���̵� ã��
	public MemberDTO findEmailId(MemberDTO member);
	
	// ��й�ȣ ã�� 
	public void findPw(MemberDTO member);
	
	
	
}

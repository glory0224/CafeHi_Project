package com.cafeHi.www.member.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	
	// ȸ�� CRUD
	public MemberDTO getMember(MemberDTO member);
	public List<MemberDTO> getMemberList(Map<String, Object> auth);
	public MemberDTO readMember(String member_code);
	public void insertMember(MemberDTO member);
	public void insertMemberAuth(MemberAuthDTO memberauth);
	
	public void updateMemberName(MemberDTO member);
	public void updateMemberContact(MemberDTO member);
	public void updateMemberAddress(MemberDTO member);
	public void updateMemberDetailAddress(MemberDTO member);
	public void updateMemberEmail(MemberDTO member);
	
	public void deleteMember(int member_code);
	public void deleteMemberAuth(int member_code);
	

	// �ߺ� Ȯ��
	public int checkEmail(String email);
	public int idCheck(String member_code);
	
	// ���̵� ã��
	public MemberDTO findEmailId(MemberDTO member);
	
	// ��й�ȣ ã�� 
	public void findPw(MemberDTO member);
	
	// ȸ�� ����Ʈ ����¡
	public int getMemberNum(String mem_auth);
	
	
	
	
	
}

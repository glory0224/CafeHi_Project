package com.cafeHi.www.member.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

public interface MemberService {
	
	// ȸ�� CRUD
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

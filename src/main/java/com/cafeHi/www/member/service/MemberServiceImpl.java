package com.cafeHi.www.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Service("memberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberDAO memberDAO;

	
	// ȸ�� CURD 
	
	@Override
	public MemberDTO getMember(MemberDTO member) {
		return memberDAO.getMember(member);
	}


	@Override
	public List<MemberDTO> getMemberList(Map<String, Object> auth) {
		return memberDAO.getMemberList(auth);
	}

	
	@Override
	public MemberDTO readMember(String member_code) {
		return memberDAO.readMember(member_code);
	}

	@Override
	public void insertMember(MemberDTO member) {
		memberDAO.insertMember(member);
	}
	

	@Override
	public void insertMemberAuth(MemberAuthDTO memberauth) {
		memberDAO.insertMemberAuth(memberauth);
	}

	
	@Override
	public void deleteMember(int member_code) {
		memberDAO.deleteMember(member_code);
	}


	@Override
	public void updateMemberName(MemberDTO member) {
		memberDAO.updateMemberName(member);
	}

	@Override
	public void updateMemberContact(MemberDTO member) {
		memberDAO.updateMemberContact(member);
	}

	@Override
	public void updateMemberAddress(MemberDTO member) {
		memberDAO.updateMemberAddress(member);
	}

	@Override
	public void updateMemberDetailAddress(MemberDTO member) {
		memberDAO.updateMemberDetailAddress(member);
	}

	@Override
	public void updateMemberEmail(MemberDTO member) {
		memberDAO.updateMemberEmail(member);
	}
	
	
	// �ߺ� Ȯ��
	@Override
	public int checkEmail(String email) {
		return memberDAO.checkEmail(email);
	}
	
	@Override
	public int idCheck(String member_id) {
		int result = memberDAO.idCheck(member_id);
		return result;
	}

	// ���̵� ã�� 
	
	@Override
	public MemberDTO findEmailId(MemberDTO member) {
		return memberDAO.findEmailId(member);
	}

	// ��й�ȣ ã��
	
	@Override
	public void findPw(MemberDTO member) {
		memberDAO.findPw(member);
	}


	

	// ȸ�� �� 
	

	@Override
	public int getMemberNum(String mem_auth) {
		return memberDAO.getMemberNum(mem_auth);
	}

	

	

	

}

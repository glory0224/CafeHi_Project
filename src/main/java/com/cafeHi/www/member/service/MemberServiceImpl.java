package com.cafeHi.www.member.service;

import org.springframework.stereotype.Service;

import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Service("memberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberDAO memberDAO;

	
	// 회원 CURD 
	
	@Override
	public MemberDTO getMember(MemberDTO member) {
		return memberDAO.getMember(member);
	}
	
	@Override
	public MemberDTO readMember(String member_id) {
		return memberDAO.readMember(member_id);
	}

	@Override
	public void insertMember(MemberDTO member) {
		memberDAO.insertMember(member);
	}
	

	@Override
	public void insertMemberAuth(AuthDTO memberauth) {
		memberDAO.insertMemberAuth(memberauth);
	}

	
	@Override
	public void deleteMember(MemberDTO member) {
		memberDAO.deleteMember(member);
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
	
	
	// 중복 확인
	@Override
	public int checkEmail(String email) {
		return memberDAO.checkEmail(email);
	}
	
	@Override
	public int idCheck(String member_id) {
		int result = memberDAO.idCheck(member_id);
		return result;
	}

	// 아이디 찾기 
	
	@Override
	public MemberDTO findEmailId(MemberDTO member) {
		return memberDAO.findEmailId(member);
	}

	// 비밀번호 찾기
	
	@Override
	public void findPw(MemberDTO member) {
		memberDAO.findPw(member);
	}


	

	

}

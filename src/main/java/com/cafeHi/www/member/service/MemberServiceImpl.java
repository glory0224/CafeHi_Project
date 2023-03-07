package com.cafeHi.www.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service("memberService")
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{

	private final MemberDAO memberDAO;

	
	// 회원 CURD 
	
	@Override
	public MemberDTO findMemberById(String member_id) {
		return memberDAO.findMemberById(member_id);
	}


	@Override
	public List<MemberDTO> getMemberList(Map<String, Object> auth) {
		return memberDAO.getMemberList(auth);
	}

	
	@Override
	public int insertMember(MemberDTO member) {
		
		return memberDAO.insertMember(member);
	}
	

	@Override
	public int insertMemberAuth(MemberAuthDTO memberauth) {
		return memberDAO.insertMemberAuth(memberauth);
	}

	
	@Override
	public void deleteMember(int member_auth_code) {
		memberDAO.deleteMember(member_auth_code);
	}


	@Override
	public void updateMemberName(MemberDTO member) {
		
		int result = memberDAO.updateMemberName(member);
		
		log.info("updateNameResult = {}", result);
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


	

	// 회원 수 
	

	@Override
	public int getMemberNum(String mem_auth) {
		return memberDAO.getMemberNum(mem_auth);
	}



	

	

	

}

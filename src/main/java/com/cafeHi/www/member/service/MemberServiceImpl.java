package com.cafeHi.www.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.AuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberDTO getMemberId(String find_id) {
		if (memberDAO.getMemberId(find_id) != null) {
			return memberDAO.getMemberId(find_id);
		}
		return null;
	}

	@Override
	public MemberDTO getMember(MemberDTO member) {
		return memberDAO.getMember(member);
	}
	
	@Override
	public MemberDTO readMember(String member_id) {
		return memberDAO.readMember(member_id);
	}
	

	@Override
	public int idCheck(String member_id) {
		int result = memberDAO.idCheck(member_id);
		return result;
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

	// 정보 수정
	
//	@Override
//	public void updateMemberId(MemberDTO member) {
//		memberDAO.updateMemberId(member);
//	}

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


	

	

}

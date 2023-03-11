package com.cafeHi.www.member;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cafeHi.www.member.dao.MemberDAO;
import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dao.MembershipDAO;
import com.cafeHi.www.membership.dto.MembershipDTO;

import lombok.Setter;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class MemberTest {
	
	@Setter(onMethod= @__({@Autowired}))
	private MemberDAO memberDAO;
	
	@Setter(onMethod= @__({@Autowired}))
	private MembershipDAO membershipDAO;
	
	@Setter(onMethod= @__({@Autowired}))
	BCryptPasswordEncoder passwordEncoder;
	
	// �׽�Ʈ ���� 
	@Test
	public void insertMemeberTest() {
		
	
		// ��� 50�� �׽�Ʈ 
		for (int i = 1; i < 201; i++) {
			
			
			MemberDTO member = new MemberDTO("user" + i, "user" + i, "user" + i, "0101111-" + i, "testMail" + i + "@Com", "���ѹα� ���θ��ּ�" + i, "���ѹα� �����ּ�" + i, "���ѹα� ��� " + i, true, LocalDateTime.now(), LocalDateTime.now());
			
			member.setMember_pw(passwordEncoder.encode(member.getMember_pw()));
			
			memberDAO.insertMember(member);
			
			int member_code = member.getMember_code();	// MyBatis Ű ��ȯ ��� ���
			
			System.out.println("member_Code = " + member_code);

			MemberAuthDTO memberAuth = new MemberAuthDTO();
			
			memberAuth.setMemberAuthInfo(member_code);
			
			memberDAO.insertMemberAuth(memberAuth);
			
			MembershipDTO membership = new MembershipDTO();
			
			membership.setMembershipInfo(member_code);
			
			membershipDAO.insertMembership(membership);
			
		}
		
		
	}
}

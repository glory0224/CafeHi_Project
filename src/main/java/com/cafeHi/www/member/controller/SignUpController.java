package com.cafeHi.www.member.controller;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;
import com.cafeHi.www.membership.service.MembershipService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class SignUpController {
		
	private final MemberService memberService;
	
	private final MembershipService membershipService;
	
	private final JavaMailSender mailsender;
	
	private final BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("/signup.do")
	public String signUpView() {
		
		return "cafehi_signup";
	}
	
	// ȸ�� ���
		@PostMapping("/insertMember.do")
		public String insertUser(MemberDTO member, MemberAuthDTO memberauth) {
			
			String encodepw = pwdEncoder.encode(member.getMember_pw());
			member.setMember_pw(encodepw);
			// '-'�� �Է��� ������ ��� 
			if(member.getMember_contact().contains("-")) {
				String[] nums = member.getMember_contact().split("-");
				String join_nums = String.join("", nums);
				member.setMember_contact(join_nums);
			}
			
			memberService.insertMember(member);
			MemberDTO getMember = memberService.getMember(member);
		
			memberauth.setMember_code(getMember.getMember_code());
			memberauth.setAuth("ROLE_USER");
			memberService.insertMemberAuth(memberauth);
			membershipService.insertMembership(getMember);
			
			return "cafehi_login";
		}
		
	// ������ ���
		@PostMapping("/insertAdmin.do")
		public String insertAdmin(MemberDTO member, MemberAuthDTO memberauth) {
			String encodepw = pwdEncoder.encode(member.getMember_pw());
			member.setMember_pw(encodepw);
			// '-'�� �Է��� ������ ��� 
			if(member.getMember_contact().contains("-")) {
				String[] nums = member.getMember_contact().split("-");
				String join_nums = String.join("", nums);
				member.setMember_contact(join_nums);
			}
			
			memberService.insertMember(member);
			MemberDTO getMember = memberService.getMember(member);
		
			memberauth.setMember_code(getMember.getMember_code());
			memberauth.setAuth("ROLE_ADMIN");
			memberService.insertMemberAuth(memberauth);
			
			return "cafehi_login";
		}
	
	
	// ���̵� �ߺ�üũ
	@PostMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String member_id) {
		int result = memberService.idCheck(member_id);
		return result;
	}
	
	// �̸��� �ߺ� üũ 
	@PostMapping("/EmailCheck.do")
	public @ResponseBody int EmailCheck(String member_email) {
		int result = memberService.checkEmail(member_email);
		return result;
	}
	
	// �̸��� ���� 
	@GetMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		
		 /* ��(View)�κ��� �Ѿ�� ������ Ȯ�� */
        System.out.println("�̸��� ������ ���� Ȯ��"); 
        System.out.println("������ȣ : " + email);
        
        /* ������ȣ(����) ���� */
        Random random = new Random();
        // 111111 ~ 999999 ������ ���ڸ� ��� ���ؼ� nextInt(888888) + 111111 
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("���� ��ȣ : " + checkNum);
        
        /* �̸��� ������ */
        String setFrom = "CafeHi1004@gmail.com";
        String toMail = email;
        String title = "ȸ�� ���� ���� �̸����Դϴ�.";
        String content = 
        		"Ȩ�������� �湮���ּż� �����մϴ�." +
        		"<br><br>" +
        		"���� ��ȣ�� " + checkNum + "�Դϴ�." +
        		"<br>" +
        		"�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
        
        try {
        MimeMessage message = mailsender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content, true);
        mailsender.send(message);
        
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
	}
	

}

package com.cafeHi.www.member.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class AccountController {
	
	private final MemberService memberService;
	
	private final JavaMailSender mailsender;
	
	private final BCryptPasswordEncoder pwdEncoder;
	
	// ���̵� ã�� ������
	@GetMapping("/idSearch.do")
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	
	
	// ���̵� ã��
	@PostMapping("/idSearch.do")
	public String idSearch(MemberDTO member, Model model) {
		
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "�ش� �̸��Ϸ� ���Ե� ������ �����ϴ�. �̸����� Ȯ�����ּ���.");
			model.addAttribute("url", "idSearch.do");
			return "alert";
		}else {
			
			member = memberService.findEmailId(member);
			
			 /* �̸��� ������ */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "ī������ ���̵� ã�� �̸����Դϴ�.";
	        String content = 
	        		"Ȩ�������� �湮���ּż� �����մϴ�." +
	        		"<br><br>" +
	        		"�ش� ������ ī������ Ȩ�������� ���̵� ã�⸦ ���� ���۵� �����Դϴ�. " + 
	        		"<br>" + "��û�Ͻ� ���� ���̵�� " + member.getMember_id() + "�Դϴ�." +
	        		"<br>" +
	        		"Ȩ�������� ���ż� �α��� ���ּ���!";
	        
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
	        
	        model.addAttribute("msg", "�ش� ���Ϸ� ���̵� �����߽��ϴ�. ������ Ȯ�����ּ���!");
	        model.addAttribute("url", "login.do");
			return "alert";
	        
		}
		
	}
	
	// ��й�ȣ ã�� ������
	@GetMapping("/pwSearch.do")
	public String pwSearchView() {
		
		return "cafehi_pwSearch";
	}
	
	// ��й�ȣ �̸��� ���� ������
	@PostMapping("/pwSearch.do")
	public String pwEmailView(MemberDTO member, Model model) {
//		member = memberService.getMember(member); // ���� ���� �ʿ�
		if(member != null) {
			return "redirect:/pwSearchAuth.do";
		}
		
		model.addAttribute("msg", "�ش��ϴ� ���̵� �������� �ʽ��ϴ�. ���̵� Ȯ�����ּ���.");
	    model.addAttribute("url", "pwSearch.do");
		return "alert";
		
	}
	
	// ��й�ȣ �̸��� ���� ������
	@GetMapping("/pwSearchAuth.do")
	public String pwEmailAuthView() {
		
		return "cafehi_pwSearchAuth";
		
	}
	
	// �̸��Ϸ� ��й�ȣ ã�� 
	@PostMapping("/pwSearchAuth.do")
	public String pwEmailAuth(MemberDTO member, Model model) throws UnsupportedEncodingException {
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "�ش� �̸��Ϸ� ���Ե� ������ �����ϴ�. �̸����� Ȯ�����ּ���.");
			model.addAttribute("url", "pwSearchAuth.do");
			return "alert";
		}else {
			
			member = memberService.findEmailId(member);
			//������ ���ڿ� ���� ���̺귯�� apache commons lang ���
			String generatedString = RandomStringUtils.randomAlphanumeric(10);
			
			String changePw = pwdEncoder.encode(generatedString);
			
			member.setMember_pw(changePw); // ���� ���ڿ� ��й�ȣ set ���� 
			memberService.findPw(member);
					
			 /* �̸��� ������ */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "ī������ ��й�ȣ ã�� �̸����Դϴ�.";
	        String content = 
	        		"Ȩ�������� �湮���ּż� �����մϴ�." +
	        		"<br><br>" +
	        		"�ش� ������ ī������ Ȩ�������� ��й�ȣ ã�⸦ ���� ���۵� �����Դϴ�. " + 
	        		"<br>" + "��û�Ͻ� ������ ���� �߱޵� ��й�ȣ�� " + generatedString + "�Դϴ�." +
	        		"<br>" +
	        		"�α��� ���Ŀ� ���� ��Ź�帳�ϴ�.";
	        
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
	        
	        model.addAttribute("msg", "�ش� ���Ϸ� �ӽ� ��й�ȣ�� �����߽��ϴ�. ������ Ȯ�����ּ���!");
	        model.addAttribute("url", "login.do");
			return "alert";
		}
				
	}
	

	

}

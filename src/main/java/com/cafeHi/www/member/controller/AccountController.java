package com.cafeHi.www.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;


@Controller
public class AccountController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailsender;
	
	
	
	// ���̵� ã�� ������
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.GET)
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	
	// ���̵� ã��
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "/pwSearch.do", method = RequestMethod.GET)
	public String pwSearchView() {
		
		return "cafehi_pwSearch";
	}
	
	// ��й�ȣ �̸��� ���� ������
	@RequestMapping(value="/pwSearch.do", method = RequestMethod.POST)
	public String pwEmailView(MemberDTO member, Model model) {
		member = memberService.getMember(member);
		if(member != null) {
			return "redirect:/pwSearchAuth.do";
		}
		
		model.addAttribute("msg", "�ش��ϴ� ���̵� �������� �ʽ��ϴ�. ���̵� Ȯ�����ּ���.");
	    model.addAttribute("url", "pwSearch.do");
		return "alert";
		
	}
	
	// ��й�ȣ �̸��� ���� ������
	@RequestMapping(value = "/pwSearchAuth.do", method = RequestMethod.GET)
	public String pwEmailAuthView() {
		
		return "cafehi_pwSearchAuth";
		
	}
	
	// ��й�ȣ �̸��� ���� 
	// ���� Spring Security�� ��й�ȣ�� ��ȣȭ �Ǿ� �־� Java�� URLDecoder�� ��ȣȭ�� �õ� ������ ����, ã�ƺ��� ������ ��ť��Ƽ�� ��ȣȭ �� �� ���� ����� match �Լ��� �Է¹��� ��й�ȣ�� �񱳸� �����ϴ�. 
	// �׷��ٸ� ��й�ȣ�� �����ϰ� �������ִ� ����� �̿��ؾ� �ұ�? ��� ��й�ȣ�� ã���ִ��� ����ؾ߰ڴ�. 
	@RequestMapping(value = "/pwSearchAuth.do", method = RequestMethod.POST)
	public String pwEmailAuth(MemberDTO member, Model model) throws UnsupportedEncodingException {
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "�ش� �̸��Ϸ� ���Ե� ������ �����ϴ�. �̸����� Ȯ�����ּ���.");
			model.addAttribute("url", "pwSearchAuth.do");
			return "alert";
		}else {
			member = memberService.findEmailId(member);
			String encodePw = member.getMember_pw();
			System.out.println("encodePw : " + encodePw);
			
				String member_pw = URLDecoder.decode(encodePw, "UTF-8");
			
			 /* �̸��� ������ */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "ī������ ��й�ȣ ã�� �̸����Դϴ�.";
	        String content = 
	        		"Ȩ�������� �湮���ּż� �����մϴ�." +
	        		"<br><br>" +
	        		"�ش� ������ ī������ Ȩ�������� ��й�ȣ ã�⸦ ���� ���۵� �����Դϴ�. " + 
	        		"<br>" + "��û�Ͻ� ������ ��й�ȣ�� " + member_pw + "�Դϴ�." +
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
	        
	        model.addAttribute("msg", "�ش� ���Ϸ� ��й�ȣ�� �����߽��ϴ�. ������ Ȯ�����ּ���!");
	        model.addAttribute("url", "login.do");
			return "alert";
		}
				
	}
	

	

}

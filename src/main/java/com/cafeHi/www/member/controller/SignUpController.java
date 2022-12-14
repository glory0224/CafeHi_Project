package com.cafeHi.www.member.controller;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;


@Controller
@RequestMapping("/all/*")
public class SignUpController {
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailsender;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signUpView() {
		
		return "all/cafehi_signup";
	}
	
	// ȸ�� ���
		@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
		public String insertUser(MemberDTO member) {
			System.out.println(member.getMember_id());
			System.out.println(member.getMember_name());
			System.out.println(member.getMember_road_address());
			
			// '-'�� �Է��� ������ ��� 
			if(member.getMember_contact().contains("-")) {
				String[] nums = member.getMember_contact().split("-");
				String join_nums = String.join("", nums);
				member.setMember_contact(join_nums);
				memberService.insertMember(member);
				return "cafehi_login";
			}
			
			memberService.insertMember(member);
			
			return "all/cafehi_login";
		}
	
	
	// ���̵� �ߺ�üũ
	@RequestMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String user_id) {
		int result = memberService.idCheck(user_id);
		return result;
	}
	
	// �̸��� ���� 
	@RequestMapping(value="/mailCheck.do", method = RequestMethod.GET)
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

package com.cafeHi.www.user.controller;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafeHi.www.user.service.UserService;


@Controller
@RequestMapping("/all/*")
public class SignUpController {
		
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailsender;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signUpView() {
		
		return "all/cafehi_signup";
	}
	
	// ���̵� �ߺ�üũ
	@RequestMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String user_id) {
		int result = userService.idCheck(user_id);
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

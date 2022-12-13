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
	
	// 아이디 중복체크
	@RequestMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String user_id) {
		int result = userService.idCheck(user_id);
		return result;
	}
	
	// 이메일 인증 
	@RequestMapping(value="/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		
		 /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인"); 
        System.out.println("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        // 111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111 
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증 번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "CafeHi1004@gmail.com";
        String toMail = email;
        String title = "회원 가입 인증 이메일입니다.";
        String content = 
        		"홈페이지를 방문해주셔서 감사합니다." +
        		"<br><br>" +
        		"인증 번호는 " + checkNum + "입니다." +
        		"<br>" +
        		"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
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

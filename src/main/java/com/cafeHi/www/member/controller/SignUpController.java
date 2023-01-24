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
	
	// 회원 등록
		@PostMapping("/insertMember.do")
		public String insertUser(MemberDTO member, MemberAuthDTO memberauth) {
			
			String encodepw = pwdEncoder.encode(member.getMember_pw());
			member.setMember_pw(encodepw);
			// '-'을 입력한 정보일 경우 
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
		
	// 관리자 등록
		@PostMapping("/insertAdmin.do")
		public String insertAdmin(MemberDTO member, MemberAuthDTO memberauth) {
			String encodepw = pwdEncoder.encode(member.getMember_pw());
			member.setMember_pw(encodepw);
			// '-'을 입력한 정보일 경우 
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
	
	
	// 아이디 중복체크
	@PostMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String member_id) {
		int result = memberService.idCheck(member_id);
		return result;
	}
	
	// 이메일 중복 체크 
	@PostMapping("/EmailCheck.do")
	public @ResponseBody int EmailCheck(String member_email) {
		int result = memberService.checkEmail(member_email);
		return result;
	}
	
	// 이메일 인증 
	@GetMapping("/mailCheck.do")
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

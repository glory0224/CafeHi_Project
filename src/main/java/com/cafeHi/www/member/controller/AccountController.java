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
	
	// 아이디 찾기 페이지
	@GetMapping("/idSearch.do")
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	
	
	// 아이디 찾기
	@PostMapping("/idSearch.do")
	public String idSearch(MemberDTO member, Model model) {
		
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "해당 이메일로 가입된 계정이 없습니다. 이메일을 확인해주세요.");
			model.addAttribute("url", "idSearch.do");
			return "alert";
		}else {
			
			member = memberService.findEmailId(member);
			
			 /* 이메일 보내기 */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "카페하이 아이디 찾기 이메일입니다.";
	        String content = 
	        		"홈페이지를 방문해주셔서 감사합니다." +
	        		"<br><br>" +
	        		"해당 메일은 카페하이 홈페이지의 아이디 찾기를 통해 전송된 메일입니다. " + 
	        		"<br>" + "요청하신 계정 아이디는 " + member.getMember_id() + "입니다." +
	        		"<br>" +
	        		"홈페이지로 오셔서 로그인 해주세요!";
	        
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
	        
	        model.addAttribute("msg", "해당 메일로 아이디를 전송했습니다. 메일을 확인해주세요!");
	        model.addAttribute("url", "login.do");
			return "alert";
	        
		}
		
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/pwSearch.do")
	public String pwSearchView() {
		
		return "cafehi_pwSearch";
	}
	
	// 비밀번호 이메일 인증 페이지
	@PostMapping("/pwSearch.do")
	public String pwEmailView(MemberDTO member, Model model) {
//		member = memberService.getMember(member); // 로직 수정 필요
		if(member != null) {
			return "redirect:/pwSearchAuth.do";
		}
		
		model.addAttribute("msg", "해당하는 아이디가 존재하지 않습니다. 아이디를 확인해주세요.");
	    model.addAttribute("url", "pwSearch.do");
		return "alert";
		
	}
	
	// 비밀번호 이메일 인증 페이지
	@GetMapping("/pwSearchAuth.do")
	public String pwEmailAuthView() {
		
		return "cafehi_pwSearchAuth";
		
	}
	
	// 이메일로 비밀번호 찾기 
	@PostMapping("/pwSearchAuth.do")
	public String pwEmailAuth(MemberDTO member, Model model) throws UnsupportedEncodingException {
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "해당 이메일로 가입된 계정이 없습니다. 이메일을 확인해주세요.");
			model.addAttribute("url", "pwSearchAuth.do");
			return "alert";
		}else {
			
			member = memberService.findEmailId(member);
			//랜덤한 문자열 생성 라이브러리 apache commons lang 사용
			String generatedString = RandomStringUtils.randomAlphanumeric(10);
			
			String changePw = pwdEncoder.encode(generatedString);
			
			member.setMember_pw(changePw); // 랜덤 문자열 비밀번호 set 주입 
			memberService.findPw(member);
					
			 /* 이메일 보내기 */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "카페하이 비밀번호 찾기 이메일입니다.";
	        String content = 
	        		"홈페이지를 방문해주셔서 감사합니다." +
	        		"<br><br>" +
	        		"해당 메일은 카페하이 홈페이지의 비밀번호 찾기를 통해 전송된 메일입니다. " + 
	        		"<br>" + "요청하신 계정의 새로 발급된 비밀번호는 " + generatedString + "입니다." +
	        		"<br>" +
	        		"로그인 이후에 변경 부탁드립니다.";
	        
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
	        
	        model.addAttribute("msg", "해당 메일로 임시 비밀번호를 전송했습니다. 메일을 확인해주세요!");
	        model.addAttribute("url", "login.do");
			return "alert";
		}
				
	}
	

	

}

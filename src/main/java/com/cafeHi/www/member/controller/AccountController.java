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
	
	
	
	// 아이디 찾기 페이지
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.GET)
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "/pwSearch.do", method = RequestMethod.GET)
	public String pwSearchView() {
		
		return "cafehi_pwSearch";
	}
	
	// 비밀번호 이메일 인증 페이지
	@RequestMapping(value="/pwSearch.do", method = RequestMethod.POST)
	public String pwEmailView(MemberDTO member, Model model) {
		member = memberService.getMember(member);
		if(member != null) {
			return "redirect:/pwSearchAuth.do";
		}
		
		model.addAttribute("msg", "해당하는 아이디가 존재하지 않습니다. 아이디를 확인해주세요.");
	    model.addAttribute("url", "pwSearch.do");
		return "alert";
		
	}
	
	// 비밀번호 이메일 인증 페이지
	@RequestMapping(value = "/pwSearchAuth.do", method = RequestMethod.GET)
	public String pwEmailAuthView() {
		
		return "cafehi_pwSearchAuth";
		
	}
	
	// 비밀번호 이메일 인증 
	// 현재 Spring Security로 비밀번호가 암호화 되어 있어 Java의 URLDecoder로 복호화를 시도 했으나 실패, 찾아보니 스프링 시큐리티는 복호화 할 수 없고 내장된 match 함수로 입력받은 비밀번호와 비교만 가능하다. 
	// 그렇다면 비밀번호를 인증하고 변경해주는 방식을 이용해야 할까? 어떻게 비밀번호를 찾아주는지 고민해야겠다. 
	@RequestMapping(value = "/pwSearchAuth.do", method = RequestMethod.POST)
	public String pwEmailAuth(MemberDTO member, Model model) throws UnsupportedEncodingException {
		String member_email = member.getMember_email();
		
		int result = memberService.checkEmail(member_email);
		
		if(result == 0) {
			model.addAttribute("msg", "해당 이메일로 가입된 계정이 없습니다. 이메일을 확인해주세요.");
			model.addAttribute("url", "pwSearchAuth.do");
			return "alert";
		}else {
			member = memberService.findEmailId(member);
			String encodePw = member.getMember_pw();
			System.out.println("encodePw : " + encodePw);
			
				String member_pw = URLDecoder.decode(encodePw, "UTF-8");
			
			 /* 이메일 보내기 */
	        String setFrom = "CafeHi1004@gmail.com";
	        String toMail = member_email;
	        String title = "카페하이 비밀번호 찾기 이메일입니다.";
	        String content = 
	        		"홈페이지를 방문해주셔서 감사합니다." +
	        		"<br><br>" +
	        		"해당 메일은 카페하이 홈페이지의 비밀번호 찾기를 통해 전송된 메일입니다. " + 
	        		"<br>" + "요청하신 계정의 비밀번호는 " + member_pw + "입니다." +
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
	        
	        model.addAttribute("msg", "해당 메일로 비밀번호를 전송했습니다. 메일을 확인해주세요!");
	        model.addAttribute("url", "login.do");
			return "alert";
		}
				
	}
	

	

}

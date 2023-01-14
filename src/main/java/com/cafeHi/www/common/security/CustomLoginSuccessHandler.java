package com.cafeHi.www.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		
		log.warn("Login Success");
		
		List<String> roleNames =  new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/index.do");
			return;
		}
		
		if (roleNames.contains("ROLE_MEMMBER")) {
			
			response.sendRedirect("/member/*");
			return;
		}
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		Object principal = auth.getPrincipal();
		String name = "";
		
		
		if ( principal instanceof CustomUser ) System.out.println(" CustomerUser 객체 맞음 !! ");
		else System.out.println(" CustomUser 객체 아님.. " + principal.getClass().toString());
		
		if ( principal != null && principal instanceof CustomUser ){
			name = ((CustomUser)principal).getUsername();
			MemberDTO mem = ((CustomUser)principal).getMember();
			System.out.println("road address : " + mem.getMember_road_address());
			System.out.println(" CustomUser에서 가지고온 이름 ! : " + name);
		}else {
			name = (String)principal ;
			System.out.println(" 그냥 String.. ㅜㅜ : " + name);
		}
	
		
		response.sendRedirect("/cafeHi/");
		
		
	}
	
}

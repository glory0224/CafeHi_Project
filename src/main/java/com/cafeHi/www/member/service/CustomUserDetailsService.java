package com.cafeHi.www.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod=@__({@Autowired}))
	private MemberService memberService;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + username);
		
		MemberDTO mem = memberService.readMember(username);
		MemberDTO getMem = memberService.getMember(mem);
		mem.setMember_code(getMem.getMember_code());
		log.warn("queried by member : " + mem);
		
		return mem ==  null ? null : new CustomUser(mem);
	
	}
	

}

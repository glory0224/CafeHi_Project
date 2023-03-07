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
		
		MemberDTO getMem = memberService.findMemberById(username);
		
		log.info("getMem.getMember_writetime = " + getMem.getMember_writetime());
		log.info("getMem.getMember_updatetime = " + getMem.getMember_updatetime());
		
		
		return getMem ==  null ? null : new CustomUser(getMem);
	
	}
	

}

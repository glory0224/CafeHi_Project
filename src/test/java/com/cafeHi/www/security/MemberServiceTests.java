package com.cafeHi.www.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@Transactional
public class MemberServiceTests {
	
	@Setter(onMethod=@__({@Autowired}))
	private MemberService memberService;
	
//	@Test
//	public void testRead() {
//		MemberDTO mem = memberService.readMember("admin90");
//		log.info(mem);
//		
//		mem.getAuthList().forEach(authDTO -> log.info(authDTO));
//	}
}

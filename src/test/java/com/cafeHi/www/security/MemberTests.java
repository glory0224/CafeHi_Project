package com.cafeHi.www.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	
	
	
	@Setter(onMethod= @__({@Autowired}))
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod = @__({@Autowired}))
	private DataSource ds;
	
	// 멤버 테스트 데이터 삽입 
	@Test
	public void testInsertMember() {
		
		String sql = "insert into cafehi_member(member_seq, member_id, member_pw, member_name)"
				+ "values(?,?,?,?)";
		
		for (int i = 0; i < 200; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, i);
				pstmt.setString(3, pwencoder.encode("pw" + i));
				
				if (i < 80) {
					pstmt.setString(2, "user" + i);
					pstmt.setString(4, "일반사용자" + i);
				} else if (i < 90) {
					pstmt.setString(2, "manager" + i);
					pstmt.setString(4, "운영자" + i);
				} else {
					pstmt.setString(2, "admin" + i);
					pstmt.setString(4, "관리자" + i);
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
	}
	
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into cafehi_member_auth(member_id, auth) values (?, ?)";
		
		for(int i = 0; i < 200; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				
				if (i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i < 90) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
			}
		}
	}

	
	
}

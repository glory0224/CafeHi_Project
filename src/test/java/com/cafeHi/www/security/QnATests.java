package com.cafeHi.www.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
public class QnATests {
	
	Date date = new Date();
	long timeInMilliSeconds = date.getTime();
    java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);

	
	@Setter(onMethod = @__({@Autowired}))
	private DataSource ds;
	
	// qna 테스트 데이터 삽입 
	@Test
	public void testInsertQnA() {
		
		
		 
		String sql = "insert into cafehi_qna(qna_num, qna_title, classification, qna_writetime, qna_hit, member_code , qna_content, upload_path, store_file_name, upload_file_name)"
				+"values(?,?,?,?,?,?,?,?,?,?)";
		
		for (int i = 0; i < 200; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, i);	
				// pstmt.setString(2, "테스트용 게시글 제목" + i);
				
				if (i < 80) {
					pstmt.setString(2, "테스트용 유저 게시글 제목" + i);
					pstmt.setString(3, "");
					pstmt.setInt(6, i); // member_code - user
					
				} else if (i < 90) {
					pstmt.setString(2, "테스트용 매니저 게시글 제목" + i);
					pstmt.setString(3, "");
					pstmt.setInt(6, i); // member_code - user
				} else {
					pstmt.setString(2, "테스트용 관리자 게시글 제목" + i);
					pstmt.setString(3, "[업데이트]");
					pstmt.setInt(6, i); // member_code - user
				}
				
				pstmt.setDate(4, sqlDate);
				pstmt.setInt(5, 0); // hit
				
				pstmt.setString(7, "테스트용 게시글 내용" + i);
				pstmt.setString(8, "0"); // upload_path
				pstmt.setString(9, "0"); // store_file_name 
				pstmt.setString(10, "0"); // upload_file_name
				

				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
		
	}
}

package com.cafeHi.www.board.qna;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cafeHi.www.board.qna.dao.QnADAO;
import com.cafeHi.www.board.qna.dto.QnADTO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class QnATest {
	
	@Setter(onMethod= @__({@Autowired}))
	private QnADAO qnADAO;
	
	@Test
	public void insertQnA() {
		for (int i = 1; i < 201; i++) {
			//QnADTO qna = new QnADTO("test User title" + i, "none", "test User content" + i, LocalDateTime.now(), LocalDateTime.now(), 0, "none", "none", "¾øÀ½", i);
			//qnADAO.insertQnA(qna);
		}
	}
}

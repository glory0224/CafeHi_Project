package com.cafeHi.www.board.qna.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.Criteria;
import com.cafeHi.www.common.dto.MemberSearchCriteria;
import com.cafeHi.www.common.dto.SearchCriteria;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class QnADAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<QnADTO> getQnAList(Criteria cri) {
		return sqlSessionTemplate.selectList("QnADAO.getQnAList", cri);
	}

	
	public List<QnADTO> getQnAListSearch(SearchCriteria searchCriteria) {
		
		log.info("startPage= {}", searchCriteria.getRowStart());
		log.info("endPage= {}", searchCriteria.getRowEnd());
		
		return sqlSessionTemplate.selectList("QnADAO.getQnAListSearch", searchCriteria);
	}
	
	public List<QnADTO> getMyQnAListSearch(Map<String, Object> memberQnAMap) {
		return sqlSessionTemplate.selectList("QnADAO.getMyQnAListSearch", memberQnAMap);
	}
	
	
	
	public QnADTO getQnA(QnADTO qna) {
		
		return sqlSessionTemplate.selectOne("QnADAO.getQnA", qna);
	}
	
	public List<QnADTO> getMyQnA(Map<String, Object> infoHash) {
		
		return sqlSessionTemplate.selectList("QnADAO.getMyQnA", infoHash);
	}
	
	
	public List<QnADTO> getAllMemberQnA(Map<String, Object> auth) {
		return sqlSessionTemplate.selectList("QnADAO.MemberAllQnA", auth);
	}
	
	
	// QnA 게시글 개수 관련
	
	public int getQnANum() {
		
		return sqlSessionTemplate.selectOne("QnADAO.getQnANum");
	}
	
	public int getQnASearchNum(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("QnADAO.getQnASearchNum", scri);
	}
	
	public int getMyQnASearchNum(Map<String, Object> memberQnAMap) {
		return sqlSessionTemplate.selectOne("QnADAO.getMyQnASearchNum", memberQnAMap);
	}
	
	public int getMemberQnANum(String role_user) {
		return sqlSessionTemplate.selectOne("QnADAO.getMemberQnANum", role_user);
	}
	
	
	// QnA 게시글 CRUD
	
	public void insertQnA(QnADTO qna) {
		sqlSessionTemplate.insert("QnADAO.insertQnA", qna);
	}

	public void updateQnA(QnADTO qna) {
		
		sqlSessionTemplate.update("QnADAO.updateQnA", qna);
	}
	
	public void deleteQnA(QnADTO qna) {
		sqlSessionTemplate.delete("QnADAO.deleteQnA", qna);
	}
	
	public void updateHit(QnADTO qna) {
		sqlSessionTemplate.update("QnADAO.updateHit", qna);
	}


	




	

	

	

	
}

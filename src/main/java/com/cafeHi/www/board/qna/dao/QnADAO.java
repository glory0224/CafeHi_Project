package com.cafeHi.www.board.qna.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class QnADAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	

	public List<QnADTO> getQnAList(CriteriaDTO cri) {
		
		return sqlSessionTemplate.selectList("QnADAO.getQnAList", cri);
		
		
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
	
	public int getQnANum(CriteriaDTO cri) {
		
		return sqlSessionTemplate.selectOne("QnADAO.getQnANum");
	}
	
	public int getMyQnANum(int member_code) {
		return sqlSessionTemplate.selectOne("QnADAO.getMyQnANum", member_code);
	}
	
	public int getMemberQnANum(String role_user) {
		return sqlSessionTemplate.selectOne("QnADAO.getMemberQnANum", role_user);
	}
	

	public List<QnADTO> getQnAListPaging(CriteriaDTO cri) {
		return sqlSessionTemplate.selectList("QnADAO.getQnAListPaging", cri);
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

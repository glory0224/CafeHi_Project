package com.cafeHi.www.board.qna.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;


@Repository
public class QnADAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	public List<QnADTO> getQnAList(CriteriaDTO cri) {
		List<QnADTO> result = sqlSessionTemplate.selectList("QnADAO.getQnAList", cri);
		System.out.println("result : " + result);
		return sqlSessionTemplate.selectList("QnADAO.getQnAList", cri);
		
		
	}
	
	public QnADTO getQnA(QnADTO qna) {
		
		return sqlSessionTemplate.selectOne("QnADAO.getQnA", qna);
	}
	
	public List<QnADTO> getMyQnA(String member_id) {
		return sqlSessionTemplate.selectList("QnADAO.getMyQnA", member_id);
	}
	
	public int getQnANum(CriteriaDTO cri) {
		
		return sqlSessionTemplate.selectOne("QnADAO.getQnANum");
	}
	

	public List<QnADTO> getQnAListPaging(CriteriaDTO cri) {
		List<QnADTO> result = sqlSessionTemplate.selectList("QnADAO.getQnAListPaging", cri);
		System.out.println("result : " + result); 
		return sqlSessionTemplate.selectList("QnADAO.getQnAListPaging", cri);
	}
	
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

package com.cafeHi.www.board.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeHi.www.board.qna.dao.QnADAO;
import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

@Service("qnaService")
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO qnADAO;



	@Override
	public List<QnADTO> getQnAList(CriteriaDTO cri) {
		
		return qnADAO.getQnAList(cri);
	}


	@Override
	public QnADTO getQnA(QnADTO qna) {
		
		return qnADAO.getQnA(qna);
	}


	@Override
	public void insertQnA(QnADTO qna) {
		qnADAO.insertQnA(qna);
	}

	
	@Override
	public void updateQnA(QnADTO qna) {
		
		qnADAO.updateQnA(qna);
	}


	@Override
	public void deleteQnA(QnADTO qna) {
		qnADAO.deleteQnA(qna);
	}


	@Override
	public int getQnANum(CriteriaDTO cri) {
		return qnADAO.getQnANum(cri);
	}


	@Override
	public void updateHit(QnADTO qna) {
		qnADAO.updateHit(qna);
	}

	


}

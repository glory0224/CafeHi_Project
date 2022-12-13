package com.cafeHi.www.board.qna.service;

import java.util.List;


import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

public interface QnAService {
	
	//게시판 목록
	public List<QnADTO> getQnAList(CriteriaDTO cri);
//	// 페이징 적용 게시판 목록
//	public List<QnADTO> getQnAListPaging(Criteria cri);
	// 게시판 개수
	public int getQnANum(CriteriaDTO cri);
	public QnADTO getQnA(QnADTO qna);
	
	// 게시판 조회수
	public void updateHit(QnADTO qna);
	
	// 게시판 CRUD
	public void insertQnA(QnADTO qna);
	public void updateQnA(QnADTO qna);
	public void deleteQnA(QnADTO qna);
	
	
	
}

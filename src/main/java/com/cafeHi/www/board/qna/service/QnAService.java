package com.cafeHi.www.board.qna.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

public interface QnAService {
	
	// QnA 글 목록
	public List<QnADTO> getQnAList(CriteriaDTO cri);

	// QnA 글 개수
	public int getQnANum(CriteriaDTO cri);
	public QnADTO getQnA(QnADTO qna);
	
	// QnA 글 조회수
	public void updateHit(QnADTO qna);
	
	// QnA 글 CRUD
	public void insertQnA(QnADTO qna);
	public void updateQnA(QnADTO qna);
	public void deleteQnA(QnADTO qna);
	
	// 내 QnA 글 리스트 조회
	public List<QnADTO> getMyQnA(Map<String, Object> infoHash);
	
	// 회원 전체 QnA 글 조회 
	public List<QnADTO> getAllMemberQnA(Map<String, Object> auth);
	
	// 내 QnA 글 개수 
	public int getMyQnANum(int member_code);
	
	// 회원 전체 QnA 글 개수
	public int getMemberQnANum(String role_user);

	
	
	
	
}

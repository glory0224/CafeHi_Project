package com.cafeHi.www.board.qna.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.Criteria;
import com.cafeHi.www.common.dto.MemberSearchCriteria;
import com.cafeHi.www.common.dto.SearchCriteria;

public interface QnAService {
	
	// QnA 글 목록
//	public List<QnADTO> getQnAList(Criteria cri);
	public List<QnADTO> getQnAListSearch(SearchCriteria searchCriteria);
	public List<QnADTO> getMyQnAListSearch(Map<String, Object> memberQnAMap);


	// QnA 글 개수
	public int getQnANum();	
	public int getQnASearchNum(SearchCriteria scri);
	// 내 QnA 글 개수 
	public int getMyQnASearchNum(Map<String, Object> memberQnAMap);
	
	
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
	

	
	// 회원 전체 QnA 글 개수
	public int getMemberQnANum(String role_user);
	


	
	
	
	
}

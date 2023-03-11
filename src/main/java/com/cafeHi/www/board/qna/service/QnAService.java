package com.cafeHi.www.board.qna.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.Criteria;
import com.cafeHi.www.common.dto.SearchCriteria;

public interface QnAService {
	
	// QnA �� ���
//	public List<QnADTO> getQnAList(CriteriaDTO cri);
	public List<QnADTO> getQnAList(Criteria cri);
	public List<QnADTO> getQnAListSearch(SearchCriteria searchCriteria);
	


	// QnA �� ����
//	public int getQnANum(CriteriaDTO cri);
	public int getQnANum();	
	public int getQnASearchNum(SearchCriteria scri);
	public QnADTO getQnA(QnADTO qna);
	
	// QnA �� ��ȸ��
	public void updateHit(QnADTO qna);
	
	// QnA �� CRUD
	public void insertQnA(QnADTO qna);
	
	public void updateQnA(QnADTO qna);
	public void deleteQnA(QnADTO qna);
	
	// �� QnA �� ����Ʈ ��ȸ
	public List<QnADTO> getMyQnA(Map<String, Object> infoHash);
	
	// ȸ�� ��ü QnA �� ��ȸ 
	public List<QnADTO> getAllMemberQnA(Map<String, Object> auth);
	
	// �� QnA �� ���� 
	public int getMyQnANum(int member_code);
	
	// ȸ�� ��ü QnA �� ����
	public int getMemberQnANum(String role_user);
	


	
	
	
	
}

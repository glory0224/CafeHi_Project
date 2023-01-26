package com.cafeHi.www.board.qna.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

public interface QnAService {
	
	// QnA �� ���
	public List<QnADTO> getQnAList(CriteriaDTO cri);

	// QnA �� ����
	public int getQnANum(CriteriaDTO cri);
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

package com.cafeHi.www.board.qna.service;

import java.util.List;


import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.CriteriaDTO;

public interface QnAService {
	
	//�Խ��� ���
	public List<QnADTO> getQnAList(CriteriaDTO cri);
//	// ����¡ ���� �Խ��� ���
//	public List<QnADTO> getQnAListPaging(Criteria cri);
	// �Խ��� ����
	public int getQnANum(CriteriaDTO cri);
	public QnADTO getQnA(QnADTO qna);
	
	// �Խ��� ��ȸ��
	public void updateHit(QnADTO qna);
	
	// �Խ��� CRUD
	public void insertQnA(QnADTO qna);
	public void updateQnA(QnADTO qna);
	public void deleteQnA(QnADTO qna);
	
	
	
}

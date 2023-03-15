package com.cafeHi.www.board.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.cafeHi.www.board.qna.dao.QnADAO;
import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.common.dto.Criteria;
import com.cafeHi.www.common.dto.MemberSearchCriteria;
import com.cafeHi.www.common.dto.SearchCriteria;

import lombok.RequiredArgsConstructor;

@Service("qnaService")
@RequiredArgsConstructor
public class QnAServiceImpl implements QnAService {

	private final QnADAO qnADAO;



	@Override
	public QnADTO getQnA(QnADTO qna) {
		
		return qnADAO.getQnA(qna);
	}
	
	
	@Override
	public List<QnADTO> getQnAListSearch(SearchCriteria searchCriteria) {
		return qnADAO.getQnAListSearch(searchCriteria);
	}
	

	@Override
	public List<QnADTO> getMyQnAListSearch(Map<String, Object> memberQnAMap) {
		return qnADAO.getMyQnAListSearch(memberQnAMap);
	}



	@Override
	public void insertQnA(QnADTO qna) {
		
		System.out.println("qna.getStore_file_name() : " + qna.getStore_file_name());
		System.out.println("qna.getUpload_file_name() : " + qna.getUpload_file_name());
		System.out.println("qna.getUpload_path(): " + qna.getUpload_path());
		
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
	public int getQnANum() {
		return qnADAO.getQnANum();
	}


	@Override
	public int getQnASearchNum(SearchCriteria scri) {
		return qnADAO.getQnASearchNum(scri);
	}

	@Override
	public int getMyQnASearchNum(Map<String, Object> memberQnAMap) {
		return qnADAO.getMyQnASearchNum(memberQnAMap);
	}

	

	@Override
	public void updateHit(QnADTO qna) {
		qnADAO.updateHit(qna);
	}


	@Override
	public List<QnADTO> getMyQnA(Map<String, Object> infoHash) {
		return qnADAO.getMyQnA(infoHash);
	}


	@Override
	public List<QnADTO> getAllMemberQnA(Map<String, Object> auth) {
		return qnADAO.getAllMemberQnA(auth);
	}




	@Override
	public int getMemberQnANum(String role_user) {
		return qnADAO.getMemberQnANum(role_user);
	}




}

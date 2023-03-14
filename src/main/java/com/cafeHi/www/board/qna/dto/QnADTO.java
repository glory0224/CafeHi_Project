package com.cafeHi.www.board.qna.dto;

import java.time.LocalDateTime;
import java.util.List;


import com.cafeHi.www.member.dto.MemberAuthDTO;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class QnADTO {
	
	private int qna_num;	// QnA 게시글 번호 
	private String qna_title; // QnA 게시글 제목
	private String qna_title_classification; // 사용자 권한별 QnA 제목 분류 
	private String qna_content; // QnA 게시글 내용
	private LocalDateTime qna_writetime; // QnA 게시글 작성일
	private LocalDateTime qna_updatetime; // QnA 게시글 수정일
	private int qna_hit;	// QnA 게시글 조회수
	private String upload_path;	// QnA 게시글 업로드 경로 
	private String store_file_name; // QnA 게시글 서버 저장 파일명
	private String upload_file_name; // QnA 게시글 클라이언트 저장 파일명
	
	private MemberDTO member; // 멤버 정보 
	
	// QnA 등록
	public void setQnADateTime() {
		this.qna_writetime = LocalDateTime.now();
		this.qna_updatetime = LocalDateTime.now();
	}
	
	// QnA 수정 
	public void updateQnADateTime() {
		this.qna_updatetime = LocalDateTime.now();
	}
	
	// QnA 파일 저장
	public void saveFile(String storeFileName, String uploadFileName, String fullPath) {
		this.store_file_name = storeFileName;
		this.upload_file_name = uploadFileName;
		this.upload_path = fullPath;
	}

	
	// 나머지 setter 
	
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public void setQna_title_classification(String qna_title_classification) {
		this.qna_title_classification = qna_title_classification;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}
	
	public QnADTO(String qna_title, String qna_title_classification, String qna_content, LocalDateTime qna_writetime,
			LocalDateTime qna_updatetime, int qna_hit, String upload_path, String store_file_name,
			String upload_file_name, MemberDTO member) {
		super();
		this.qna_title = qna_title;
		this.qna_title_classification = qna_title_classification;
		this.qna_content = qna_content;
		this.qna_writetime = qna_writetime;
		this.qna_updatetime = qna_updatetime;
		this.qna_hit = qna_hit;
		this.upload_path = upload_path;
		this.store_file_name = store_file_name;
		this.upload_file_name = upload_file_name;
		this.member = member;
	}



	
	
}

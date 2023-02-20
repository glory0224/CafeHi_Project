package com.cafeHi.www.board.qna.dto;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cafeHi.www.member.dto.MemberAuthDTO;

import lombok.Data;

@Data
public class QnADTO {
	
	private int qna_num;	// QnA 게시글 번호 
	private String qna_title; // QnA 게시글 제목
	private String qna_title_classification; // 사용자 권한별 QnA 제목 분류 
	private String qna_content; // QnA 게시글 내용
	private LocalDateTime qna_writetime; // QnA 게시글 작성일
	private LocalDateTime qna_updatetime; // QnA 게시글 수정일
	private int qna_hit;	// QnA 게시글 조회수
	private String upload_path;	// QnA 게시글 업로드 경로 
//	private MultipartFile uploadFile; // ?? 니가 왜필요해
	private String store_file_name; // QnA 게시글 서버 저장 파일명
	private String upload_file_name; // QnA 게시글 클라이언트 저장 파일명
	
	// 멤버 정보를 가져오기 위한 필드
	private int member_code;  
	private String member_id;
	
	// 권한 리스트
	private List<MemberAuthDTO> authList;
	

	
}

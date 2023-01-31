package com.cafeHi.www.board.qna.dto;



import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cafeHi.www.member.dto.MemberAuthDTO;

import lombok.Data;

@Data
public class QnAFormDTO {
	
	private int qna_num;
	private String qna_title;
	private String classification; // 게시글 분류
	private String qna_content;
	private Date qna_writetime;
	private int qna_hit;
	
	
	private int member_code;
	private String member_id;
	
	private String upload_path;
	private String fileName;
	
	 private MultipartFile attachFile;
	 private List<MultipartFile> imageFiles;
	
	private List<MemberAuthDTO> authList;
}

package com.cafeHi.www.board.qna.dto;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cafeHi.www.member.dto.MemberAuthDTO;

import lombok.Data;

@Data
public class QnADTO {
	
	private int qna_num;	// QnA �Խñ� ��ȣ 
	private String qna_title; // QnA �Խñ� ����
	private String qna_title_classification; // ����� ���Ѻ� QnA ���� �з� 
	private String qna_content; // QnA �Խñ� ����
	private LocalDateTime qna_writetime; // QnA �Խñ� �ۼ���
	private LocalDateTime qna_updatetime; // QnA �Խñ� ������
	private int qna_hit;	// QnA �Խñ� ��ȸ��
	private String upload_path;	// QnA �Խñ� ���ε� ��� 
//	private MultipartFile uploadFile; // ?? �ϰ� ���ʿ���
	private String store_file_name; // QnA �Խñ� ���� ���� ���ϸ�
	private String upload_file_name; // QnA �Խñ� Ŭ���̾�Ʈ ���� ���ϸ�
	
	// ��� ������ �������� ���� �ʵ�
	private int member_code;  
	private String member_id;
	
	// ���� ����Ʈ
	private List<MemberAuthDTO> authList;
	

	
}

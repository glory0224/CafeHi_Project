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
	
	private int qna_num;	// QnA �Խñ� ��ȣ 
	private String qna_title; // QnA �Խñ� ����
	private String qna_title_classification; // ����� ���Ѻ� QnA ���� �з� 
	private String qna_content; // QnA �Խñ� ����
	private LocalDateTime qna_writetime; // QnA �Խñ� �ۼ���
	private LocalDateTime qna_updatetime; // QnA �Խñ� ������
	private int qna_hit;	// QnA �Խñ� ��ȸ��
	private String upload_path;	// QnA �Խñ� ���ε� ��� 
	private String store_file_name; // QnA �Խñ� ���� ���� ���ϸ�
	private String upload_file_name; // QnA �Խñ� Ŭ���̾�Ʈ ���� ���ϸ�
	
	private MemberDTO member; // ��� ���� 
	
	// QnA ���
	public void setQnADateTime() {
		this.qna_writetime = LocalDateTime.now();
		this.qna_updatetime = LocalDateTime.now();
	}
	
	// QnA ���� 
	public void updateQnADateTime() {
		this.qna_updatetime = LocalDateTime.now();
	}
	
	// QnA ���� ����
	public void saveFile(String storeFileName, String uploadFileName, String fullPath) {
		this.store_file_name = storeFileName;
		this.upload_file_name = uploadFileName;
		this.upload_path = fullPath;
	}

	
	// ������ setter 
	
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

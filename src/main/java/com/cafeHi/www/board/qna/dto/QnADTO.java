package com.cafeHi.www.board.qna.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class QnADTO {
	
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private Date qna_writetime;
	private int qna_hit;
	
	
	private String user_seq;
	private String user_id;
	private String admin_seq;
	private String admin_id;
	
	
	private String upload_path;
	private MultipartFile uploadFile;
	private String fileName;
	
	
	
	// private int pageNum;
	// private int amount;
	

	
	

//	public int getPageNum() {
//		return pageNum;
//	}
//
//
//
//
//
//	public int getAmount() {
//		return amount;
//	}
//
//
//
//
//
//	public void setPageNum(int pageNum) {
//		this.pageNum = pageNum;
//	}
//
//
//
//
//
//	public void setAmount(int amount) {
//		this.amount = amount;
//	}





	public String getFileName() {
		return fileName;
	}





	public String getUser_seq() {
		return user_seq;
	}





	public String getAdmin_seq() {
		return admin_seq;
	}





	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}





	public void setAdmin_seq(String admin_seq) {
		this.admin_seq = admin_seq;
	}





	public void setFileName(String fileName) {
		this.fileName = fileName;
	}





	public MultipartFile getUploadFile() {
		return uploadFile;
	}





	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}





	public QnADTO() {
	}
	
	

	

	public String getUpload_path() {
		return upload_path;
	}

	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}

	public int getQna_num() {
		return qna_num;
	}

	public String getQna_title() {
		return qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public Date getQna_writetime() {
		return qna_writetime;
	}

	public int getQna_hit() {
		return qna_hit;
	}

//	public String getQna_select() {
//		return qna_select;
//	}
//
//	public String getQna_search() {
//		return qna_search;
//	}

	public String getUser_id() {
		return user_id;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public void setQna_writetime(Date qna_writetime) {
		this.qna_writetime = qna_writetime;
	}

	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}

//	public void setQna_select(String qna_select) {
//		this.qna_select = qna_select;
//	}
//
//	public void setQna_search(String qna_search) {
//		this.qna_search = qna_search;
//	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}





	@Override
	public String toString() {
		return "QnADTO [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_writetime=" + qna_writetime + ", qna_hit=" + qna_hit + ", user_seq=" + user_seq + ", user_id="
				+ user_id + ", admin_seq=" + admin_seq + ", admin_id=" + admin_id + ", upload_path=" + upload_path
				+ ", uploadFile=" + uploadFile + ", fileName=" + fileName + "]";
	}




	









	











	
	
	
}

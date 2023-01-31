package com.cafeHi.www.common.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UploadFileDTO {
	
	private String uploadFileName; // 클라이언트 파일명
	private String storeFileName; // 서버 파일명
	
	
	public UploadFileDTO(String uploadFileName, String storeFileName) {
		this.uploadFileName = uploadFileName;
		this.storeFileName = storeFileName;
	}
	
	
	
}

package com.cafeHi.www.common.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UploadFileDTO {
	
	private String uploadFileName; // Ŭ���̾�Ʈ ���ϸ�
	private String storeFileName; // ���� ���ϸ�
	
	
	public UploadFileDTO(String uploadFileName, String storeFileName) {
		this.uploadFileName = uploadFileName;
		this.storeFileName = storeFileName;
	}
	
	
	
}

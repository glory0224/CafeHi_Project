package com.cafeHi.www.common.dto;


public class FileDTO {
	private String uuid;
	private String fileName;
	private String contentType;
	
	public FileDTO() {}

	public FileDTO(String uuid, String fileName, String contentType) {
		this.uuid = uuid;
		this.fileName = fileName;
		this.contentType = contentType;
	}

	public String getUuid() {
		return uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String toString() {
		return "FileDTO [uuid=" + uuid + ", fileName=" + fileName + ", contentType=" + contentType + "]";
	}
	
	
	
}

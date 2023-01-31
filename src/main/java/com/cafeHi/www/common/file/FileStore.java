package com.cafeHi.www.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cafeHi.www.common.dto.UploadFileDTO;


@Component
public class FileStore {
	
	
	//@Value("${file.dir}")
	@Value("D:/Spring/member_upload/")
	private String fileDir;
	
	
	// ��ü ��� ��ȯ �޼���
	public String getFullPath(String filename) {
		
		return fileDir + filename;
	}
	
	// ���� ���� ����
	public List<UploadFileDTO> storeFiles(List<MultipartFile> multipartFiles) throws IOException{
		List<UploadFileDTO> storeFileResult = new ArrayList<>();
		
		for (MultipartFile multipartFile : multipartFiles) {
			if (!multipartFile.isEmpty()) {
				storeFileResult.add(storeFile(multipartFile));
			}
		}
		return storeFileResult;
		
	}
	
	// ���� ���� 
	public UploadFileDTO storeFile(MultipartFile multipartFile) throws IOException {
		
		if (multipartFile.isEmpty()) {
			return null;
		}
		
		// Ŭ���̾�Ʈ�� �������� ���ϸ�
		String originalFilename = multipartFile.getOriginalFilename();
		// ������ ���� ���ϸ�
		String storeFileName = createStoreFileName(originalFilename);
		
		String getFullPath = getFullPath(storeFileName);
		
		System.out.println("getFullPath : " + getFullPath);
		
		multipartFile.transferTo(new File(getFullPath(storeFileName)));
		
		return new UploadFileDTO(originalFilename, storeFileName);
		
	}
	
	
	private String createStoreFileName(String originalFilename) {
		String ext = extractExt(originalFilename);
		String uuid = UUID.randomUUID().toString();
		
		return uuid + "." + ext; // UUID.Ȯ���� ������� ���� 
		
	}
	
		
	private String extractExt(String orginalFilename) {
		
		int position = orginalFilename.lastIndexOf(".");
		
		return orginalFilename.substring(position + 1); // Ȯ���� ��ȯ
	}
	
	
}

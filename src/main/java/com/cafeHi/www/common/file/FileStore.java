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
	
	
	// 전체 경로 반환 메서드
	public String getFullPath(String filename) {
		
		return fileDir + filename;
	}
	
	// 여러 파일 저장
	public List<UploadFileDTO> storeFiles(List<MultipartFile> multipartFiles) throws IOException{
		List<UploadFileDTO> storeFileResult = new ArrayList<>();
		
		for (MultipartFile multipartFile : multipartFiles) {
			if (!multipartFile.isEmpty()) {
				storeFileResult.add(storeFile(multipartFile));
			}
		}
		return storeFileResult;
		
	}
	
	// 파일 저장 
	public UploadFileDTO storeFile(MultipartFile multipartFile) throws IOException {
		
		if (multipartFile.isEmpty()) {
			return null;
		}
		
		// 클라이언트쪽 오리지널 파일명
		String originalFilename = multipartFile.getOriginalFilename();
		// 저장할 서버 파일명
		String storeFileName = createStoreFileName(originalFilename);
		
		String getFullPath = getFullPath(storeFileName);
		
		System.out.println("getFullPath : " + getFullPath);
		
		multipartFile.transferTo(new File(getFullPath(storeFileName)));
		
		return new UploadFileDTO(originalFilename, storeFileName);
		
	}
	
	
	private String createStoreFileName(String originalFilename) {
		String ext = extractExt(originalFilename);
		String uuid = UUID.randomUUID().toString();
		
		return uuid + "." + ext; // UUID.확장자 방식으로 저장 
		
	}
	
		
	private String extractExt(String orginalFilename) {
		
		int position = orginalFilename.lastIndexOf(".");
		
		return orginalFilename.substring(position + 1); // 확장자 반환
	}
	
	
}

package com.cafeHi.www.common.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
	
	
	
	// ���� �ٿ�ε� 
	@PostMapping("/qnaFileDownload.do")
	public ResponseEntity<Resource> fileDownload(@RequestParam("upload_path") String upload_path, @RequestParam("upload_file_name") String upload_file_name) throws IOException {
		
		Path path = Paths.get(upload_path);
		String contentType = Files.probeContentType(path);
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename(upload_file_name, StandardCharsets.UTF_8).build());
		
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);
		
		Resource resource = new InputStreamResource(Files.newInputStream(path));
		
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}

	
}

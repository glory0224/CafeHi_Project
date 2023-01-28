package com.cafeHi.www.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.board.qna.dto.QnADTO;

@Controller
public class FileController {
	
	
	
	// ���� �ٿ�ε� 
	@RequestMapping("/getFile.do")
	public ResponseEntity<Resource> getFile(QnADTO qna) throws IOException {
		
		
		Path path = Paths.get(qna.getUpload_path());
		String contentType = Files.probeContentType(path);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename(qna.getFileName(), StandardCharsets.UTF_8)
												.build());
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);
		
		Resource resource = new InputStreamResource(Files.newInputStream(path));
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
		
	}
	
	// ���� ���� 
	@RequestMapping("/removeFile.do")
    public String removeFile(QnADTO qna, Model model, HttpServletRequest request) throws UnsupportedEncodingException{
		
		File file = new File(qna.getUpload_path());
		
		file.delete(); 
		qna.setFileName(null);
		return "redirect:/QnAUpdate.do?qna_num=" + qna.getQna_num();	
		
    }
	
	
}
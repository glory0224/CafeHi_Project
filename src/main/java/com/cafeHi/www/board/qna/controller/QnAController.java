package com.cafeHi.www.board.qna.controller;


import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.board.qna.service.QnAService;
import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.common.dto.PageDTO;
import com.cafeHi.www.member.service.MemberService;

// qna 관련 이동 
@Controller
@RequestMapping("/all/*")
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	
	// 검색 조건 
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	
	// 게시글
	@RequestMapping("/getQnA.do")
	public String getQnA(HttpServletRequest request, HttpServletResponse response, QnADTO qna, Model model) {
		System.out.println("fileName : "+ qna.getFileName());
		
		
		// 쿠키 생성으로 방문 했던 게시글은 새로고침을 했을 때 계속해서 조회수가 증가하는 현상 방지 
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}
		
		if(oldCookie != null) {
			if(!oldCookie.getValue().contains("[" + qna.getQna_num() + "]")) {
				qnaService.updateHit(qna);
				oldCookie.setValue(oldCookie.getValue() + "[" + qna.getQna_num() + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24); // 쿠키 설정 시간 하루 
				response.addCookie(oldCookie);
			}
			
		} else {
			qnaService.updateHit(qna);
			Cookie newCookie = new Cookie("postView","[" +  qna.getQna_num() + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(newCookie);
		}
		
		
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		
		
		
		return "cafehi_QnA_content";
	}
	
	// 게시글 목록 
	@RequestMapping("/QnAList.do")
	public String SearchQnAList(QnADTO qna, CriteriaDTO cri, Model model) {
		
		
		// cri.setAmount(qnaService.getQnANum());
		//System.out.println("qna 총 게시글 수 :" + cri.getAmount());
		//System.out.println("qna 현재 페이지 : " + cri.getPageNum());
		
		// null check
//		if(cri.getBoardSelect() == null) cri.setBoardSelect("TITLE");  
//		if(cri.getBoardSearch() == null) cri.setBoardSelect("");
		
		// qna.setPageNum(cri.getPageNum());
		// qna.setAmount(cri.getAmount());
		
		int total = qnaService.getQnANum(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		System.out.println("page의 cri의 pageNum : " + pageDTO.getCri().getPageNum());
		System.out.println("page의 cri의 amount : " + pageDTO.getCri().getAmount());
		System.out.println("page의 cri의 keyword : " + pageDTO.getCri().getKeyword());
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("qnaList", qnaService.getQnAList(cri));
		
		
		// 딱 떨어지지 않는 수 형변환 
//		Double dnum = Double.valueOf(cri.getAmount());
//		double num = qnaService.getQnANum() / dnum;
//		int totalPageNum = (int) Math.ceil(num);
//		
//		System.out.println("총 페이지 수 : " + totalPageNum);
		
		
//		model.addAttribute("currentPage", cri.getPageNum());
//		model.addAttribute("totalPage", totalPageNum);
		
		
		
		// model.addAttribute("qnaPageNum", qna.getPageNum());
		// model.addAttribute("qnaAmount", qna.getAmount());		
		return "cafehi_QnA_board";
	}
	

	
	
	// 페이지 이동 
	
	
	
	@RequestMapping("/QnAWritePage.do")
	public String QnAWritePage() {
		return "cafehi_QnA_write";
		
	}
	
	@RequestMapping("/QnAUpdate.do")
	public String QnAUpdatePage(QnADTO qna, Model model) {
		 
		model.addAttribute("QnA", qnaService.getQnA(qna));
		return "cafehi_QnA_update";
	}
	
	
	// QnA CRUD
	

	@RequestMapping(value= "/InsertQnA.do", method = RequestMethod.POST)
	public String InsertQnA(@RequestParam("uploadfile") MultipartFile uploadfile,  QnADTO qna, RedirectAttributes ra) throws IOException {
		
		
		System.out.println("qna_title : " + qna.getQna_title()); 
		System.out.println("qna_content : " + qna.getQna_content());
		System.out.println("qna_hit : " + qna.getQna_hit());
		
		
		qna.setQna_writetime(new Date());
		System.out.println("qna_writetime : " + qna.getQna_writetime());
		qna.setUploadFile(uploadfile);
		MultipartFile File = qna.getUploadFile();
		// null check
		if(!File.isEmpty()) {
			String fileName = File.getOriginalFilename();
			qna.setFileName(fileName);
			File path = new File("D:/Spring/upload/" + UUID.randomUUID().toString() + fileName);
			qna.setUpload_path(path.getPath());
			File.transferTo(path);
		}
		
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
	}
	
	@RequestMapping("/getFile.do")
	public ResponseEntity<Resource> getFile(QnADTO qna) throws IOException {
		
		System.out.println("FileName : " + qna.getFileName());
		
		Path path = Paths.get(qna.getUpload_path());
		String contentType = Files.probeContentType(path);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename(qna.getFileName(), StandardCharsets.UTF_8)
												.build());
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);
		
		Resource resource = new InputStreamResource(Files.newInputStream(path));
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
		
	}
		
	
	@RequestMapping(value= "/QnAUpdate.do", method = RequestMethod.POST)
	public String UpdateQnA(QnADTO qna, HttpServletRequest request) {
		
		qnaService.updateQnA(qna);
		request.setAttribute("msg", "수정이 완료되었습니다.");
		request.setAttribute("url", "QnAUpdate.do?qna_num=" + qna.getQna_num());
		return "alert";
	}
	
	@RequestMapping("/DeleteQnA.do")
	public String DeleteQnA(QnADTO qna,  HttpServletRequest request) {
		qnaService.deleteQnA(qna);
		request.setAttribute("msg", "삭제가 완료되었습니다.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	
	
	
	
}

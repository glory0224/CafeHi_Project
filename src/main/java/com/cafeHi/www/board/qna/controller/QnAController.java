package com.cafeHi.www.board.qna.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.board.qna.service.QnAService;
import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.common.dto.PageDTO;
import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.RequiredArgsConstructor;

// qna 관련 이동 
@Controller
@RequiredArgsConstructor
public class QnAController {
	
	private final QnAService qnaService;
	
	private final MemberService memberService;
	
	

	
	// 게시글 조회
	@GetMapping("/getQnA.do")
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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("securityId", authentication.getName());
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		
		
		
		return "cafehi_QnA_content";
	}
	
	// 게시글 목록 조회
	@GetMapping("/QnAList.do")
	public String SearchQnAList(QnADTO qna, CriteriaDTO cri, Model model) {
				
		int total = qnaService.getQnANum(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		System.out.println("page의 cri의 pageNum : " + pageDTO.getCri().getPageNum());
		System.out.println("page의 cri의 amount : " + pageDTO.getCri().getAmount());
		System.out.println("page의 cri의 keyword : " + pageDTO.getCri().getKeyword());
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("qnaList", qnaService.getQnAList(cri));
		
		
			
		return "cafehi_QnA_board";
	}
	
	// 게시글 페이지 이동
	@GetMapping("/QnAWritePage.do")
	public String QnAWritePage() {
		return "member/cafehi_QnA_write";
		
	}
	
	// 관리자 게시글 페이지 이동
	@GetMapping("QnAAdminWritePage.do")
	public String QnAAdminWritePage() {
		return "admin/cafehi_QnA_adminWrite";
	}
	
	
	// 파일 다운로드 
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
	
	// 파일 삭제 
	@RequestMapping("/removeFile.do")
    public String removeFile(QnADTO qna, Model model, HttpServletRequest request) throws UnsupportedEncodingException{
		
		System.out.println("removeFile controller");
		System.out.println("qnaFileName : " + qna.getFileName());
		System.out.println("qnaOriginPath : " + qna.getUpload_path());
		
		
		File file = new File(qna.getUpload_path());
		
		file.delete(); 
		System.out.println("가져온 파일 이름 : " + qna.getFileName());
		qna.setFileName(null);
		System.out.println("삭제 후  파일 확인 : " + qna.getFileName());
		return "redirect:/QnAUpdate.do?qna_num=" + qna.getQna_num();	
		
    }
	
	
	// QnA CRUD
	
	// 사용자 게시글 등록
	
	@PostMapping("/InsertQnA.do")
	public String InsertQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem, RedirectAttributes ra) throws IOException {
		
		System.out.println("member_code : " + mem.getMember_code());
		
		int code = mem.getMember_code();
		
		
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
	
	// 관리자 게시글 등록
	
	@PostMapping("/InsertAdminQnA.do")
	public String InsertAdminQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem, RedirectAttributes ra) throws IOException {
		
		System.out.println("member_code : " + mem.getMember_code());
		System.out.println("classification : " + qna.getClassification());
		
		int code = mem.getMember_code();
		
		
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
		
//		if(classification != null) {
//			String adminTitle = classification + qna.getQna_title();
//			qna.setQna_title(adminTitle);
//		}
		
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
	}
	
	
	
	// 사용자 게시글 수정 
	
	@GetMapping("/QnAUpdate.do")
	public String QnAUpdatePage(QnADTO qna, Model model) {
		
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		System.out.println("getfileName :" + qna.getFileName());
		System.out.println("getOriginPath : " + qna.getUpload_path());
		return "member/cafehi_QnA_update";
	}
	
	
	@PostMapping("/QnAUpdate.do")
	public String UpdateQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile, QnADTO qna, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		
		
		qna.setUploadFile(uploadfile);
		MultipartFile File = qna.getUploadFile();
		// null check
		if(!File.isEmpty()) {
			String fileName = File.getOriginalFilename();
			qna.setFileName(fileName);
			File path = new File("D:/Spring/upload/" + UUID.randomUUID().toString() + fileName);
			qna.setUpload_path(path.getPath());
			File.transferTo(path);
			
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "QnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}else {
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "QnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}
		
		
	}
	
	// 관리자 게시글 수정
	
	@GetMapping("/AdminQnAUpdate.do")
	public String AdminQnAUpdatePage(QnADTO qna, Model model) {
		QnADTO getQnA = qnaService.getQnA(qna);
		model.addAttribute("QnA", getQnA);
		
		return "admin/cafehi_QnA_adminUpdate";
	}
	
	@PostMapping("/AdminQnAUpdate.do")
	public String AdminQnAUpdate(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile, QnADTO qna, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		System.out.println("classification : " + qna.getClassification());
		
		qna.setUploadFile(uploadfile);
		MultipartFile File = qna.getUploadFile();
		// null check
		if(!File.isEmpty()) {
			String fileName = File.getOriginalFilename();
			qna.setFileName(fileName);
			File path = new File("D:/Spring/upload/" + UUID.randomUUID().toString() + fileName);
			qna.setUpload_path(path.getPath());
			File.transferTo(path);
			
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "AdminQnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}else {
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "AdminQnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}
		
		
	}
	
	// 사용자 게시글 삭제 
	
	@GetMapping("/DeleteQnA.do")
	public String DeleteQnA(QnADTO qna,  HttpServletRequest request) {
		qnaService.deleteQnA(qna);
		request.setAttribute("msg", "삭제가 완료되었습니다.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	// 관리자 게시글 삭제 
	
	@GetMapping("/AdminDeleteQnA.do")
	public String AdminDeleteQnA(QnADTO qna,  HttpServletRequest request) {
		qnaService.deleteQnA(qna);
		request.setAttribute("msg", "삭제가 완료되었습니다.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	
	// 계정 활동 내역 페이지
	
		@GetMapping("myQnAInfo.do")
		public String MemberQnAInfoView(Model model) {
			
			 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			  CustomUser userInfo = (CustomUser) principal;
		    MemberDTO getMember = userInfo.getMember();
			System.out.println("member_id : " + getMember.getMember_code());
			
			List<QnADTO> myQnAList = qnaService.getMyQnA(getMember.getMember_code());
			
			
			
			for(QnADTO myQnA : myQnAList) {
				
			}
			
			model.addAttribute("myQnAList", myQnAList);
			
			
			return "member/cafehi_memberQnA";
		}
	
		
	
	
}

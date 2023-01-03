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

import lombok.RequiredArgsConstructor;

// qna 관련 이동 
@Controller
@RequiredArgsConstructor
public class QnAController {
	
	private final QnAService qnaService;
	
	

	
	// 게시글 조회
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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("securityId", authentication.getName());
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		
		
		
		return "cafehi_QnA_content";
	}
	
	// 게시글 목록 조회
	@RequestMapping("/QnAList.do")
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
	
	// 글쓰기 페이지 이동
	@RequestMapping("/QnAWritePage.do")
	public String QnAWritePage() {
		return "member/cafehi_QnA_write";
		
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
	
	@PostMapping("/removeFile.do")
    public ResponseEntity<String> removeFile(@RequestParam("uploadfile") MultipartFile uploadfile,  QnADTO qna){
		
		String fileName = uploadfile.getOriginalFilename();
		System.out.println("origin fileName : " + fileName);
		System.out.println("qnaFileName : " + qna.getFileName());
		System.out.println("qnaOriginPath : " + qna.getUpload_path());
        String srcFileName = null;
		//return "redirect:getQnA.do";

//        try{
//            srcFileName = URLDecoder.decode(fileName,"UTF-8");
//            //UUID가 포함된 파일이름을 디코딩해줍니다.
//            File file = new File(uploadPath +File.separator + srcFileName);
//            boolean result = file.delete();
//
//            File thumbnail = new File(file.getParent(),"s_"+file.getName());
//            //getParent() - 현재 File 객체가 나태내는 파일의 디렉토리의 부모 디렉토리의 이름 을 String으로 리턴해준다.
//            result = thumbnail.delete();
//            return new ResponseEntity<>(result,HttpStatus.OK);
//        }catch (UnsupportedEncodingException e){
//            e.printStackTrace();
//            return new ResponseEntity<>(false,HttpStatus.INTERNAL_SERVER_ERROR);
//        }
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
	

	@RequestMapping(value = "/QnAUpdate.do", method = RequestMethod.GET)
	public String QnAUpdatePage(QnADTO qna, Model model) {
		 
		model.addAttribute("QnA", qnaService.getQnA(qna));
		return "member/cafehi_QnA_update";
	}
	
	
	@RequestMapping(value= "/QnAUpdate.do", method = RequestMethod.POST)
	public String UpdateQnA(@RequestParam("uploadfile") MultipartFile uploadfile, QnADTO qna, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		
		
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
	
	
	// 계정 활동 내역 페이지
		@RequestMapping("myQnAInfo.do")
		public String MemberQnAInfoView(Model model) {
			
			 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			  CustomUser userInfo = (CustomUser) principal;
		    String member_id = userInfo.getUsername();
			System.out.println("member_id : " + member_id);
			List<QnADTO> myQnAList = qnaService.getMyQnA(member_id);
			
			for(QnADTO myQnA : myQnAList) {
				System.out.println(myQnA);
			}
			
			model.addAttribute("myQnAList", myQnAList);
			
			
			return "member/cafehi_memberQnA";
		}
	
	
	
}

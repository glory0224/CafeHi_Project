package com.cafeHi.www.board.qna.controller;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.board.qna.service.QnAService;
import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.common.dto.PageDTO;
import com.cafeHi.www.common.dto.UploadFileDTO;
import com.cafeHi.www.common.file.FileStore;
import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

 
@Controller
@RequiredArgsConstructor
@Slf4j
public class QnAController {
	
	private final QnAService qnaService;
	
	
	private final FileStore fileStore;
	
	
	// 게시글 조회
	@GetMapping("/getQnA.do")
	public String getQnA(HttpServletRequest request, HttpServletResponse response, QnADTO qna, Model model) {
		
		
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
		
		List<QnADTO> qnaList = qnaService.getQnAList(cri);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaListSize", qnaList.size());
		
		
			
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
	
	

	
	
	// QnA CRUD
	
	// 사용자 게시글 등록
	
	
	// 컨트롤러가 파일 저장 로직까지 수행하고 있어서 너무 많은 일을 하고 SRP 단일 책임 원칙을 위배한다. 
	
	//@PostMapping("/InsertQnA.do")
//	public String InsertQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem, RedirectAttributes ra) throws IOException {
//		
//			
//		qna.setQna_writetime(new Date());
//		
//		qna.setUploadFile(uploadfile);
//		MultipartFile File = qna.getUploadFile();
//		
//		// null check
//		if(!File.isEmpty()) {
//			String fileName = File.getOriginalFilename();
//			//qna.setFileName(fileName);
//			File path = new File("D:/Spring/member_upload/" + UUID.randomUUID().toString() + fileName);
//			qna.setUpload_path(path.getPath());
//			File.transferTo(path);
//		}
//		
//		
//		
//		qnaService.insertQnA(qna);
//		return "redirect:QnAList.do";
//		
//	}

	

	@PostMapping("/InsertQnA.do")
	public String InsertQnAV2(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
		
		
		if (!uploadfile.isEmpty()) {
			
			qna.setQna_title_classification("none");
		
			qna.setQnADateTime();
			
			UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
			
			qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
			
			
			
		} else {
			
			// 파일 등록을 안하는 경우
			
			qna.setQna_title_classification("none");
			
			qna.setQnADateTime();
			
			qna.saveFile("none", "없음", "none");
			
		}
			
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
		
	}
	

	// 관리자 게시글 등록
	
	@PostMapping("/InsertAdminQnA.do")
	public String InsertAdminQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
				
		if (!uploadfile.isEmpty()) {
			
			
			qna.setQnADateTime();
			
			UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
			
			qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
			
		} else {
			
			// 파일 등록을 안하는 경우
			
			qna.setQnADateTime();
			
			qna.saveFile("none", "없음", "none");
		}
				
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
	}
	
	
	
	// 사용자 게시글 수정 
	
	@GetMapping("/QnAUpdate.do")
	public String QnAUpdatePage(QnADTO qna, Model model) {
		
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		return "member/cafehi_QnA_update";
	}
	
	
	@PostMapping("/QnAUpdate.do")
	public String UpdateQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile, QnADTO qna, HttpServletRequest request) throws IllegalStateException, IOException {
			
			// 수정 - 애초에 uploadfile 이 안넘어오거나, 새로운 파일이 넘어온다.
			
			// 이전에 있던 게시글 파일 존재 여부 확인 후
			QnADTO getQnA = qnaService.getQnA(qna);
		
			// 이전에 게시글에 파일이 존재 했다면 파일을 삭제, 새로운 파일을 넣거나 none	
			
			if (getQnA.getUpload_path() != "none") {
				
				File file = new File(getQnA.getUpload_path());
				file.delete();
				
				if (!uploadfile.isEmpty()) {
					UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
					
					qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
				} else {
					
					// 파일을 등록 안하는 경우
					qna.saveFile("none", "없음", "none");
					
				}
				
			} else {
				// 이전에 게시글에 파일이 존재하지 않았다면 그냥 새로운 파일을 넣거나 none 
				
				if(!uploadfile.isEmpty()) {
					UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
					qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
				} else {
					// 파일을 등록 안하는 경우
					qna.saveFile("none", "없음", "none");
				}
			}
			
			// 날짜 수정
			qna.updateQnADateTime();
			
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "getQnA.do?qna_num=" + qna.getQna_num());
			return "alert";
		
		
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
		
		
		File file = new File(qna.getUpload_path());
		file.delete();
	
		UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
	
		qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
		
		qnaService.updateQnA(qna);
		request.setAttribute("msg", "수정이 완료되었습니다.");
		request.setAttribute("url", "getQnA.do?qna_num=" + qna.getQna_num());
		return "alert";
		
		
	}
	
	// 사용자 게시글 삭제 
	
	@PostMapping("/DeleteQnA.do")
	public String DeleteQnA(QnADTO qna, HttpServletRequest request) {
		
		
		// 뷰단에서 수정과 삭제 버튼 자체를 안보이게 막았으나, 어떻게 url 을 알고 직접 요청을 보내면 삭제될 가능성이 있다. 
		// Get -> Post 변경
		
		
			QnADTO getQnA = qnaService.getQnA(qna);
			qnaService.deleteQnA(qna);
			
			File file = new File(getQnA.getUpload_path());
			file.delete();
			request.setAttribute("msg", "삭제가 완료되었습니다.");
			request.setAttribute("url", "QnAList.do");
			
			return "alert";		
		
	}
	
	// 관리자 게시글 삭제 
	
	@PostMapping("/AdminDeleteQnA.do")
	public String AdminDeleteQnA(QnADTO qna,  HttpServletRequest request) {
		QnADTO getQnA = qnaService.getQnA(qna);
		qnaService.deleteQnA(qna);
		
		File file = new File(getQnA.getUpload_path());
		file.delete();
		request.setAttribute("msg", "삭제가 완료되었습니다.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	
	// 사용자 QnA 활동 내역 페이지
	
		@GetMapping("myQnAInfo.do")
		public String MemberQnAInfoView(CriteriaDTO cri, Model model) {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			CustomUser userInfo = (CustomUser) principal;
		    MemberDTO getMember = userInfo.getMember();
		    
		    int member_code = getMember.getMember_code();
		    
		    int total = qnaService.getMyQnANum(member_code);
		    PageDTO pageDTO = new PageDTO(cri, total);
		    
		    Map<String, Object> infoHash = new ConcurrentHashMap<String, Object>();
		    
		    infoHash.put("member_code", member_code);
		    infoHash.put("cri", cri);
			
			List<QnADTO> myQnAList = qnaService.getMyQnA(infoHash);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("myQnAList", myQnAList);
			
			
			return "member/cafehi_memberQnA";
		}
	
	// 관리자 QnA 활동 내역 페이지
		
		@GetMapping("AdminQnAInfo.do")
		public String AdminQnAInfoView(CriteriaDTO cri, Model model) {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			CustomUser userInfo = (CustomUser) principal;
		    MemberDTO getMember = userInfo.getMember();
		    
		    int member_code = getMember.getMember_code();
		    
		    int total = qnaService.getMyQnANum(member_code);
		    PageDTO pageDTO = new PageDTO(cri, total);
		    
		    Map<String, Object> infoHash = new ConcurrentHashMap<String, Object>();
		    
		    infoHash.put("member_code", member_code);
		    infoHash.put("cri", cri);
			
			List<QnADTO> myQnAList = qnaService.getMyQnA(infoHash);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("myQnAList", myQnAList);
			
			return "admin/cafehi_adminBoard";
		}
		
	// 사용자 QnA 활동 내역 페이지
	
		@GetMapping("MemberAllQnAInfo.do")
		public String MemberAllQnAInfoView(CriteriaDTO cri, Model model) {
			
			String role_user = "ROLE_USER";
			
			int total = qnaService.getMemberQnANum(role_user);
			
			PageDTO pageDTO = new PageDTO(cri, total);
			
			Map<String, Object> auth = new ConcurrentHashMap<String, Object>(); // 순서가 중요하지 않아서 
			
			auth.put("role_user", role_user);
			auth.put("cri", cri);
			
			List<QnADTO> member_qna = qnaService.getAllMemberQnA(auth);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("memberQnAList", member_qna);
			
			return "admin/cafehi_adminMemberBoard";
		}
	
	
}

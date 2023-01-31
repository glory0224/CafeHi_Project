package com.cafeHi.www.board.qna.controller;


import java.io.File;
import java.io.IOException;
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

// qna ���� �̵� 
@Controller
@RequiredArgsConstructor
public class QnAController {
	
	private final QnAService qnaService;
	
	//private final MemberService memberService;
	
	private final FileStore fileStore;
	
	
	// �Խñ� ��ȸ
	@GetMapping("/getQnA.do")
	public String getQnA(HttpServletRequest request, HttpServletResponse response, QnADTO qna, Model model) {
		
		
		// ��Ű �������� �湮 �ߴ� �Խñ��� ���ΰ�ħ�� ���� �� ����ؼ� ��ȸ���� �����ϴ� ���� ���� 
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
				oldCookie.setMaxAge(60 * 60 * 24); // ��Ű ���� �ð� �Ϸ� 
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
	
	// �Խñ� ��� ��ȸ
	@GetMapping("/QnAList.do")
	public String SearchQnAList(QnADTO qna, CriteriaDTO cri, Model model) {
				
		int total = qnaService.getQnANum(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("qnaList", qnaService.getQnAList(cri));
		
		
			
		return "cafehi_QnA_board";
	}
	
	// �Խñ� ������ �̵�
	@GetMapping("/QnAWritePage.do")
	public String QnAWritePage() {
		return "member/cafehi_QnA_write";
		
	}
	
	// ������ �Խñ� ������ �̵�
	@GetMapping("QnAAdminWritePage.do")
	public String QnAAdminWritePage() {
		return "admin/cafehi_QnA_adminWrite";
	}
	
	

	
	
	// QnA CRUD
	
	// ����� �Խñ� ���
	
	
	// ��Ʈ�ѷ��� ���� ���� �������� �����ϰ� �־ �ʹ� ���� ���� �ϰ� SRP ���� å�� ��Ģ�� �����Ѵ�. 
	
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

	
	// �����غ� �ڵ� 
	@PostMapping("/InsertQnA.do")
	public String InsertQnAV2(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
		
		
		qna.setQna_writetime(new Date());
		
		UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
		
		System.out.println("StoreFileName : " + attachFile.getStoreFileName());
		System.out.println("UploadFileName : " + attachFile.getUploadFileName());
		
		String storeFile = attachFile.getStoreFileName();
		
		qna.setStore_file_name(storeFile);
		
		String uploadFile = attachFile.getUploadFileName();
		
		qna.setUpload_file_name(uploadFile);
		
		String fullPath = fileStore.getFullPath(storeFile);
		
		qna.setUpload_path(fullPath);
				
		qnaService.insertQnA(qna);
		
		
		return "redirect:QnAList.do";
		
	}
	

	// ������ �Խñ� ���
	
	@PostMapping("/InsertAdminQnA.do")
	public String InsertAdminQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
				
		qna.setQna_writetime(new Date());
		
		UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
		
		System.out.println("StoreFileName : " + attachFile.getStoreFileName());
		System.out.println("UploadFileName : " + attachFile.getUploadFileName());
		
		String storeFile = attachFile.getStoreFileName();
		
		qna.setStore_file_name(storeFile);
		
		String uploadFile = attachFile.getUploadFileName();
		
		qna.setUpload_file_name(uploadFile);
		
		String fullPath = fileStore.getFullPath(storeFile);
		
		qna.setUpload_path(fullPath);
				
		qnaService.insertQnA(qna);
		
		
		return "redirect:QnAList.do";
		
	}
	
	
	
	// ����� �Խñ� ���� 
	
	@GetMapping("/QnAUpdate.do")
	public String QnAUpdatePage(QnADTO qna, Model model) {
		
		model.addAttribute("QnA", qnaService.getQnA(qna));
		
		return "member/cafehi_QnA_update";
	}
	
	
	@PostMapping("/QnAUpdate.do")
	public String UpdateQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile, QnADTO qna, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		
		
			UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
		
			System.out.println("StoreFileName : " + attachFile.getStoreFileName());
			System.out.println("UploadFileName : " + attachFile.getUploadFileName());
			
			String storeFile = attachFile.getStoreFileName();
			
			qna.setStore_file_name(storeFile);
			
			String uploadFile = attachFile.getUploadFileName();
			
			qna.setUpload_file_name(uploadFile);
			
			String fullPath = fileStore.getFullPath(storeFile);
			
			qna.setUpload_path(fullPath);
			
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
			request.setAttribute("url", "QnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		
		
	}
	
	// ������ �Խñ� ����
	
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
			//qna.setFileName(fileName);
			File path = new File("D:/Spring/admin_upload/" + UUID.randomUUID().toString() + fileName);
			qna.setUpload_path(path.getPath());
			File.transferTo(path);
			
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
			request.setAttribute("url", "AdminQnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}else {
			qnaService.updateQnA(qna);
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
			request.setAttribute("url", "AdminQnAUpdate.do?qna_num=" + qna.getQna_num());
			return "alert";
		}
		
		
	}
	
	// ����� �Խñ� ���� 
	
	@GetMapping("/DeleteQnA.do")
	public String DeleteQnA(QnADTO qna,  HttpServletRequest request) {
		qnaService.deleteQnA(qna);
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	// ������ �Խñ� ���� 
	
	@GetMapping("/AdminDeleteQnA.do")
	public String AdminDeleteQnA(QnADTO qna,  HttpServletRequest request) {
		qnaService.deleteQnA(qna);
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	
	// ����� QnA Ȱ�� ���� ������
	
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
	
	// ������ QnA Ȱ�� ���� ������
		
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
		
	// ����� QnA Ȱ�� ���� ������
	
		@GetMapping("MemberAllQnAInfo.do")
		public String MemberAllQnAInfoView(CriteriaDTO cri, Model model) {
			
			String role_user = "ROLE_USER";
			
			int total = qnaService.getMemberQnANum(role_user);
			
			PageDTO pageDTO = new PageDTO(cri, total);
			
			Map<String, Object> auth = new ConcurrentHashMap<String, Object>(); // ������ �߿����� �ʾƼ� 
			
			auth.put("role_user", role_user);
			auth.put("cri", cri);
			
			List<QnADTO> member_qna = qnaService.getAllMemberQnA(auth);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("memberQnAList", member_qna);
			
			return "admin/cafehi_adminMemberBoard";
		}
	
	
}

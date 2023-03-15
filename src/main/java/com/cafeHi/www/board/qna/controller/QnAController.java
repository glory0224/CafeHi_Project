package com.cafeHi.www.board.qna.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafeHi.www.board.qna.dto.QnADTO;
import com.cafeHi.www.board.qna.service.QnAService;
import com.cafeHi.www.common.dto.Criteria;
import com.cafeHi.www.common.dto.MemberSearchCriteria;
import com.cafeHi.www.common.dto.PageMaker;
import com.cafeHi.www.common.dto.SearchCriteria;
import com.cafeHi.www.common.dto.UploadFileDTO;
import com.cafeHi.www.common.file.FileStore;
import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

 
@Controller
@RequiredArgsConstructor
@Slf4j
public class QnAController {
	
	private final QnAService qnaService;
	
	
	private final FileStore fileStore;
	
	
	// �Խñ� ��ȸ
	@GetMapping("/getQnA.do")
	public String getQnA(HttpServletRequest request, HttpServletResponse response, QnADTO qna,@ModelAttribute("scri") SearchCriteria scri,  Model model) {
		
		
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
		QnADTO getQna = qnaService.getQnA(qna);
		
		log.info("upload_file_name = {}", getQna.getUpload_file_name());
		model.addAttribute("QnA", qnaService.getQnA(qna));
		model.addAttribute("scri", scri);
		
		return "cafehi_QnA_content";
	}
	
	
	// �Խñ�+����¡
	
	@RequestMapping("/QnAList.do")
	public String getListPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		
		 List<QnADTO> qnaList = null;
		 qnaList = qnaService.getQnAListSearch(scri);
		 
		 for(QnADTO qna : qnaList) {
			 log.info("qna = {}", qna);
			 log.info("qna.member_id = {}", qna.getMember().getMember_id());
		 }
		 
		
		 
		 model.addAttribute("qnaList", qnaList);
		 model.addAttribute("qnaListSize", qnaList.size());
		 
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(scri);
		 
		 log.info("QnASearchNum = {}", qnaService.getQnASearchNum(scri));
		 
		 pageMaker.setTotalCount(qnaService.getQnASearchNum(scri));
		 model.addAttribute("pageMaker", pageMaker);
		 
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
	

	@PostMapping("/InsertQnA.do")
	public String InsertQnAV2(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
		
		
		if (!uploadfile.isEmpty()) {
			
			qna.setQna_title_classification("none");
		
			qna.setQnADateTime();
			
			UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
			
			qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
			
			
			
		} else {
			
			// ���� ����� ���ϴ� ���
			
			qna.setQna_title_classification("none");
			
			qna.setQnADateTime();
			
			qna.saveFile("none", "����", "none");
			
		}
		
		qna.setMember(mem);
		
		log.info("qna_member_id = {}", qna.getMember().getMember_code());
		
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
		
	}
	

	// ������ �Խñ� ���
	
	@PostMapping("/InsertAdminQnA.do")
	public String InsertAdminQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile,  QnADTO qna, MemberDTO mem) throws IOException {
				
		if (!uploadfile.isEmpty()) {
			
			
			qna.setQnADateTime();
			
			UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
			
			qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
			
		} else {
			
			// ���� ����� ���ϴ� ���
			
			qna.setQnADateTime();
			
			qna.saveFile("none", "����", "none");
		}
				
		qnaService.insertQnA(qna);
		return "redirect:QnAList.do";
		
	}
	
	
	
	// ����� �Խñ� ���� 
	
	@GetMapping("/QnAUpdate.do")
	public String QnAUpdatePage(QnADTO qna,@ModelAttribute("scri") SearchCriteria scri,  Model model) {
		
		model.addAttribute("QnA", qnaService.getQnA(qna));
		model.addAttribute("scri", scri);
		return "member/cafehi_QnA_update";
	}
	
	
	@PostMapping("/QnAUpdate.do")
	public String UpdateQnA(@RequestParam(value = "uploadfile", required = false) MultipartFile uploadfile, QnADTO qna, 
			HttpServletRequest request, RedirectAttributes rttr, 
			@ModelAttribute("scri") SearchCriteria scri) throws IllegalStateException, IOException {
			
			// ���� - ���ʿ� uploadfile �� �ȳѾ���ų�, ���ο� ������ �Ѿ�´�.
			
			// ������ �ִ� �Խñ� ���� ���� ���� Ȯ�� ��
			QnADTO getQnA = qnaService.getQnA(qna);
		
			// ������ �Խñۿ� ������ ���� �ߴٸ� ������ ����, ���ο� ������ �ְų� none	
			
			if (getQnA.getUpload_path() != "none") {
				
				File file = new File(getQnA.getUpload_path());
				file.delete();
				
				if (!uploadfile.isEmpty()) {
					UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
					
					qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
				} else {
					
					// ������ ��� ���ϴ� ���
					qna.saveFile("none", "����", "none");
					
				}
				
			} else {
				// ������ �Խñۿ� ������ �������� �ʾҴٸ� �׳� ���ο� ������ �ְų� none 
				
				if(!uploadfile.isEmpty()) {
					UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
					qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
				} else {
					// ������ ��� ���ϴ� ���
					qna.saveFile("none", "����", "none");
				}
			}
			
			// ��¥ ����
			qna.updateQnADateTime();
			
			qnaService.updateQnA(qna);
				
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/QnAList.do";
		
		
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
		
		
		File file = new File(qna.getUpload_path());
		file.delete();
	
		UploadFileDTO attachFile = fileStore.storeFile(uploadfile);
	
		qna.saveFile(attachFile.getStoreFileName(), attachFile.getUploadFileName(), fileStore.getFullPath(attachFile.getStoreFileName()));
		
		qnaService.updateQnA(qna);
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		request.setAttribute("url", "getQnA.do?qna_num=" + qna.getQna_num());
		return "alert";
		
		
	}
	
	// ����� �Խñ� ���� 
	
	@PostMapping("/DeleteQnA.do")
	public String DeleteQnA(QnADTO qna, HttpServletRequest request, RedirectAttributes rttr, @ModelAttribute("scri") SearchCriteria scri) {
		
		
		// ��ܿ��� ������ ���� ��ư ��ü�� �Ⱥ��̰� ��������, ��� url �� �˰� ���� ��û�� ������ ������ ���ɼ��� �ִ�. 
		// Get -> Post ����
		
		
			QnADTO getQnA = qnaService.getQnA(qna);
			qnaService.deleteQnA(qna);
			
			File file = new File(getQnA.getUpload_path());
			file.delete();
//			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
//			request.setAttribute("url", "QnAList.do");
			

			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/QnAList.do";		
		
	}
	
	// ������ �Խñ� ���� 
	
	@PostMapping("/AdminDeleteQnA.do")
	public String AdminDeleteQnA(QnADTO qna,  HttpServletRequest request) {
		QnADTO getQnA = qnaService.getQnA(qna);
		qnaService.deleteQnA(qna);
		
		File file = new File(getQnA.getUpload_path());
		file.delete();
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		request.setAttribute("url", "QnAList.do");
		return "alert";
	}
	
	
	// ����� QnA Ȱ�� ���� ������
	
		@RequestMapping("myQnAInfo.do")
		public String MyQnAInfo(SearchCriteria scri, Model model) {
			
			log.info("myQnAInfoController");
			
			log.info("scri.getSearchType={}", scri.getSearchType());
			log.info("scri.getKeyword={}", scri.getKeyword());
			
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			CustomUser userInfo = (CustomUser) principal;
		    MemberDTO getMember = userInfo.getMember();
		    
		    int member_code = getMember.getMember_code();
		   
		    log.info("member_code = {}", member_code);
		    
		    Map<String, Object> MemberQnAMap = new HashMap<String, Object>();
		    
		    MemberQnAMap.put("member_code", member_code);
		    MemberQnAMap.put("scri", scri);
		    
		    
		    List<QnADTO> myQnaList = null; 
			myQnaList = qnaService.getMyQnAListSearch(MemberQnAMap);
			
			log.info("myQnaList = {}", myQnaList);
		    
			 model.addAttribute("myQnaList", myQnaList);
			 model.addAttribute("myQnaListSize", myQnaList.size());
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(scri);
			 
			 log.info("getMyQnASearchNum = {}", qnaService.getMyQnASearchNum(MemberQnAMap));
			 pageMaker.setTotalCount(qnaService.getMyQnASearchNum(MemberQnAMap));
			 model.addAttribute("pageMaker", pageMaker);
			 model.addAttribute("scri", scri);
			 
			return "member/cafehi_memberQnA";
		}
		
	
	// ������ QnA Ȱ�� ���� ������
		
		@GetMapping("AdminQnAInfo.do")
		public String AdminQnAInfoView(SearchCriteria cri, Model model) {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			CustomUser userInfo = (CustomUser) principal;
		    MemberDTO getMember = userInfo.getMember();
		    
		    int member_code = getMember.getMember_code();
		   
			
			return "admin/cafehi_adminBoard";
		}
		
	// ����� QnA Ȱ�� ���� ������
	
		@GetMapping("MemberAllQnAInfo.do")
		public String MemberAllQnAInfoView(SearchCriteria cri, Model model) {
			
			String role_user = "ROLE_USER";
		
			return "admin/cafehi_adminMemberBoard";
		}
	
	
}

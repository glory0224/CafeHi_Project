package com.cafeHi.www.common.dto;

public class PageDTO {
	
	private int startPage; // 첫페이지 번호 
	private int endPage; // 마지막 페이지 번호 
	private boolean next; // 다음 버튼 활성화 
	private boolean prev; // 이전 버튼 활성화 
	
	private int total; // 총 게시글 수 
	private int pageNum; // 조회하는 페이지 번호 (CriteriaDTO에도 존재)
	private int amount; // 보여질 데이터 개수 
	
	private CriteriaDTO cri;
	
	public PageDTO() {
	}
	
	
	



	public PageDTO(CriteriaDTO cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		// endPage 계산 후 초기화 (페이지의 맨 마지막이 아닌 페이지 번호를 구분)
		// pageNum 5번 -> 끝페이지 번호는 10, pageNum이 11번 -> 끝페이지 번호는 20 
		// (int)Math.ceil( pageNum / 보여질 페이지 수 ) * 보여질 페이지 수 
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		// startPage : 페이지의 처음 1, 11 ..
		// 끝페이지 - 보여질 페이지 수 + 1
		this.startPage = this.endPage - 10 + 1;
		// 게시글이 정확히 끝나는 페이지
		// 게시글 53개 -> 마지막 끝 페이지 번호 6
		// 게시글 112 -> 마지막 끝 페이지 번호는 12
		// (int)Math.ceil( 전체 게시글 수 / 화면에 뿌려질 데이터 amount 값)
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		// endPage 갱신
		// ex) 404개의 게시글 
		// 페이지 넘버 31번 -> endPage 공식 40, realEnd 41
		// 페이지 넘버 41번 -> endPage 공식 50, realEnd 41
		if(this.endPage > realEnd) {
			this.endPage = realEnd; // 마지막에 도달했을 때 보여질 번호를 변경
		}
		
		// 이전 버튼 활성화 여부 
		this.prev = this.startPage > 1;
		
		// 다음 버튼 활성화 여부 
		this.next = this.endPage < realEnd;
	}






	public int getStartPage() {
		return startPage;
	}






	public int getEndPage() {
		return endPage;
	}






	public boolean isNext() {
		return next;
	}






	public boolean isPrev() {
		return prev;
	}






	public int getTotal() {
		return total;
	}






	public int getPageNum() {
		return pageNum;
	}






	public int getAmount() {
		return amount;
	}






	public CriteriaDTO getCri() {
		return cri;
	}






	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}






	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}






	public void setNext(boolean next) {
		this.next = next;
	}






	public void setPrev(boolean prev) {
		this.prev = prev;
	}






	public void setTotal(int total) {
		this.total = total;
	}






	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}






	public void setAmount(int amount) {
		this.amount = amount;
	}






	public void setCri(CriteriaDTO cri) {
		this.cri = cri;
	}
	
	
	
	
}

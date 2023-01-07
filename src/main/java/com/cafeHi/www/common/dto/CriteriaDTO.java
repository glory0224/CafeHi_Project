package com.cafeHi.www.common.dto;


// 페이징 클래스 
public class CriteriaDTO {
	
	/* 현재 페이지 */
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 개수
	private int amount;
	
	// 검색어 키워드 
	private String keyword;

	
	// 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 10
	public CriteriaDTO() {
		this(1, 10);
	}

	public CriteriaDTO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
	}

	
	
}

package com.cafeHi.www.common.dto;


// ����¡ Ŭ���� 
public class CriteriaDTO {
	
	/* ���� ������ */
	private int pageNum;
	
	// �� ������ �� ������ �Խù� ����
	private int amount;
	
	// �˻��� Ű���� 
	private String keyword;

	
	// �⺻ ������ -> �⺻ ���� : pageNum = 1, amount = 10
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

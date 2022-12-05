package com.cafeHi.www.common.dto;

public class PageDTO {
	
	private int startPage; // ù������ ��ȣ 
	private int endPage; // ������ ������ ��ȣ 
	private boolean next; // ���� ��ư Ȱ��ȭ 
	private boolean prev; // ���� ��ư Ȱ��ȭ 
	
	private int total; // �� �Խñ� �� 
	private int pageNum; // ��ȸ�ϴ� ������ ��ȣ (CriteriaDTO���� ����)
	private int amount; // ������ ������ ���� 
	
	private CriteriaDTO cri;
	
	public PageDTO() {
	}
	
	
	



	public PageDTO(CriteriaDTO cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		// endPage ��� �� �ʱ�ȭ (�������� �� �������� �ƴ� ������ ��ȣ�� ����)
		// pageNum 5�� -> �������� ��ȣ�� 10, pageNum�� 11�� -> �������� ��ȣ�� 20 
		// (int)Math.ceil( pageNum / ������ ������ �� ) * ������ ������ �� 
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		// startPage : �������� ó�� 1, 11 ..
		// �������� - ������ ������ �� + 1
		this.startPage = this.endPage - 10 + 1;
		// �Խñ��� ��Ȯ�� ������ ������
		// �Խñ� 53�� -> ������ �� ������ ��ȣ 6
		// �Խñ� 112 -> ������ �� ������ ��ȣ�� 12
		// (int)Math.ceil( ��ü �Խñ� �� / ȭ�鿡 �ѷ��� ������ amount ��)
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		// endPage ����
		// ex) 404���� �Խñ� 
		// ������ �ѹ� 31�� -> endPage ���� 40, realEnd 41
		// ������ �ѹ� 41�� -> endPage ���� 50, realEnd 41
		if(this.endPage > realEnd) {
			this.endPage = realEnd; // �������� �������� �� ������ ��ȣ�� ����
		}
		
		// ���� ��ư Ȱ��ȭ ���� 
		this.prev = this.startPage > 1;
		
		// ���� ��ư Ȱ��ȭ ���� 
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

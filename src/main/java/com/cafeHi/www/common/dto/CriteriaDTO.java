package com.cafeHi.www.common.dto;

import java.util.Arrays;

// ����¡ Ŭ���� 
public class CriteriaDTO {
	
	/* ���� ������ */
	private int pageNum;
	
	// �� ������ �� ������ �Խù� ����
	private int amount;
	
	// �˻��� Ű���� 
	private String keyword;
	
//	// �˻� Ÿ�� 
//	private String type;
//	
//	// �˻� Ÿ�� �迭 ��ȯ
//	private String[] typeArr;
	
	
	
	// �˻� ����
	// private String boardSelect; 
	// �˻� �ܾ�
	// private String boardSearch; 
	
	


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

//	public String getType() {
//		return type;
//	}
//
//	public String[] getTypeArr() {
//		return typeArr;
//	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
	}

//	public void setType(String type) {
//		this.type = type;
//		// type ������ �����Ͱ� ������ �� �ڵ����� �迭 �������� ��ȯ�Ͽ� typeArr������ ����� �� �ֵ��� ��
//		// �迭�� ��ȯ�ϱ� ���ؼ� String Ÿ���� �����͸� String �迭 Ÿ�� �����ͷ� ��ȯ���ִ� split() �޼��带 ���
//		this.typeArr = type.split(""); 
//	}

//	public void setTypeArr(String[] typeArr) {
//		this.typeArr = typeArr;
//	}

	
	
}

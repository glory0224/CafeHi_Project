package com.cafeHi.www.common.dto;

import java.util.Arrays;

// 페이징 클래스 
public class CriteriaDTO {
	
	/* 현재 페이지 */
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 개수
	private int amount;
	
	// 검색어 키워드 
	private String keyword;
	
//	// 검색 타입 
//	private String type;
//	
//	// 검색 타입 배열 반환
//	private String[] typeArr;
	
	
	
	// 검색 조건
	// private String boardSelect; 
	// 검색 단어
	// private String boardSearch; 
	
	


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
//		// type 변수에 데이터가 들어왔을 때 자동으로 배열 형식으로 변환하여 typeArr변수에 저장될 수 있도록 함
//		// 배열로 변환하기 위해서 String 타입의 데이터를 String 배열 타입 데이터로 변환해주는 split() 메서드를 사용
//		this.typeArr = type.split(""); 
//	}

//	public void setTypeArr(String[] typeArr) {
//		this.typeArr = typeArr;
//	}

	
	
}

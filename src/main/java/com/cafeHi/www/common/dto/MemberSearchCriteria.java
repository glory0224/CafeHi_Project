package com.cafeHi.www.common.dto;

public class MemberSearchCriteria extends Criteria{
	
	 private String searchType;
	 private String keyword;
	 private int member_code;
	 
	 
	public String getSearchType() {
		return searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public int getMember_code() {
		return member_code;
	}
	
	
	public void addMemberCode(int member_code) {
		this.member_code = member_code;
	}
	
	
	 
}

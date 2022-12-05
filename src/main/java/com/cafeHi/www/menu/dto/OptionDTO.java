package com.cafeHi.www.menu.dto;

// 메뉴 추가금액 
public class OptionDTO {
	
	private int option_code;
	private String option_name;
	private int option_price;
	public int getOption_code() {
		return option_code;
	}
	public String getOption_name() {
		return option_name;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_code(int option_code) {
		this.option_code = option_code;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	
	
}

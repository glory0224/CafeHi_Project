package com.cafeHi.www.menu.dto;

public class MenuDTO {
	
	private int menu_code;
	private String menu_name;
	private int menu_price;
	private String menu_explain;
	private String menu_img_path;
	
	public int getMenu_code() {
		return menu_code;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public String getMenu_explain() {
		return menu_explain;
	}
	public String getMenu_img_path() {
		return menu_img_path;
	}
	public void setMenu_code(int menu_code) {
		this.menu_code = menu_code;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public void setMenu_explain(String menu_explain) {
		this.menu_explain = menu_explain;
	}
	public void setMenu_img_path(String menu_img_path) {
		this.menu_img_path = menu_img_path;
	}
	
	
	
}

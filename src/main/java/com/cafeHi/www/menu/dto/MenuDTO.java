package com.cafeHi.www.menu.dto;


import lombok.Data;

@Data
public class MenuDTO {
	
	private int menu_code;
	private int menu_price;
	private String menu_type;
	private String menu_name;	
	private String menu_explain;
	private String menu_img_path;
	private int menu_amount;
	
	
}

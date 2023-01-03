package com.cafeHi.www.cart.dto;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cart_code;
	private String member_id;
	private String member_name;
	private int menu_code;
	private String menu_name;
	private int menu_price;
	private int money;
	private int cart_amount;
}

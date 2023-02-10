package com.cafeHi.www.menu.dto;



import com.cafeHi.www.common.exception.NotEnoughMenuQuantityException;

import lombok.Data;

@Data
public class MenuDTO {
	
	private int menu_code;
	private int menu_price;
	private String menu_type;
	private String menu_name;	
	private String menu_explain;
	private String menu_img_path;
	private int menu_quantity; 
	
	
	// �޴� ���� ���� �޼ҵ�
	public void addMenuQuantity(int quantity) {
		this.menu_quantity += quantity;
	}
	
	// �޴� ���� ���� �޼ҵ�
	public void removeMenuQuantity(int quantity) {
		int restMenuQuantity = this.menu_quantity - quantity;
		
		if (restMenuQuantity < 0) {
			throw new NotEnoughMenuQuantityException("��� ����");
		}
		
		this.menu_quantity = restMenuQuantity;
	}
	
}

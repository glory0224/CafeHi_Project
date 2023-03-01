package com.cafeHi.www.menu.dto;



import java.time.LocalDateTime;

import com.cafeHi.www.common.exception.NotEnoughMenuQuantityException;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
	
	private int menu_code; // �޴� �ڵ� 
	private int menu_price; // �޴� ����
	private String menu_type; // �޴� ���� 
	private String menu_name;	// �޴� �̸�
	private String menu_explain; // �޴� ����
	private String menu_img_path; // �޴� �̹��� ��� 
	private int menu_stock_quantity; // �޴� ��� ���� 
	private LocalDateTime menu_writetime; // �޴� �����
	private LocalDateTime menu_updatetime; // �޴� ������
	
	// �޴� ���� ���� �޼ҵ�
	public void addMenuQuantity(int quantity) {
		menu_stock_quantity += quantity;
	}
	
	// �޴� ���� ���� �޼ҵ�
	public void removeMenuQuantity(int quantity) {
		int restMenuQuantity = this.menu_stock_quantity - quantity;
		
		if (restMenuQuantity < 0) {
			throw new NotEnoughMenuQuantityException("��� ����");
		}
		
		menu_stock_quantity = restMenuQuantity;
	}
	
}

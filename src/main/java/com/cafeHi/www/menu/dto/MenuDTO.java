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
	
	private int menu_code; // 메뉴 코드 
	private int menu_price; // 메뉴 가격
	private String menu_type; // 메뉴 종류 
	private String menu_name;	// 메뉴 이름
	private String menu_explain; // 메뉴 설명
	private String menu_img_path; // 메뉴 이미지 경로 
	private int menu_stock_quantity; // 메뉴 재고 수량 
	private LocalDateTime menu_writetime; // 메뉴 등록일
	private LocalDateTime menu_updatetime; // 메뉴 수정일
	
	// 메뉴 수량 증가 메소드
	public void addMenuQuantity(int quantity) {
		menu_stock_quantity += quantity;
	}
	
	// 메뉴 수량 감소 메소드
	public void removeMenuQuantity(int quantity) {
		int restMenuQuantity = this.menu_stock_quantity - quantity;
		
		if (restMenuQuantity < 0) {
			throw new NotEnoughMenuQuantityException("재고 부족");
		}
		
		menu_stock_quantity = restMenuQuantity;
	}
	
}

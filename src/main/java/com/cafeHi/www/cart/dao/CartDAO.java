package com.cafeHi.www.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.cart.dto.CartDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CartDAO {
	
	private final SqlSessionTemplate sqlsessionTemplate;
	
	//장바구니 담기
	public void insertCart(CartDTO cart) {
		sqlsessionTemplate.insert("cartDAO.insertCart", cart);
	}
	
	// 장바구니 개별 삭제
	public void deleteCart(int cart_code) {
		sqlsessionTemplate.delete("cartDAO.deleteCart", cart_code);
	}
	
	// 장바구니 수정
	public void modifyCart(CartDTO cart) {
		sqlsessionTemplate.update("cartDAO.modifyCart", cart);
	}
	
	// 장바구니 비우기
	public void deleteAllCart(int member_code) {
		sqlsessionTemplate.delete("cartDAO.deleteAllCart", member_code);
	}
	
	// 장바구니 금액 합계
	public int sumMoney(int member_code) {
		return sqlsessionTemplate.selectOne("cartDAO.sumMoney", member_code);
	}
	
	
	public int countCart(int member_code, int menu_code) {
		
		
		return 0; 
		
	}
	
	// 장바구니 리스트 조회
	public List<CartDTO> listCart(int member_code){
		return sqlsessionTemplate.selectList("cartDAO.listCart", member_code);
		
	}
	
	
}

package com.cafeHi.www.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.cart.dto.CartDTO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
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
	public void deleteAllCart(String member_id) {
		sqlsessionTemplate.delete("cartDAO.deleteAllCart", member_id);
	}
	
	// 장바구니 금액 합계
	public int sumMoney(String member_id) {
		return sqlsessionTemplate.selectOne("cartDAO.sumMoney", member_id);
	}
	
	
	public int countCart(String member_id, int menu_code) {
		
		
		return 0; 
		
	}
	
	public List<CartDTO> listCart(String member_id){
		return sqlsessionTemplate.selectList("cartDAO.listCart", member_id);
		
	}
	
	
}

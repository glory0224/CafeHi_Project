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
	
	//��ٱ��� ���
	public void insertCart(CartDTO cart) {
		sqlsessionTemplate.insert("cartDAO.insertCart", cart);
	}
	
	// ��ٱ��� ���� ����
	public void deleteCart(int cart_code) {
		sqlsessionTemplate.delete("cartDAO.deleteCart", cart_code);
	}
	
	// ��ٱ��� ����
	public void modifyCart(CartDTO cart) {
		sqlsessionTemplate.update("cartDAO.modifyCart", cart);
	}
	
	// ��ٱ��� ����
	public void deleteAllCart(int member_code) {
		sqlsessionTemplate.delete("cartDAO.deleteAllCart", member_code);
	}
	
	// ��ٱ��� �ݾ� �հ�
	public int sumMoney(int member_code) {
		return sqlsessionTemplate.selectOne("cartDAO.sumMoney", member_code);
	}
	
	
	public int countCart(int member_code, int menu_code) {
		
		
		return 0; 
		
	}
	
	// ��ٱ��� ����Ʈ ��ȸ
	public List<CartDTO> listCart(int member_code){
		return sqlsessionTemplate.selectList("cartDAO.listCart", member_code);
		
	}
	
	
}

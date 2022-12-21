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
	public void deleteAllCart(String member_id) {
		sqlsessionTemplate.delete("cartDAO.deleteAllCart", member_id);
	}
	
	// ��ٱ��� �ݾ� �հ�
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

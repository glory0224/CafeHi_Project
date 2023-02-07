package com.cafeHi.www.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.order.dto.orderDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public void insertOrder(orderDTO order) {
		sqlSessionTemplate.insert("OrderDAO.insertOrder", order);
		
	}

	public void updateOrder(orderDTO order) {
		sqlSessionTemplate.update("OrderDAO.updateOrder", order);
	}

	public void deleteOrder(orderDTO order) {
		sqlSessionTemplate.delete("OrderDAO.deleteOrder", order);
	}


	
	// ¡÷πÆ √— ∞°∞›
	public int sumOrderMoney(int member_code) {
		return sqlSessionTemplate.selectOne("OrderDAO.sumOrderMoney", member_code);
	}
	
	
	
}

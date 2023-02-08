package com.cafeHi.www.order.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public void insertOrderMenu(orderMenuDTO order) {
		sqlSessionTemplate.insert("OrderDAO.insertOrderMenu", order);
		
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

	public void inserOrder(Map<String, Object> memberOrder) {
		sqlSessionTemplate.insert("OrderDAO.insertOrder", memberOrder);
	}

	public orderDTO getOrder(orderDTO order) {
		return sqlSessionTemplate.selectOne("OrderDAO.getOrder", order);		
	}
	
	
	
}

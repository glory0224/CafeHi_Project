package com.cafeHi.www.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.order.dto.orderMenuDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public void insertOrderMenu(orderMenuDTO orderMenu) {
		sqlSessionTemplate.insert("OrderDAO.insertOrderMenu", orderMenu);
		
	}

	public void updateOrderMenu(orderMenuDTO orderMenu) {
		sqlSessionTemplate.update("OrderDAO.updateOrderMenu", orderMenu);
	}

	public void deleteOrderMenu(orderMenuDTO orderMenu) {
		sqlSessionTemplate.delete("OrderDAO.deleteOrderMenu", orderMenu);
	}
	
	
	
}

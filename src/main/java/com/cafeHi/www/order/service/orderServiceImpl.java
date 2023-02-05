package com.cafeHi.www.order.service;

import org.springframework.stereotype.Service;

import com.cafeHi.www.order.dao.orderDAO;
import com.cafeHi.www.order.dto.orderMenuDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class orderServiceImpl implements orderService{
	
	private final orderDAO orderDAO;
	
	
	@Override
	public void insertOrderMenu(orderMenuDTO orderMenu) {
		orderDAO.insertOrderMenu(orderMenu);
	}

	@Override
	public void updateOrderMenu(orderMenuDTO orderMenu) {
		orderDAO.updateOrderMenu(orderMenu);
	}

	@Override
	public void deleteOrderMenu(orderMenuDTO orderMenu) {
		orderDAO.deleteOrderMenu(orderMenu);
	}
	
}

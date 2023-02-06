package com.cafeHi.www.order.service;

import org.springframework.stereotype.Service;

import com.cafeHi.www.order.dao.orderDAO;
import com.cafeHi.www.order.dto.orderDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class orderServiceImpl implements orderService{
	
	private final orderDAO orderDAO;
	
	
	@Override
	public void insertOrder(orderDTO order) {
		orderDAO.insertOrder(order);
	}

	@Override
	public void updateOrder(orderDTO order) {
		orderDAO.updateOrder(order);
	}

	@Override
	public void deleteOrder(orderDTO order) {
		orderDAO.deleteOrder(order);
	}
	
}

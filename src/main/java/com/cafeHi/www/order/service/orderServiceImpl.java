package com.cafeHi.www.order.service;

import java.util.List;

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


	@Override
	public int sumOrderMoney(int member_code) {
		return orderDAO.sumOrderMoney(member_code);
	}
	
}

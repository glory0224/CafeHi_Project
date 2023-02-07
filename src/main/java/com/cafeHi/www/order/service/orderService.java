package com.cafeHi.www.order.service;

import java.util.List;

import com.cafeHi.www.order.dto.orderDTO;

public interface orderService {
	
	public void insertOrder(orderDTO order);
	
	public void updateOrder(orderDTO orderMenu);
	
	public void deleteOrder(orderDTO orderMenu);

	
	public int sumOrderMoney(int member_code);
	
}

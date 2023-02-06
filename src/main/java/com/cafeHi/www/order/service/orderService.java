package com.cafeHi.www.order.service;

import com.cafeHi.www.order.dto.orderDTO;

public interface orderService {
	
	public void insertOrder(orderDTO order);
	
	public void updateOrder(orderDTO orderMenu);
	
	public void deleteOrder(orderDTO orderMenu);
	
	
}

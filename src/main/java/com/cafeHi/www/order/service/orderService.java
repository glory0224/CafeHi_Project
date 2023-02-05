package com.cafeHi.www.order.service;

import com.cafeHi.www.order.dto.orderMenuDTO;

public interface orderService {
	
	public void insertOrderMenu(orderMenuDTO orderMenu);
	
	public void updateOrderMenu(orderMenuDTO orderMenu);
	
	public void deleteOrderMenu(orderMenuDTO orderMenu);
	
	
}

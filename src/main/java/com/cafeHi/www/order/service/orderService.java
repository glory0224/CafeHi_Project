package com.cafeHi.www.order.service;

import java.util.Map;

import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

public interface orderService {
	
	public void insertOrderMenu(orderMenuDTO orderMenu);
	
	public void updateOrder(orderDTO orderMenu);
	
	public void deleteOrder(orderDTO orderMenu);

	
	public int sumOrderMoney(int member_code);
	

	public void insertOrder(Map<String, Object> memberOrder);

	public orderDTO getOrder(orderDTO order);
	
}

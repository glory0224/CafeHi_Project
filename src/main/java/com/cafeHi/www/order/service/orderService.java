package com.cafeHi.www.order.service;

import java.util.List;
import java.util.Map;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

public interface orderService {
	
	public void insertOrderMenu(orderMenuDTO orderMenu);	

	public int insertOrder(orderDTO order);
	
	public int CancelOrder(Map<String, Object> orderCancelInfo);

	public orderDTO getOrder(int order_code);

	public List<orderMenuDTO> listOrder(int member_code);

	public orderMenuDTO getOrderMenu(int order_menu_code);

	
	
}

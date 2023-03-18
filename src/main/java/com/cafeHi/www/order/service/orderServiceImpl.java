package com.cafeHi.www.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.dao.orderDAO;
import com.cafeHi.www.order.dto.orderDTO;
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
	public void insertOrder(orderDTO order) {
		
		 orderDAO.inserOrder(order);
	}

	@Override
	public orderDTO getOrder(int order_code) {
		return orderDAO.getOrder(order_code);
	}
	
	
	@Override
	public orderMenuDTO getOrderMenu(int order_menu_code) {
		return orderDAO.getOrderMenu(order_menu_code);
	}
	

	@Override
	public List<orderMenuDTO> listOrder(int member_code) {
		return orderDAO.listOrder(member_code);
	}


	@Override
	public int CancelOrder(orderDTO order) {
		return orderDAO.cancelOrder(order);
	}


	@Override
	public int CancelOrderMenu(orderMenuDTO orderMenu) {
		return orderDAO.cancelOrderMenu(orderMenu);
	}


	
	

	
}

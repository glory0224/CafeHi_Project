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
	public void insertOrderMenu(Map<String, Object> memberOrderMenu) {
		orderDAO.insertOrderMenu(memberOrderMenu);
	}


	@Override
	public void insertOrder(Map<String, Object> memberOrder) {
		orderDAO.inserOrder(memberOrder);
	}

	@Override
	public orderDTO getOrder(MemberDTO member) {
		return orderDAO.getOrder(member);
	}

	@Override
	public List<orderDTO> listOrder(int member_code) {
		return orderDAO.listOrder(member_code);
	}


	@Override
	public int CancelOrder(Map<String, Object> orderCancelInfo) {
		return orderDAO.cancelOrder(orderCancelInfo);
	}
	
	

	
}

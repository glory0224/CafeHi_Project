package com.cafeHi.www.order.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public void insertOrderMenu(orderMenuDTO orderMenu) {
		
		 sqlSessionTemplate.insert("OrderDAO.insertOrderMenu", orderMenu);
		
	}


	public void inserOrder(orderDTO order) {
		 sqlSessionTemplate.insert("OrderDAO.insertOrder", order);
	}

	public orderDTO getOrder(int order_code) {
		return sqlSessionTemplate.selectOne("OrderDAO.getOrder", order_code);		
	}
	

	public orderMenuDTO getOrderMenu(int order_menu_code) {
		return  sqlSessionTemplate.selectOne("OrderDAO.getOrderMenu", order_menu_code);
	}

	public List<orderMenuDTO> listOrder(int member_code) {
		
		return sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
	}


	public int cancelOrder(orderDTO order) {
				
		int result = sqlSessionTemplate.update("OrderDAO.cancelOrder", order);
		
		return result;
	
	}


	public int cancelOrderMenu(orderMenuDTO orderMenu) {
		
		int result = sqlSessionTemplate.update("OrderDAO.cancelOrderMenu", orderMenu);
		
		return result;
	}


	
	
	
}

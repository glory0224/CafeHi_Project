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
@Slf4j
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
		
		List<orderMenuDTO> getOrderList = sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
		
		for (orderMenuDTO ordermenu : getOrderList) {
			
			log.info("orderMenu.include_delivery = {} ", ordermenu.getOrder().getInclude_delivery());
		
		}
		
		return sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
	}


	public int cancelOrder(orderDTO order) {
				
		int result = sqlSessionTemplate.update("OrderDAO.cancelOrder", order);
		
		return result;
	
	}


	
	
	
}

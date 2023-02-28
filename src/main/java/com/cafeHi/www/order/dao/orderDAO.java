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


	public int inserOrder(orderDTO order) {
		return sqlSessionTemplate.insert("OrderDAO.insertOrder", order);
	}

	public orderDTO getOrder(int order_code) {
		return sqlSessionTemplate.selectOne("OrderDAO.getOrder", order_code);		
	}
	

	public orderMenuDTO getOrderMenu(int order_menu_code) {
		return  sqlSessionTemplate.selectOne("OrderDAO.getOrderMenu", order_menu_code);
	}

	public List<orderMenuDTO> listOrder(int member_code) {
		
		List<orderMenuDTO> getOrderList = sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
		
		log.info("getOrderList size = {}", getOrderList.size());
		
		return sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
	}


	public int cancelOrder(Map<String, Object> orderCancelInfo) {
				
		int result = sqlSessionTemplate.update("OrderDAO.cancelOrder", orderCancelInfo);
		
		return result;
	
	}


	
	
	
}

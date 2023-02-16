package com.cafeHi.www.order.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public void insertOrderMenu(Map<String, Object> memberOrderMenu) {
		
		sqlSessionTemplate.insert("OrderDAO.insertOrderMenu", memberOrderMenu);
		
	}


	public void inserOrder(Map<String, Object> memberOrder) {
		sqlSessionTemplate.insert("OrderDAO.insertOrder", memberOrder);
	}

	public orderDTO getOrder(MemberDTO member) {
		return sqlSessionTemplate.selectOne("OrderDAO.getOrder", member);		
	}

	public List<orderDTO> listOrder(int member_code) {
		return sqlSessionTemplate.selectList("OrderDAO.listOrder", member_code);
	}


	public int cancelOrder(Map<String, Object> orderCancelInfo) {
				
		int result = sqlSessionTemplate.update("OrderDAO.cancelOrder", orderCancelInfo);
		
		return result;
	
	}
	
	
	
}

package com.cafeHi.www.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class orderDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	
}

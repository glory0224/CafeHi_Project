package com.cafeHi.www.menu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.menu.dto.MenuDTO;

@Repository
public class menuDAO {


	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
		
	public List<MenuDTO> getCoffeeList(){
		return sqlSessionTemplate.selectList("MenuDAO.getCoffeeList");
	}
	
	public List<MenuDTO> getColdBrewList(){
		return sqlSessionTemplate.selectList("MenuDAO.getColdBrewList");
	}
	
	public List<MenuDTO> getLatteList(){
		return sqlSessionTemplate.selectList("MenuDAO.getLatteList");
	}
	
	public List<MenuDTO> getSmoothieList(){
		return sqlSessionTemplate.selectList("MenuDAO.getSmoothieList");
	}
	
	public List<MenuDTO> getSideList(){
		return sqlSessionTemplate.selectList("MenuDAO.getSideList");
	}
	
	public List<MenuDTO> getBeverageList(){
		return sqlSessionTemplate.selectList("MenuDAO.getBeverageList");
	}
	
	public List<MenuDTO> getFruitJuiceList(){
		return sqlSessionTemplate.selectList("MenuDAO.getFruitJuiceList");
	}
	
	public List<MenuDTO> getTeaList(){
		return sqlSessionTemplate.selectList("MenuDAO.getTeaList");
	}
	
	
	
}

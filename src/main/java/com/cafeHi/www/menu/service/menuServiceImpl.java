package com.cafeHi.www.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeHi.www.menu.dao.menuDAO;
import com.cafeHi.www.menu.dto.MenuDTO;

@Service
public class menuServiceImpl implements menuService{
	
	@Autowired
	private menuDAO menuDAO;
	
	@Override
	public List<MenuDTO> getCoffeeList() {
		return menuDAO.getCoffeeList();
	}

	@Override
	public List<MenuDTO> getColdBrewList() {
		return menuDAO.getColdBrewList();
	}

	@Override
	public List<MenuDTO> getLatteList() {
		return menuDAO.getLatteList();
	}

	@Override
	public List<MenuDTO> getSmoothieList() {
		
		return menuDAO.getSmoothieList();
	}

	@Override
	public List<MenuDTO> getSideList() {
		return menuDAO.getSideList();
	}

	@Override
	public List<MenuDTO> getBeverageList() {
		return menuDAO.getBeverageList();
	}

	@Override
	public List<MenuDTO> getFruitJuiceList() {
		return menuDAO.getFruitJuiceList();
	}

	@Override
	public List<MenuDTO> getTeaList() {
		return menuDAO.getTeaList();
	}

	@Override
	public MenuDTO getMenu(int menu_code) {
		return menuDAO.getMenu(menu_code);
	}

}

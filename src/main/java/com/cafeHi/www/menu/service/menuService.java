package com.cafeHi.www.menu.service;

import java.util.List;

import com.cafeHi.www.menu.dto.MenuDTO;

public interface menuService {
	public List<MenuDTO> getCoffeeList();
	public List<MenuDTO> getColdBrewList();
	public List<MenuDTO> getLatteList();
	public List<MenuDTO> getSmoothieList();
	public List<MenuDTO> getSideList();
	public List<MenuDTO> getBeverageList();
	public List<MenuDTO> getFruitJuiceList();
	public List<MenuDTO> getTeaList();
}

package com.cafeHi.www.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;

@Controller("menuController")
public class menuController {
	
	@Autowired
	private menuService menuService;
	
	@RequestMapping("/Menu.do")
	public String Menu(HttpSession session) {
		List<MenuDTO> coffeeList = menuService.getCoffeeList();
		session.setAttribute("coffeeList", coffeeList);
		
		return "cafehi_menu";
	}
	
	
	/*
	 * @RequestMapping("/coffeeList.do") public String coffeeListView(HttpSession
	 * session) {
	 * 
	 * 
	 * }
	 */
	
	@RequestMapping("/coldbrewList.do")
	public String coldbrewListView(HttpSession session) {
		List<MenuDTO> coldbrewList =  menuService.getColdBrewList();
		
		session.setAttribute("coldbrewList", coldbrewList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/fruitJuiceList.do")
	public String fruitJuiceListView(HttpSession session) {
		List<MenuDTO> fruitJuiceList =  menuService.getFruitJuiceList();
		
		session.setAttribute("fruitJuiceList", fruitJuiceList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/beverageList.do")
	public String beverageListView(HttpSession session) {
		List<MenuDTO> beverageList =  menuService.getBeverageList();
		
		session.setAttribute("beverageList", beverageList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/latteList.do")
	public String latteListView(HttpSession session) {
		List<MenuDTO> latteList =  menuService.getLatteList();
		
		session.setAttribute("latteList", latteList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/sideList.do")
	public String sideListView(HttpSession session) {
		List<MenuDTO> sideList =  menuService.getSideList();
		
		session.setAttribute("sideList", sideList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/smoothieList.do")
	public String smoothieListView(HttpSession session) {
		List<MenuDTO> smoothieList =  menuService.getSmoothieList();
		
		session.setAttribute("smoothieList", smoothieList);
		return "cafehi_menu";
	}
	
	@RequestMapping("/teaList.do")
	public String teaListView(HttpSession session) {
		List<MenuDTO> teaList =  menuService.getTeaList();
		
		session.setAttribute("teaList", teaList);
		return "cafehi_menu";
	}
	
	
	
	
}

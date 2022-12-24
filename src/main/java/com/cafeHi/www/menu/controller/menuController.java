package com.cafeHi.www.menu.controller;

import java.util.List;


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
	
	
	
	
	  @RequestMapping("/coffeeList.do") 
	  public String coffeeListView(Model model) {
		  List<MenuDTO> coffeeList = menuService.getCoffeeList();
		  
		  
		  
		  model.addAttribute("coffeeList0", coffeeList.get(0));
		  model.addAttribute("coffeeList1", coffeeList.get(1));
		  model.addAttribute("coffeeList2", coffeeList.get(2));
		  model.addAttribute("coffeeList3", coffeeList.get(3));
		  model.addAttribute("coffeeList4", coffeeList.get(4));
		  
		  
			return "cafehi_menu/cafehi_coffee";
			
	  
	  }
	 
	
	@RequestMapping("/coldbrewList.do")
	public String coldbrewListView(Model model) {
		List<MenuDTO> coldbrewList =  menuService.getColdBrewList();
		
		model.addAttribute("coldbrewList", coldbrewList);
		return "cafehi_menu/cafehi_coldbrew";
	}
	
	@RequestMapping("/fruitJuiceList.do")
	public String fruitJuiceListView(Model model) {
		List<MenuDTO> fruitJuiceList =  menuService.getFruitJuiceList();
		model.addAttribute("fruitJuiceList", fruitJuiceList);
		return "cafehi_menu/cafehi_fruitsJuice";
	}
	
	@RequestMapping("/beverageList.do")
	public String beverageListView(Model model) {
		List<MenuDTO> beverageList =  menuService.getBeverageList();
		model.addAttribute("beverageList", beverageList);
		return "cafehi_menu/cafehi_beverage";
	}
	
	@RequestMapping("/latteList.do")
	public String latteListView(Model model) {
		List<MenuDTO> latteList =  menuService.getLatteList();
		model.addAttribute("latteList", latteList);
		return "cafehi_menu/cafehi_latte";
	}
	
	@RequestMapping("/sideList.do")
	public String sideListView(Model model) {
		List<MenuDTO> sideList =  menuService.getSideList();
		model.addAttribute("sideList", sideList);
		return "cafehi_menu/cafehi_side&bruch";
	}
	
	@RequestMapping("/smoothieList.do")
	public String smoothieListView(Model model) {
		List<MenuDTO> smoothieList =  menuService.getSmoothieList();
		model.addAttribute("smoothieList", smoothieList);
		return "cafehi_menu/cafehi_smoothie";
	}
	
	@RequestMapping("/teaList.do")
	public String teaListView(Model model) {
		List<MenuDTO> teaList =  menuService.getTeaList();
		model.addAttribute("teaList", teaList);
		return "cafehi_menu/cafehi_tea";
	}
	
	
	
	
}

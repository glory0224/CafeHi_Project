package com.cafeHi.www.menu.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;

@Controller("menuController")
public class menuController {
	
	@Autowired
	private menuService menuService;
	
	
	
	// DB에 저장된 각각의 메뉴 정보를 조회 
	
	  @GetMapping("/coffeeList.do") 
	  public String coffeeListView(Model model) {
		  List<MenuDTO> coffeeList = menuService.getCoffeeList();
		  
		  
		  
		  model.addAttribute("coffeeList0", coffeeList.get(0));
		  model.addAttribute("coffeeList1", coffeeList.get(1));
		  model.addAttribute("coffeeList2", coffeeList.get(2));
		  model.addAttribute("coffeeList3", coffeeList.get(3));
		  model.addAttribute("coffeeList4", coffeeList.get(4));
		  
		  
			return "cafehi_menu/cafehi_coffee";
			
	  
	  }
	 
	
	@GetMapping("/coldbrewList.do")
	public String coldbrewListView(Model model) {
		List<MenuDTO> coldbrewList =  menuService.getColdBrewList();
		
		model.addAttribute("coldbrewList0", coldbrewList.get(0));
		model.addAttribute("coldbrewList1", coldbrewList.get(1));
		model.addAttribute("coldbrewList2", coldbrewList.get(2));
		model.addAttribute("coldbrewList3", coldbrewList.get(3));
		model.addAttribute("coldbrewList4", coldbrewList.get(4));
		
		return "cafehi_menu/cafehi_coldbrew";
	}
	
	@GetMapping("/fruitJuiceList.do")
	public String fruitJuiceListView(Model model) {
		List<MenuDTO> fruitJuiceList =  menuService.getFruitJuiceList();
		
		model.addAttribute("fruitJuiceList0", fruitJuiceList.get(0));
		model.addAttribute("fruitJuiceList1", fruitJuiceList.get(1));
		model.addAttribute("fruitJuiceList2", fruitJuiceList.get(2));
		return "cafehi_menu/cafehi_fruitsJuice";
	}
	
	@GetMapping("/beverageList.do")
	public String beverageListView(Model model) {
		List<MenuDTO> beverageList =  menuService.getBeverageList();
		
		model.addAttribute("beverageList0", beverageList.get(0));
		model.addAttribute("beverageList1", beverageList.get(1));
		model.addAttribute("beverageList2", beverageList.get(2));
		model.addAttribute("beverageList3", beverageList.get(3));
		model.addAttribute("beverageList4", beverageList.get(4));
		model.addAttribute("beverageList5", beverageList.get(5));
		model.addAttribute("beverageList6", beverageList.get(6));
		model.addAttribute("beverageList7", beverageList.get(7));
		model.addAttribute("beverageList8", beverageList.get(8));
		
		return "cafehi_menu/cafehi_beverage";
	}
	
	@GetMapping("/latteList.do")
	public String latteListView(Model model) {
		List<MenuDTO> latteList =  menuService.getLatteList();
		
		model.addAttribute("latteList0", latteList.get(0));
		model.addAttribute("latteList1", latteList.get(1));
		model.addAttribute("latteList2", latteList.get(2));
		model.addAttribute("latteList3", latteList.get(3));
		model.addAttribute("latteList4", latteList.get(4));
		model.addAttribute("latteList5", latteList.get(5));
		model.addAttribute("latteList6", latteList.get(6));
		
		return "cafehi_menu/cafehi_latte";
	}
	
	@GetMapping("/sideList.do")
	public String sideListView(Model model) {
		List<MenuDTO> sideList =  menuService.getSideList();
		
		model.addAttribute("sideList0", sideList.get(0));
		model.addAttribute("sideList1", sideList.get(1));
		model.addAttribute("sideList2", sideList.get(2));
		model.addAttribute("sideList3", sideList.get(3));
		
		return "cafehi_menu/cafehi_side&bruch";
	}
	
	@GetMapping("/smoothieList.do")
	public String smoothieListView(Model model) {
		List<MenuDTO> smoothieList =  menuService.getSmoothieList();
		
		model.addAttribute("smoothieList0", smoothieList.get(0));
		model.addAttribute("smoothieList1", smoothieList.get(1));
		model.addAttribute("smoothieList2", smoothieList.get(2));
		model.addAttribute("smoothieList3", smoothieList.get(3));
		model.addAttribute("smoothieList4", smoothieList.get(4));
		model.addAttribute("smoothieList5", smoothieList.get(5));
		
		return "cafehi_menu/cafehi_smoothie";
	}
	
	@GetMapping("/teaList.do")
	public String teaListView(Model model) {
		List<MenuDTO> teaList =  menuService.getTeaList();
		
		model.addAttribute("teaList0", teaList.get(0));
		model.addAttribute("teaList1", teaList.get(1));
		model.addAttribute("teaList2", teaList.get(2));
		model.addAttribute("teaList3", teaList.get(3));
		model.addAttribute("teaList4", teaList.get(4));
		model.addAttribute("teaList5", teaList.get(5));
		model.addAttribute("teaList6", teaList.get(6));
		model.addAttribute("teaList7", teaList.get(7));
		model.addAttribute("teaList8", teaList.get(8));
		model.addAttribute("teaList9", teaList.get(9));
		model.addAttribute("teaList10", teaList.get(10));
		model.addAttribute("teaList11", teaList.get(11));
		model.addAttribute("teaList12", teaList.get(12));
		model.addAttribute("teaList13", teaList.get(13));
		model.addAttribute("teaList14", teaList.get(14));
		
		return "cafehi_menu/cafehi_tea";
	}
	
	
	
	
}

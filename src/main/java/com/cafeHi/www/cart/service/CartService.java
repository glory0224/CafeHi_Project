package com.cafeHi.www.cart.service;

import java.util.List;

import com.cafeHi.www.cart.dto.CartDTO;

public interface CartService {
	public void insertCart(CartDTO cart);
	public List<CartDTO> listCart(int member_code);
	public void deleteCart(int cart_code);
	public void deleteAllCart(int member_code);
	public int sumMoney(int member_code);
	public int countCart(int member_code, int menu_code);
	public void modifyCart(CartDTO cart);
	
}

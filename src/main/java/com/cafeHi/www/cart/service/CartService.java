package com.cafeHi.www.cart.service;

import java.util.List;

import com.cafeHi.www.cart.dto.CartDTO;

public interface CartService {
	public void insertCart(CartDTO cart);
	public List<CartDTO> listCart(String member_id);
	public void deleteCart(int cart_code);
	public void deleteAllCart(String member_id);
	public int sumMoney(String member_id);
	public int countCart(String member_id, int menu_code);
	public void modifyCart(CartDTO cart);
	
}

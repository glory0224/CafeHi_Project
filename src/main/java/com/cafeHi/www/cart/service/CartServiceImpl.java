package com.cafeHi.www.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafeHi.www.cart.dao.CartDAO;
import com.cafeHi.www.cart.dto.CartDTO;

import lombok.RequiredArgsConstructor;

@Service("cartService")
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartDAO cartDAO;
	
	@Override
	public void insertCart(CartDTO cart) {
		cartDAO.insertCart(cart);
	}

	@Override
	public List<CartDTO> listCart(String member_id) {
		return cartDAO.listCart(member_id);
	}

	@Override
	public void deleteCart(int cart_code) {
		cartDAO.deleteCart(cart_code);
	}

	@Override
	public void deleteAllCart(String member_id) {
		cartDAO.deleteAllCart(member_id);
	}

	@Override
	public int sumMoney(String member_id) {
		return cartDAO.sumMoney(member_id);
	}

	@Override
	public int countCart(String member_id, int menu_code) {
		return cartDAO.countCart(member_id, menu_code);
	}

	@Override
	public void modifyCart(CartDTO cart) {
		cartDAO.modifyCart(cart);
	}

}

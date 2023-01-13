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
	public List<CartDTO> listCart(int member_code) {
		return cartDAO.listCart(member_code);
	}

	@Override
	public void deleteCart(int cart_code) {
		cartDAO.deleteCart(cart_code);
	}

	@Override
	public void deleteAllCart(int member_code) {
		cartDAO.deleteAllCart(member_code);
	}

	@Override
	public int sumMoney(int member_code) {
		return cartDAO.sumMoney(member_code);
	}

	@Override
	public int countCart(int member_code, int menu_code) {
		return cartDAO.countCart(member_code, menu_code);
	}

	@Override
	public void modifyCart(CartDTO cart) {
		cartDAO.modifyCart(cart);
	}

}

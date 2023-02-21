package com.cafeHi.www.cart.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cart_code; // ��ٱ��� �ڵ� (�⺻Ű)
	private int member_code; // ����� �ڵ� 
	private String member_name; // ����� �̸�
	private int menu_code; // �޴� �ڵ� 
	private String menu_name; // �޴� �̸�
	private int menu_price; // �޴� ����
	private int money; //  (menu_price*cart_amount) money -> �޴� ���� * ���� ��
	private int cart_amount; // ��ٱ��� ��
	private LocalDateTime cart_writetime; // ��ٱ��� �����
	private LocalDateTime cart_updatetime; // ��ٱ��� ������
}

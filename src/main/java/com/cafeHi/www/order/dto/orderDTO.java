package com.cafeHi.www.order.dto;

import java.time.LocalDateTime;

import com.cafeHi.www.order.OrderState;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class orderDTO {
	

	
	private int order_code;	// �⺻Ű
	private int member_code;	// ��� ����
	private OrderState order_status; // �ֹ� ����
	private LocalDateTime order_writetime;	// �ֹ� ��¥
	private LocalDateTime order_updatetime; // ���� ��¥ 
	private Boolean include_delivery; // ��ۺ� ���� ����
	
  

	// �ֹ� ���� , �ֹ� ��¥ , ���� ��¥ ��� �޼��� 
		public void setTimeAndStatus() {
			this.order_status = OrderState.�ֹ��Ϸ�;
			this.order_writetime = LocalDateTime.now();
			this.order_updatetime = LocalDateTime.now();	
		}
		
		// �ֹ� ����, ���� ��¥ ��� �޼���
		public void cancelTimeAndStatus() {
			this.order_status = OrderState.�ֹ����;
			this.order_updatetime = LocalDateTime.now();
		}
		
		// 
		public void setIncludeDelivery(Boolean IncludeDelivery) {
			this.include_delivery = IncludeDelivery;
		}


		public void setMemberCode(int member_code) {
			this.member_code = member_code;
		}

		@Override
		public String toString() {
			return "orderDTO [order_code=" + order_code + ", member_code=" + member_code + ", order_status="
					+ order_status + ", order_writetime=" + order_writetime + ", order_updatetime=" + order_updatetime
					+ ", include_delivery=" + include_delivery + "]";
		}
		
		// �ֹ� ��ҿ� Order_code setter
		public void setOrder_code(int order_code) {
			this.order_code = order_code;
		}
		
	
}

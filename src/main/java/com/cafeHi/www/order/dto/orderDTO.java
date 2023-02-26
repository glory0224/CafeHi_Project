package com.cafeHi.www.order.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.OrderState;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
public class orderDTO {
	

	
	private int order_code;	// �⺻Ű
	private int member_code;	// ��� ����
	private OrderState order_status; // �ֹ� ����
	private LocalDateTime order_writetime;	// �ֹ� ��¥
	private LocalDateTime order_updatetime; // ���� ��¥ 
	private orderMenuDTO orderMenu; // �ֹ� �޴�
	private Boolean include_delivery; // ��ۺ� ���� ����
	
	public orderDTO() {
	}
		

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
	
	
	

	
}

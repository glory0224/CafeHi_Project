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
	

	
	private int order_code;	// 기본키
	private int member_code;	// 멤버 정보
	private OrderState order_status; // 주문 상태
	private LocalDateTime order_writetime;	// 주문 날짜
	private LocalDateTime order_updatetime; // 수정 날짜 
	private Boolean include_delivery; // 배송비 포함 여부
	
  

	// 주문 상태 , 주문 날짜 , 수정 날짜 등록 메서드 
		public void setTimeAndStatus() {
			this.order_status = OrderState.주문완료;
			this.order_writetime = LocalDateTime.now();
			this.order_updatetime = LocalDateTime.now();	
		}
		
		// 주문 상태, 수정 날짜 취소 메서드
		public void cancelTimeAndStatus() {
			this.order_status = OrderState.주문취소;
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
		
		// 주문 취소용 Order_code setter
		public void setOrder_code(int order_code) {
			this.order_code = order_code;
		}
		
	
}

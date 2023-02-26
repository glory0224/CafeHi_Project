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
	

	
	private int order_code;	// 기본키
	private int member_code;	// 멤버 정보
	private OrderState order_status; // 주문 상태
	private LocalDateTime order_writetime;	// 주문 날짜
	private LocalDateTime order_updatetime; // 수정 날짜 
	private orderMenuDTO orderMenu; // 주문 메뉴
	private Boolean include_delivery; // 배송비 포함 여부
	
	public orderDTO() {
	}
		

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
	
	
	

	
}

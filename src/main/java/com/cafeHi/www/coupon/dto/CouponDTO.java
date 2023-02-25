package com.cafeHi.www.coupon.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CouponDTO {
	private int coupon_code;
	private String coupon_name;
	private String coupon_content;
	private int coupon_price;
	private LocalDateTime coupon_start;
	private LocalDateTime coupon_end;
}

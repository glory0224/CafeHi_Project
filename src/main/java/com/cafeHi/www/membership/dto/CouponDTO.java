package com.cafeHi.www.membership.dto;

import java.util.Date;

public class CouponDTO {
	
	private int coupon_code;
	private String coupon_name;
	private int coupon_price;
	private Date coupon_start;
	private Date coupon_end;
	
	public int getCoupon_code() {
		return coupon_code;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public Date getCoupon_start() {
		return coupon_start;
	}
	public Date getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_code(int coupon_code) {
		this.coupon_code = coupon_code;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public void setCoupon_start(Date coupon_start) {
		this.coupon_start = coupon_start;
	}
	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}
	
	
}

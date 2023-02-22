package com.cafeHi.www.membership;

public enum MembershipGrade {
	VIP("VIP", 20000),
	GOLD("GOLD", 15000),
	SILVER("SILVER", 10000),
	STANDARD("STANDARD", 0);
	
	private String grade;
	private int basePoint;
	
	private MembershipGrade(String grade, int basePoint) {
		this.grade = grade;
		this.basePoint = basePoint;
	}
	
	public String getGrade() {
		return this.grade;
	}
	
	public int getBasePoint() {
		return this.basePoint;
	}
	
}

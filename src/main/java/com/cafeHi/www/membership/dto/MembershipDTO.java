package com.cafeHi.www.membership.dto;

public class MembershipDTO {
	
	private int mem_code;
	private String mem_grade;
	private int mem_point;
	
	public int getMem_code() {
		return mem_code;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	
	
}

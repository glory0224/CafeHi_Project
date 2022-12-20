package com.cafeHi.www.membership.dto;

import com.cafeHi.www.member.dto.MemberDTO;

public class myMembershipDTO {
	
	private MembershipDTO membership;
	private MemberDTO member;
	private int membership_point;
	
	public MembershipDTO getMembership() {
		return membership;
	}
	public void setMembership(MembershipDTO membership) {
		this.membership = membership;
	}
	
	
	
	public MemberDTO getMember() {
		return member;
	}
	public void setMember(MemberDTO member) {
		this.member = member;
	}
	public myMembershipDTO() {
		
	}
	
	
	public myMembershipDTO(MembershipDTO membership, MemberDTO member, int membership_point) {
		super();
		this.membership = membership;
		this.member = member;
		this.membership_point = membership_point;
	}
	
	
	public int getMembership_point() {
		return membership_point;
	}
	public void setMembership_point(int membership_point) {
		this.membership_point = membership_point;
	}
	@Override
	public String toString() {
		return "myMembershipDTO [membership=" + membership + ", member=" + member + ", membership_point="
				+ membership_point + "]";
	}
	
	
	
	
	
	
}

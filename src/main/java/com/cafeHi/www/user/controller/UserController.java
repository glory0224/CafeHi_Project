package com.cafeHi.www.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafeHi.www.user.dto.UserDTO;
import com.cafeHi.www.user.service.UserService;

// CRUD ���� ��Ʈ�ѷ� 
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// ȸ�� ���
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)
	public String insertUser(UserDTO user) {
		System.out.println(user.getUser_id());
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_road_address());
		
		// '-'�� �Է��� ������ ��� 
		if(user.getUser_contact().contains("-")) {
			String[] nums = user.getUser_contact().split("-");
			String join_nums = String.join("", nums);
			user.setUser_contact(join_nums);
			userService.insertUser(user);
			return "cafehi_login";
		}
		
		userService.insertUser(user);	
		
		return "cafehi_login";
	}
	
	// ȸ�� ����
	// ���ݰ� ���� �������� �Ѳ����� ������Ʈ ó���� �� ���, �Ѳ����� �� �Է¹޾ƾ� ������ �߻����� �ʴ´�. 
	// �׷��� Ȥ�� null�� ����ϸ� ���� ������ ��� �����Ͽ� mybatis���� jdbcType�� ����Ͽ� null�� ��� �ϰԲ� �ϴ� ����� �����ߴ�.
	// ������ �ᱹ database�� null�� ���� ���� �״�� �ִ°��� �ƴ϶� ����� ������ ����� �������, �������� �ʴ� ������ ������ �����ͷ� �ִ� ����� �𸣰ڴ�. 
	// ���� �׳� view �κп��� ���� �������ֵ��� �ϴ� ������� �����ϰ��� �Ѵ�. (22/11/29)
	// -> mybatis-config.xml ���Ͽ� settings �±׷� null ó�� �ϴ� ����� ã�Ƴ´�. 
	@RequestMapping("/updateUser.do")
	public String updateUser(UserDTO user, HttpSession session) {
		System.out.println("���� ���� �� : " + user.getUser_name());
		userService.updateUser(user);
		
		System.out.println("���� ���� �� " + user.getUser_name());
		
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		
		return "cafehi_userInfo";
	}
	
	
	@RequestMapping("/updateUserId.do")
	public String updateUserId(UserDTO user, HttpSession session) {
		
		userService.updateUserId(user);
		user = userService.getUser(user);
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		return "cafehi_userInfo";
		
	}
	
	@RequestMapping("/updateUserName.do")
	public String updateUserName(UserDTO user, HttpSession session) {
		userService.updateUserName(user);
		user = userService.getUser(user);
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		return "cafehi_userInfo";
		
	}
	
	@RequestMapping("/updateUserContact.do")
	public String updateUserContact(UserDTO user, HttpSession session) {
		userService.updateUserContact(user);
		user = userService.getUser(user);
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		return "cafehi_userInfo";
	}
	
	@RequestMapping("/updateUserAddress.do")
	public String updateUserAddress(UserDTO user, HttpSession session) {
		userService.updateUserAddress(user);
		user = userService.getUser(user);
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		return "cafehi_userInfo";
	}
	
	@RequestMapping("/updateUserDetailAddress.do")
	public String updateUserDetailAddress(UserDTO user, HttpSession session) {
		userService.updateUserDetailAddress(user);
		user = userService.getUser(user);
		session.setAttribute("UserId", user.getUser_id());
		session.setAttribute("UserName", user.getUser_name());
		session.setAttribute("UserContact", user.getUser_contact());
		session.setAttribute("UserRoadAddress", user.getUser_road_address());
		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
		return "cafehi_userInfo";
	}
	
	// ȸ�� ���� 
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserDTO user, HttpSession session, HttpServletRequest request) {
		userService.deleteUser(user);
		session.invalidate();
		request.setAttribute("msg", "������ �����Ǿ����ϴ�.");
		request.setAttribute("url", "/cafeHi/");
		return "alert"; // jsp�� �̿��ؼ� alert ��� �̿�
		//return "redirect:/";
	}
	
	
}

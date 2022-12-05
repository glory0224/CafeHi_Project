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

// CRUD 통합 컨트롤러 
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 회원 등록
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)
	public String insertUser(UserDTO user) {
		System.out.println(user.getUser_id());
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_road_address());
		
		// '-'을 입력한 정보일 경우 
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
	
	// 회원 수정
	// 지금과 같은 로직으로 한꺼번에 업데이트 처리를 할 경우, 한꺼번에 다 입력받아야 에러가 발생하지 않는다. 
	// 그래서 혹시 null을 허용하면 되지 않을까 라고 생각하여 mybatis에서 jdbcType을 명시하여 null도 허용 하게끔 하는 방법도 생각했다.
	// 하지만 결국 database에 null로 들어온 값을 그대로 넣는것이 아니라 변경된 정보는 변경된 정보대로, 변경하지 않는 정보는 기존의 데이터로 넣는 방법을 모르겠다. 
	// 따라서 그냥 view 부분에서 각각 수정해주도록 하는 방식으로 변경하고자 한다. (22/11/29)
	// -> mybatis-config.xml 파일에 settings 태그로 null 처리 하는 방법을 찾아냈다. 
	@RequestMapping("/updateUser.do")
	public String updateUser(UserDTO user, HttpSession session) {
		System.out.println("로직 실행 전 : " + user.getUser_name());
		userService.updateUser(user);
		
		System.out.println("로직 실행 후 " + user.getUser_name());
		
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
	
	// 회원 삭제 
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserDTO user, HttpSession session, HttpServletRequest request) {
		userService.deleteUser(user);
		session.invalidate();
		request.setAttribute("msg", "계정이 삭제되었습니다.");
		request.setAttribute("url", "/cafeHi/");
		return "alert"; // jsp를 이용해서 alert 기능 이용
		//return "redirect:/";
	}
	
	
}

package com.cafeHi.www.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cafeHi.www.user.dao.UserDAO;
import com.cafeHi.www.user.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService, UserDetailsService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	@Override
	public void insertUser(UserDTO user) {
		user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));
		
		userDAO.insertUser(user);
	}

	@Override
	public void updateUser(UserDTO user) {
		userDAO.updateUser(user);
	}

	@Override
	public void deleteUser(UserDTO user) {
		userDAO.deleteUser(user);
	}

	// 유저 정보 반환
	@Override
	public UserDTO getUser(UserDTO user) {
		return userDAO.getUser(user);
	}

	@Override
	public UserDTO getUserId(String find_id) {

		if (userDAO.getUserId(find_id) != null) {
			return userDAO.getUserId(find_id);
		}
		return null;
	}

	@Override
	public int idCheck(String user_id) {
		int result = userDAO.idCheck(user_id);

		return result;
	}

	// 정보 수정
	@Override
	public void updateUserId(UserDTO user) {
		userDAO.updateUserId(user);
	}

	@Override
	public void updateUserName(UserDTO user) {
		userDAO.updateUserName(user);
	}

	@Override
	public void updateUserContact(UserDTO user) {
		userDAO.updateUserContact(user);
	}

	@Override
	public void updateUserAddress(UserDTO user) {
		userDAO.updateUserAddress(user);
	}

	@Override
	public void updateUserDetailAddress(UserDTO user) {
		userDAO.updateUserDetailAddress(user);

	}

	@Override
	public void updateUserEmail(UserDTO user) {
		userDAO.updateUserEmail(user);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDTO user = userDAO.getUserById(username);
		System.out.println(user);
		if (user == null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}

	@Override
	public UserDTO getUserById(String user_id) {
		return userDAO.getUserById(user_id);
	}

}

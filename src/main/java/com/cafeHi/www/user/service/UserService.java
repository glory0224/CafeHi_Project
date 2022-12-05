package com.cafeHi.www.user.service;

import com.cafeHi.www.user.dto.UserDTO;

public interface UserService {
	public UserDTO getUserId(String find_id);
	public UserDTO getUser(UserDTO user);
	
	
	
	public void insertUser(UserDTO user);
	public void updateUser(UserDTO user);
	public void deleteUser(UserDTO user);
	
	// 정보수정
	public void updateUserId(UserDTO user);
	public void updateUserName(UserDTO user);
	public void updateUserContact(UserDTO user);
	public void updateUserAddress(UserDTO user);
	public void updateUserDetailAddress(UserDTO user);
}

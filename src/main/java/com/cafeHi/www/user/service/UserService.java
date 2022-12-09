package com.cafeHi.www.user.service;

import com.cafeHi.www.user.dto.UserDTO;

public interface UserService {
	public UserDTO getUserId(String find_id);
	public UserDTO getUserById(String user_id);
	public UserDTO getUser(UserDTO user);
	public int idCheck(String user_id);
	
	
	public void insertUser(UserDTO user);
	public void updateUser(UserDTO user);
	public void deleteUser(UserDTO user);
	
	// ��������
	public void updateUserId(UserDTO user);
	public void updateUserName(UserDTO user);
	public void updateUserContact(UserDTO user);
	public void updateUserAddress(UserDTO user);
	public void updateUserDetailAddress(UserDTO user);
	public void updateUserEmail(UserDTO user);
	
	
	
	
}

package com.cafeHi.www.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeHi.www.user.dto.UserDTO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserDTO getUserId(String find_id) {
		if(sqlSessionTemplate.selectOne("UserDAO.getUserId", find_id) != null) {
			
			return sqlSessionTemplate.selectOne("UserDAO.getUserId", find_id);
		}
			return null;
		
	}
	
	public int idCheck(String user_id) {
		int result = sqlSessionTemplate.selectOne("UserDAO.checkId", user_id);
		return result;
	}
	
	
	
	public UserDTO getUser(UserDTO user) {
		return sqlSessionTemplate.selectOne("UserDAO.getUser", user);
	}
	
	public void insertUser(UserDTO user) {
		System.out.println("DAO 매핑");
		sqlSessionTemplate.insert("UserDAO.insertUser", user);
	}

	public void updateUser(UserDTO user) {
		System.out.println(user.getUser_id());
		System.out.println("업데이트 매핑");
		sqlSessionTemplate.update("UserDAO.updateUser", user);;
	}

	public void deleteUser(UserDTO user) {
		sqlSessionTemplate.delete("UserDAO.deleteUser", user);
	}

	public void updateUserId(UserDTO user) {
		sqlSessionTemplate.update("UserDAO.updateUserId", user);
	}

	public void updateUserName(UserDTO user) {
		sqlSessionTemplate.update("UserDAO.updateUserName", user);		
	}

	public void updateUserContact(UserDTO user) {
		sqlSessionTemplate.update("UserDAO.updateUserContact", user);
	}

	public void updateUserAddress(UserDTO user) {
		sqlSessionTemplate.update("UserDAO.updateUserAddress", user);		
	}

	public void updateUserDetailAddress(UserDTO user) {
		sqlSessionTemplate.update("UserDAO.updateUserDetailAddress", user);
	}


	
	
	
}

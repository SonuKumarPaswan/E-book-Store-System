package com.sp.Ebook_App.dao;

import com.sp.Ebook_App.entity.User;

public interface UserDao {

	public User userRegister(User us);

	public User userLogin(String email, String pass);
	
	public boolean checkPassword(int id,String pass);

	public boolean editUserProfile(User user);
	
	public boolean checkUser(String email);
	
//	public boolean updateUserAddress(int id);
}

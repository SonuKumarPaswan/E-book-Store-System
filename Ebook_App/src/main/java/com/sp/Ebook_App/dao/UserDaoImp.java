package com.sp.Ebook_App.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.sp.Ebook_App.entity.User;

public class UserDaoImp implements UserDao {

	private Connection con;

	public UserDaoImp(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public User userRegister(User us) {
		String INSERT_QUERY = "INSERT INTO user(name,email,password,phone) VALUES(?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(INSERT_QUERY);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			ps.setString(4, us.getPhone());

			int count = ps.executeUpdate();
			if (count > 0) {
				return us;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * userLogin method is abstract method of UserDai Interface here, override of
	 * userLogin method
	 */

	@Override
	public User userLogin(String email1, String pass) {
		User user = null;

		try {
			String LOGIN_QUERY = "SELECT * FROM user WHERE email=? AND password=?";
			PreparedStatement ps = con.prepareStatement(LOGIN_QUERY);
			ps.setString(1, email1);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				String phone = rs.getString(5);
				String address = rs.getString(6);
				String landmark = rs.getString(7);
				String city = rs.getString(8);
				String state = rs.getString(9);
				String pincode = rs.getString(10);
				user = new User(id, name, email, password, phone, address, landmark, city, state, pincode);
			}
			return user;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public boolean checkPassword(int id, String pass) {
		String EDIT_USER_PROFILE = "SELECT * FROM user WHERE id=? AND password=?";
		try {
			PreparedStatement ps = con.prepareStatement(EDIT_USER_PROFILE);
			ps.setInt(1, id);
			ps.setString(2, pass);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return false;
	}

	@Override
	public boolean editUserProfile(User u) {
		String EDIT_USER_PROFILE = "UPDATE user SET name=?,email=?, phone=? WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(EDIT_USER_PROFILE);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhone());
			ps.setInt(4, u.getId());
			int i=ps.executeUpdate();
			if(i>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}


@Override
public boolean checkUser(String email) {
	boolean f=true;
	String CHECK_USER = "SELECT * FROM user WHERE email=?";
	try {
		PreparedStatement ps = con.prepareStatement(CHECK_USER);
		ps.setString(1, email);
		 ResultSet rs=ps.executeQuery();
		while(rs.next()) {
		 return f=false;
		}
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	 return f;
}
/*
@Override
public boolean updateUserAddress(int id) {
	String EDIT_USER_PROFILE = "UPDATE user SET name=?,email=?, phone=?,address=?,landmark=?,city=?,state=?,pincode=? WHERE id=? AND password=?";
	try {
		PreparedStatement ps = con.prepareStatement(EDIT_USER_PROFILE);
		ps.setString(1, u.getName());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getPhone());
		ps.setString(4, u.getName());
		ps.setString(5, u.getEmail());
		ps.setString(6, u.getPhone());
		ps.setString(7, u.getEmail());
		ps.setString(8, u.getPhone());
		ps.setInt(9, u.getId());
		ps.setInt(10, u.getId());
		int i=ps.executeUpdate();
		if(i>0) {
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return false;

	return false;
}
*/


}

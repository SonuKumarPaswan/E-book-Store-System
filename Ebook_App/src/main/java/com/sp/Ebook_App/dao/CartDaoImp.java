package com.sp.Ebook_App.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sp.Ebook_App.entity.Cart;

public class CartDaoImp implements CartDao {

	private Connection con;

	public CartDaoImp(Connection con) {
		this.con = con;
	}

	@Override
	public boolean addCart(Cart c) {

		String ADD_CART_QUERY = "INSERT INTO cart(bookId,userId,bookName,author,price,total_price) VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(ADD_CART_QUERY);
			ps.setInt(1, c.getBookId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal_price());

			int i = ps.executeUpdate();
			if (i != 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return false;
	}

	@Override
	public List<Cart> getBookByUserId(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c=null;
		String USER_DETAILS_QUERY = "SELECT * FROM cart WHERE userId=?";
		double totalPrice=0;
		try {
			PreparedStatement ps = con.prepareStatement(USER_DETAILS_QUERY);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCartId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice+=rs.getDouble(7);
				c.setTotal_price(totalPrice);	
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean removeBookByCartId(int cartId) {
		
		String REMOVE_BOOK_QUERY="DELETE FROM cart WHERE cartId=?";
		try {
			PreparedStatement ps=con.prepareStatement(REMOVE_BOOK_QUERY);
			ps.setInt(1, cartId);
			int remove=ps.executeUpdate();
			if(remove>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}

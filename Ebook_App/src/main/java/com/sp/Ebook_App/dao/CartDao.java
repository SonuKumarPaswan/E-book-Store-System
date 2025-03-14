package com.sp.Ebook_App.dao;

import java.util.List;

import com.sp.Ebook_App.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUserId(int userId);
	
	public boolean removeBookByCartId(int cartId);
	

}

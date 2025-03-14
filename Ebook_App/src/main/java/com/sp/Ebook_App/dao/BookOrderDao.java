package com.sp.Ebook_App.dao;

import java.util.List;

import com.sp.Ebook_App.entity.BookOrder;

public interface BookOrderDao {

	public boolean saveOrderBook(List<BookOrder> bo);
	
	public List<BookOrder> getAllOrderBook(String email);
	
	public boolean cancelOrder(int id);
	
	public List<BookOrder> getAllOrder();
}

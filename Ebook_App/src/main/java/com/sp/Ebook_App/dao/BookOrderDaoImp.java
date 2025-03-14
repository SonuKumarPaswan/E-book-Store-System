package com.sp.Ebook_App.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sp.Ebook_App.entity.BookOrder;

public class BookOrderDaoImp implements BookOrderDao {

	private Connection con;

	public BookOrderDaoImp(Connection con) {
		this.con = con;
	}
	

	public boolean saveOrderBook(List<BookOrder> list) {
		boolean f=false;
		String ADD_ORDER_BOOK = "INSERT INTO book_order(orderId,userNmae,email,address,phone,bookName,author,price,paymentType) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(ADD_ORDER_BOOK);
			for (BookOrder  b: list) {
				System.out.println(b.getOrderId());
			ps.setString(1, b.getOrderId());
			ps.setString(2, b.getUserName());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getFullAdd());
			ps.setString(5, b.getPhone());
			ps.setString(6, b.getBookName());
			ps.setString(7, b.getAuthor());
			ps.setDouble(8, b.getPrice());
			ps.setString(9, b.getPaymentType());
			ps.addBatch();
			}
			int[] i=ps.executeBatch();
			for(int b:i) {
				System.out.println(b);
			}
			System.out.println(i.length);
			con.commit();
			f=true;
			con.setAutoCommit(true);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return f;
	}

	 
	@Override
	public List<BookOrder> getAllOrderBook(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;
		String GET_ORDER_BOOK = "SELECT * FROM book_order WHERE email=?";
		try {
			PreparedStatement ps = con.prepareStatement(GET_ORDER_BOOK);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUserName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAdd(rs.getString(5));
				b.setPhone(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	@Override
	public boolean cancelOrder(int id) {
		String CANCEL_ORDER = "DELETE FROM book_order WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(CANCEL_ORDER);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public List<BookOrder> getAllOrder() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;
		String GET_ORDER_BOOK = "SELECT * FROM book_order";
		try {
			PreparedStatement ps = con.prepareStatement(GET_ORDER_BOOK);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUserName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAdd(rs.getString(5));
				b.setPhone(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}


}

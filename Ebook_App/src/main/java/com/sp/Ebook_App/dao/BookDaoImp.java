package com.sp.Ebook_App.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sp.Ebook_App.entity.BookDetails;

public class BookDaoImp implements BookDao {

	private Connection con;

	public BookDaoImp(Connection con) {
		super();
		this.con = con;
	}

	/**
	 * Add the book addBooks method and it's return true when book is add in
	 * database otherwise it's return false.
	 */

	public boolean addBooks(BookDetails b) {
		boolean f = false;
		try {

			String INSERT_BOOKDETAILS_QUERY = "INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photo,email) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(INSERT_BOOKDETAILS_QUERY);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return f;
	}

	/**
	 * By this method get all book from database when Book is available in database.
	 */

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_ALL_BOOK = "SELECT * FROM book_dtls";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_ALL_BOOK);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * You can edit the information of book by the id
	 */

	@Override
	public BookDetails editBook(int id) {
		BookDetails b = null;
		String EDIT_QUERY = "SELECT * FROM book_dtls WHERE bookId=?";

		try {
			PreparedStatement ps = con.prepareStatement(EDIT_QUERY);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
			return b;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * You can update the book details from database by Id
	 */
	@Override
	public boolean updateEditBook(BookDetails b) {

		try {
			String EDIT_BOOK_UPDATE_QUERY = "UPDATE book_dtls SET bookname=?,author=?,price=?,status=? WHERE bookId=?";
			PreparedStatement ps = con.prepareStatement(EDIT_BOOK_UPDATE_QUERY);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int update = ps.executeUpdate();
			if (update > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}

	/**
	 * You want to delete the book details from the web site then by using this
	 * method you can delete the book details form database
	 * 
	 */
	@Override
	public boolean deleteBook(int id) {
		String DELETE_BOOK_QUERY = "DELETE FROM book_dtls WHERE bookId=?";
		try {
			PreparedStatement ps = con.prepareStatement(DELETE_BOOK_QUERY);
			ps.setInt(1, id);
			int f = ps.executeUpdate();
			if (f > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * By using this method show the book details in client side
	 */
	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_NEW = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_NEW);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 8) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Override
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_RECENT = "SELECT * FROM book_dtls WHERE  status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_RECENT);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 8) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Override
	public List<BookDetails> getOldBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_OLD = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_OLD);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 8) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_NEW = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_NEW);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_RECENT = "SELECT * FROM book_dtls WHERE  status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_RECENT);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_OLD = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_OLD);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	/**
	 * Get all Old book. while user has uploaded book
	 */
	@Override
	public List<BookDetails> getOldAllBook(String category, String userEmail) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_OLD = "SELECT * FROM book_dtls WHERE bookCategory=? AND email=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_OLD);
			ps.setString(1, category);
			ps.setString(2, userEmail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	public boolean deleteOldSellBook(int id, String userEmail) {
		String DELETE_SELL_BOOK = "DELETE FROM book_dtls WHERE bookId=? AND email=? ORDER BY bookId DESC";
		try {
			PreparedStatement ps = con.prepareStatement(DELETE_SELL_BOOK);
			ps.setInt(1, id);
			ps.setString(2, userEmail);
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
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		String DISPLAY_BOOK_OLD = "SELECT * FROM book_dtls WHERE bookname like ? or author like ? or price like ? or bookCategory like ? AND status=? ";
		try {
			PreparedStatement ps = con.prepareStatement(DISPLAY_BOOK_OLD);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "%"+ch+"%");
			ps.setString(5, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}

package com.sp.Ebook_App.admin.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookDaoImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/delete_book")
public class BookDeleteController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int id= Integer.parseInt(req.getParameter("id"));
		
		BookDaoImp dao= new BookDaoImp(DbConnection.getDbconnection());
		boolean f=dao.deleteBook(id);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("bookMsg", "Book delete Successfully");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("bookMsg", "Book is not deleted");
			resp.sendRedirect("admin/all_books.jsp");
		}
		
	}
}

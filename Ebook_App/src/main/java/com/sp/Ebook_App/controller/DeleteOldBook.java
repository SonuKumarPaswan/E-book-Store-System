package com.sp.Ebook_App.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/old_book_delete")
public class DeleteOldBook  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String SellBookid=req.getParameter("oid");
			int id=Integer.parseInt(SellBookid.trim());
			String email=req.getParameter("email");
			
			BookDaoImp dao=new BookDaoImp(DbConnection.getDbconnection());
			boolean f=dao.deleteOldSellBook(id, email);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("deletOldS", "Your book had deleted");
				resp.sendRedirect("edit_sell_book.jsp");
			}else {
				session.setAttribute("deletOldS", "Something is wrong on server");
				resp.sendRedirect("edit_sell_book.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}

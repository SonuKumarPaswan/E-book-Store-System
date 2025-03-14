package com.sp.Ebook_App.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.CartDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/remove_book")
public class RemoveBookController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("bid"));
		CartDaoImp dao=new CartDaoImp(DbConnection.getDbconnection());
		boolean f=dao.removeBookByCartId(id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("removeBook", "Book remove from cart");
			resp.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("removeBook", "Something is wrong on server");
			resp.sendRedirect("cart.jsp");
		}
		
	}
}

package com.sp.Ebook_App.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookDaoImp;
import com.sp.Ebook_App.dao.CartDaoImp;
import com.sp.Ebook_App.entity.BookDetails;
import com.sp.Ebook_App.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/cart")
public class CartController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bId=Integer.parseInt(req.getParameter("bId"));
		int uId=Integer.parseInt(req.getParameter("uId"));
		System.out.println(uId);
		
		BookDaoImp dao=new BookDaoImp(DbConnection.getDbconnection());
		BookDetails b=dao.editBook(bId);
		
		Cart cart=new Cart();
		cart.setBookId(bId);
		cart.setUserId(uId);
		cart.setBookName(b.getBookname());
		cart.setAuthor(b.getAuthor());
		cart.setPrice(Double.parseDouble(b.getPrice()));
		cart.setTotal_price(Double.parseDouble(b.getPrice()));
		
		
		CartDaoImp cartdao=new CartDaoImp(DbConnection.getDbconnection());
		boolean f= cartdao.addCart(cart);
		HttpSession session=req.getSession();	
		
		if(f) {
			session.setAttribute("AddtoCart", "Book Add to cart");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("AddtoCart", "Something is wrong on server!");
			resp.sendRedirect("index.jsp");
		}
	}
}

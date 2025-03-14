package com.sp.Ebook_App.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookOrderDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/orderCancel")
public class CancelOrderBook extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int id=Integer.parseInt(req.getParameter("orderId"));
			
			BookOrderDaoImp dao=new BookOrderDaoImp(DbConnection.getDbconnection());
			boolean f=dao.cancelOrder(id);
			if(f) {
				resp.sendRedirect("order.jsp");
			}else {
				resp.sendRedirect("order.jsp");
			}
			
		}
}

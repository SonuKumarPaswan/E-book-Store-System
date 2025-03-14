package com.sp.Ebook_App.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookOrderDaoImp;
import com.sp.Ebook_App.dao.CartDaoImp;
import com.sp.Ebook_App.entity.BookOrder;
import com.sp.Ebook_App.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/productOrder")
public class OrderControllerByUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String payment = req.getParameter("paymet");
			
//			System.out.println(name);
			HttpSession session=req.getSession();
			
			if (payment.equals("noselect")) {
				session.setAttribute("bookOrder", "Select payment method");
				resp.sendRedirect("cart.jsp");
			} else {

				CartDaoImp dao = new CartDaoImp(DbConnection.getDbconnection());
				List<Cart> list = dao.getBookByUserId(id);
				System.out.println(list);
				if(list.size()!=0) {
					System.out.println(list.size());
					
				BookOrderDaoImp dao2 = new BookOrderDaoImp(DbConnection.getDbconnection());
				List<BookOrder> list2 =new ArrayList<BookOrder>();
				BookOrder bo=null;
				
				
				for (Cart cart : list) {
					bo=new BookOrder();
					String bId = "BOOK-ORD"+ (int)((Math.random() + 1) * 1000);
					bo.setOrderId(bId);
					bo.setUserName(name);
					bo.setEmail(email);
					bo.setFullAdd(address);
					bo.setPhone(phone);
					bo.setLandmark(landmark);
					bo.setCity(city);
					bo.setState(state);
					bo.setPincode(pincode);
					bo.setBookName(cart.getBookName());
					bo.setAuthor(cart.getAuthor());
					bo.setPrice(cart.getPrice());
					bo.setPaymentType(payment);
					list2.add(bo);
					System.out.println(list2);
				}

				
				boolean book=dao2.saveOrderBook(list2);

				if (book) {
					session.setAttribute("bookOrder", "Book order Successfully");
					resp.sendRedirect("bookOrderSuccess.jsp");
				} else {
					session.setAttribute("bookOrder", "Something is wrong on server");
					resp.sendRedirect("cart.jsp");
				}
				}else {
					session.setAttribute("bookOrder", "Please Add Item");
					resp.sendRedirect("cart.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

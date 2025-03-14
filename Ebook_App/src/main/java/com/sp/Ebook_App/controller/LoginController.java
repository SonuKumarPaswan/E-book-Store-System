package com.sp.Ebook_App.controller;

import java.io.IOException;


import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.UserDaoImp;
import com.sp.Ebook_App.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value ="/login")
public class LoginController extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		try {
			UserDaoImp dao= new UserDaoImp(DbConnection.getDbconnection());
			HttpSession session=req.getSession();
			
		    String email=req.getParameter("email");
			String pass=req.getParameter("password");

			if(("admin@gmail.com".equals(email)) && ("Admin@123".equals(pass))) {
				User u= new User();
				u.setName("Admin");		
				session.setAttribute("adminObj", u);
				resp.sendRedirect("admin/home.jsp");
			}else {
				User user=dao.userLogin(email, pass);
				if(user!=null) {
					session.setAttribute("userObj", user);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("logObj", "Email and password invalid!");
					resp.sendRedirect("login.jsp");
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}

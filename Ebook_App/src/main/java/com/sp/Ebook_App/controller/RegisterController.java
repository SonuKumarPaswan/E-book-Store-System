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

@WebServlet(value = "/register")
public class RegisterController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String pass = req.getParameter("password");
		String check = req.getParameter("check");

		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(pass);

		HttpSession session = req.getSession();

		if (check != null) {
			UserDaoImp userDaoImp = new UserDaoImp(DbConnection.getDbconnection());
			 boolean f = userDaoImp.checkUser(email);
			if (f) {
				User us = userDaoImp.userRegister(user);

				if (us != null) {
					session.setAttribute("msg", "Registration Successfully!");
					resp.sendRedirect("register.jsp");
				} else {
					session.setAttribute("msg", "Something is  worng on server!!");
					resp.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("msg", "User already exist try another email !");
				resp.sendRedirect("register.jsp");
			}

		} else {
			session.setAttribute("msg", "Please Agree terms and Condition!");
			resp.sendRedirect("register.jsp");
		}

	}
}

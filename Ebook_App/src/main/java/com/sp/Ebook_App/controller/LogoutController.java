package com.sp.Ebook_App.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/logout")
public class LogoutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			session.removeAttribute("adminObj");
			session.removeAttribute("userObj");
			
			HttpSession session2=req.getSession();
			session2.setAttribute("logObj", "Logout out Successfully");
			resp.sendRedirect("./login.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		
		
	}
}

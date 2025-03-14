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

@WebServlet(value = "/editUserProfile")
public class UserProfileEditController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String pass = req.getParameter("password");
		System.out.println(id);
		User u = new User();
		u.setId(id);
		u.setName(name);
		u.setEmail(email);
		u.setPhone(phone);

		UserDaoImp dao = new UserDaoImp(DbConnection.getDbconnection());
		boolean f = dao.checkPassword(id, pass);
		HttpSession session1 = req.getSession();
		System.out.println(f);
		if (f) {

			boolean t = dao.editUserProfile(u);
			System.out.println(t);
			if (t) {
				session1.setAttribute("editUser", "Profile Update Successfully");
				resp.sendRedirect("edit_profile.jsp");
			} else {
				session1.setAttribute("editUser", "Profile is not updated");
				resp.sendRedirect("edit_profile.jsp");
			}
		} else {
			session1.setAttribute("editUser", "Please Enter Currect password");
			resp.sendRedirect("edit_profile.jsp");
		}

	}

}

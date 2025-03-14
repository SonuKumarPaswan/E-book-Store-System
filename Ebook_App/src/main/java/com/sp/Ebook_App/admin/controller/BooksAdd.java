package com.sp.Ebook_App.admin.controller;

import java.io.File;
import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookDaoImp;
import com.sp.Ebook_App.entity.BookDetails;
import com.sp.Ebook_App.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(value = "/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("bname");
		String author = req.getParameter("bauthor");
		String price = req.getParameter("bprice");
		String categories = req.getParameter("bcategories");
		String status = req.getParameter("bstatus");
		Part part = req.getPart("bphoto");
		String photo = part.getSubmittedFileName();

		BookDetails bd = new BookDetails(name, author, price, categories, status, photo, "sonupaswan0381@gmail.com");

		BookDaoImp bdi = new BookDaoImp(DbConnection.getDbconnection());
		boolean book = bdi.addBooks(bd);

//		Create the session
		 HttpSession session = req.getSession();
		if (book) {
			String path = getServletContext().getRealPath("") + "bookImg";
			File file = new File(path);
			part.write(path + File.separator + photo);
			session.setAttribute("book", "Book add Successfully"); 
			resp.sendRedirect("admin/add_books.jsp");
		} else {
			session.setAttribute("book", "Book is not Add");
			resp.sendRedirect("admin/add_books.jsp");
		}
	}
}

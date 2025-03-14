package com.sp.Ebook_App.admin.controller;

import java.io.IOException;

import com.sp.Ebook_App.connection.DbConnection;
import com.sp.Ebook_App.dao.BookDaoImp;
import com.sp.Ebook_App.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/edit_books")
public class EditBook extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("bname");
		String author = req.getParameter("bauthor");
		String price = req.getParameter("bprice");
		String status = req.getParameter("bstatus");
		
		BookDetails b= new BookDetails();
		b.setBookId(id);
		b.setBookname(name);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDaoImp dao=new BookDaoImp(DbConnection.getDbconnection());
		boolean f=dao.updateEditBook(b);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("bookMsg", "Book Update Successfully");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("bookmsg", "Something is wrong");
			resp.sendRedirect("admin/edit_books.jsp");
		}		
		
	}
	
	
	
}

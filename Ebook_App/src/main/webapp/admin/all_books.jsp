<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sp.Ebook_App.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@page import="com.sp.Ebook_App.dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
  	<%@include file="navbar.jsp"%> 

		
		<%User u = (User) session.getAttribute("adminObj"); %>
		
		<%
	   if (u != null) {
	     %>
	
	<h1 class="text-center">Hello : <span class="text-primary"><%=u.getName() %> </span> </h1>
	
	<%if(session.getAttribute("bookMsg")!=null) {%>
		<p class="text-center text-success">
	  <%= session.getAttribute("bookMsg") %>
	</p>
	<%} %>
	
		
	
	<div class="container">
	<table class="table table-hover">
		<thead class="bg-primary">
			<tr class="text-white">
				<th scope="col">id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		
			<%
		BookDaoImp book= new BookDaoImp(DbConnection.getDbconnection());
		List<BookDetails> list =book.getAllBooks();
     	%>
		
	   	<%	for(BookDetails b:list){ %>
		<tr>
				<th scope="row"><%= b.getBookId() %></th>
				 <td><img alt="NoImage" src="../bookImg/<%=b.getPhoto()%>" style="width: 80px; height: 80px;"></td>
				 <td> <%= b.getBookname()%> </td>
				<td><%= b.getAuthor() %></td>
				<td> &#8377; <%= b.getPrice() %></td>
				<td><%= b.getBookCategory() %></td>
				<td><%= b.getStatus() %></td>
				<td>
					<a href="edit_book.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary "><i class="fa-regular fa-pen-to-square"></i> &nbsp;Edit</a>
					<a href="../delete_book?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> &nbsp; Delete</a>
				</td>
			</tr>
		<%} %>	 	
		</tbody>
	</table>
	</div>
   <%	} else { %>
   
	 <%	response.sendRedirect("../login.jsp"); %>
	
	<%}%> 
	
	<div >
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
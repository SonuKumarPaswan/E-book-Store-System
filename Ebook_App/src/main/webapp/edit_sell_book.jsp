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
<title>User : Order old book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>

	<h2 class="text-center text-primary">Your selling book</h2>
	<%if(session.getAttribute("deletOldS")!=null) {%>
			<p class=" text-danger text-center"><i><%=session.getAttribute("deletOldS") %></i> </p>
	<%} %>
	<div class="container">
		<table class="table table-hover bg-white">
			<thead class="bg-success text-white">
				<tr>
					<th scope="col">SN</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">

				<%
				String email = user.getEmail();
				BookDaoImp dao = new BookDaoImp(DbConnection.getDbconnection());
				List<BookDetails> list = dao.getOldAllBook("Old", email);
				int i=1;
				%>
				<%for(BookDetails b:list){ %>
				<tr>
					<th scope="row"><%=i++ %></th>
					<td><%=b.getBookname() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getBookCategory() %></td>
					<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></td>
					<td><a href="old_book_delete?oid= <%=b.getBookId() %> &&email=<%=user.getEmail() %>" type="button" class="btn btn-sm btn-primary">Delete</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<%
	} else {
	%>
	<%
	response.sendRedirect("login.jsp");
	%>
	<%
	}
	%>
</body>
</html>
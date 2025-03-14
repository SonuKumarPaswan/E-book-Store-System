<%@page import="com.sp.Ebook_App.entity.BookDetails"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@page import="com.sp.Ebook_App.dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View : Book details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("bid"));
	BookDaoImp dao = new BookDaoImp(DbConnection.getDbconnection());
	BookDetails b = dao.editBook(id);
	%>


	<div class="container p-2">
		<div class="row mt-4">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="BookImage" src="bookImg/<%=b.getPhoto()%>"
					style="background-size: cover; width: 200px; height: 230px;"
					class="img-thumblin">
				<div class="mt-2">
					<h4>
						Book Name :<span style="color: green;"><%=b.getBookname()%></span>
					</h4>
				</div>
				<div class="mt-2">
					<h4>
						Author Name :<span style="color: blue;"><%=b.getAuthor()%></span>
					</h4>
				</div>
				<div class="mt-2">
					<h4>
						Categories :<span style="color: blue;"> <%=b.getBookCategory()%></span>
					</h4>
				</div>
			</div>


			<div class="col-md-6 text-center p-5 border bg-white ">
				<h2 style="color: green;"><%=b.getBookname()%></h2>
				<div class="row">
					<div class="col-md-4 p-3">
						<h1 class="text-info">
							<i class="fa-solid fa-money-bill-wave"></i>
						</h1>
						<p >Cash On Delivery</p>
					</div>
					<div class="col-md-4 p-3">
						<h1>
							<i class="fa-solid fa-rotate-left"></i>
						</h1>
						<p>Return available</p>
					</div>
					<div class="col-md-4 p-3">
						<h1>
							<i class="fa-solid fa-truck-moving"></i>
						</h1>
						<p>Free Delivery</p>
					</div>
				</div>
				<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<div class="text-center p-3">
					<a type="button" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Contact : </a> <a type="button"
						class="btn btn-danger"><i class="fa-solid fa-envelope"></i> <%=b.getEmail()%></a>
				</div>

				<%
				}
				%>

					<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<div class="text-center p-3">
					<a  href="index.jsp" type="button" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a type="button"
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				
				
				<%}else{ %>
				<div class="text-center p-3">
					<a href="cart.jsp" type="button" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Add Card</a> <a type="button"
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				<%} %>
			</div>

		</div>

	</div>

</body>
</html>
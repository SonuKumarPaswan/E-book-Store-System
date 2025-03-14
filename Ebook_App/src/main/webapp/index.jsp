<%@page import="com.sp.Ebook_App.entity.User"%>
<%@page import="com.sp.Ebook_App.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.sp.Ebook_App.dao.BookDaoImp"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/bok.jpg");
	height: 60vh;
	width: 100%;
	background-size: contain;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<div class="container-fluid back-img mt-1">
		<h2 class="text-center text-warning">
			<i class="fa-solid fa-book-open text-info"></i> Book Management System
		</h2>
	</div>

 
	<!-- Start Recent Book -->

	<div class="container ">
		<h3 class="text-center mt-1">Recent Book</h3>
		<div class="row">
			<%
			BookDaoImp dao = new BookDaoImp(DbConnection.getDbconnection());
			List<BookDetails> list = dao.getRecentBooks();
			for (BookDetails b : list) {
			%>

			<div class="col-md-3">
				<div class="card text-center">
					<div class="card-body">
						<img alt="" src="bookImg/<%=b.getPhoto()%>"
							style="background-size: cover; width: 200px; height: 230px;"
							class="img-thumblin">

						<h4><%=b.getBookname()%></h4>
						<h6><%=b.getAuthor()%></h6>
						<p>
							Categories :<span style="color: green;"> <%=b.getBookCategory()%></span>
						</p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>

						<div class="row mt-4">
							<a href="view_book_details.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-2 "> View Details </a> <a
								href="" class="btn btn-danger btn-sm mt-2"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign mt-2"></i></a>

						</div>
						<%
						} else {
						%>
						<div class="row">

							<%
							if (user != null) {
							%>

							<a href="cart?bId=<%=b.getBookId()%>&&uId=<%=user.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a>
							<%
							} else {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a>
							<%
							}
							%>

							<a href="view_book_details.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-1 "> View Details </a> <a
								href="" class="btn btn-danger btn-sm mt-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-2">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sd text-white"> View All </a>
		</div>
	</div>  

	<!-- End Recent Book -->
	<hr>


	<!-- Start New  Book -->

	<div class="container ">
		<h3 class="text-center mt-1">New Book</h3>
		<div class="row">

			<%
			BookDaoImp dao1 = new BookDaoImp(DbConnection.getDbconnection());
			List<BookDetails> list1 = dao1.getNewBooks();
			for (BookDetails b : list1) {
			%>
			<div class="col-md-3">
				<div class="card text-center">
					<div class="card-body">
						<img alt="" src="bookImg/<%=b.getPhoto()%>"
							style="background-size: cover; width: 200px; height: 230px;"
							class="img-thumblin">

						<h4><%=b.getBookname()%></h4>
						<h6><%=b.getAuthor()%></h6>
						<p>
							Categories :<span style="color: green;"> <%=b.getBookCategory()%></span>
						</p>
						<div class="row">
							<%
							if (user != null) {
							%>

							<a href="cart?bId=<%=b.getBookId()%>&&uId=<%=user.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a>
							<%
							} else {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a>
							<%
							}
							%>
							<a href="view_book_details.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-1 "> View Details </a> <a
								href="" class="btn btn-danger btn-sm mt-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>

		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sd text-white">
				View All </a>
		</div>
	</div>

	<!-- End New Book -->

	<hr>
	<!-- Start Old Book  -->
	<div class="container ">
		<h3 class="text-center mt-1">Old Book</h3>
		<div class="row">
			<%
			BookDaoImp dao2 = new BookDaoImp(DbConnection.getDbconnection());
			List<BookDetails> list2 = dao2.getOldBooks();
			for (BookDetails b : list2) {
			%>


			<div class="col-md-3">
				<div class="card text-center">
					<div class="card-body">
						<img alt="" src="bookImg/<%=b.getPhoto()%>"
							style="background-size: cover; width: 200px; height: 230px;"
							class="img-thumblin">

						<h4><%=b.getBookname()%></h4>
						<h6><%=b.getAuthor()%></h6>
						<p>
							Categories :<span style="color: green;"> <%=b.getBookCategory()%></span>
						</p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>

						<div class="row mt-4">
							<a href="view_book_details.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-2 "> View Details </a> <a
								href="" class="btn btn-danger btn-sm mt-2"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign mt-2"></i></a>

						</div>
						<%
						} else {
						%>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a> <a
								href="view_book_details.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-1 "> View Details </a> <a
								href="" class="btn btn-danger btn-sm mt-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sd text-white">
				View All </a>
		</div>
	</div>

	<!-- End old Book -->



	<%@include file="all_component/footer.jsp"%>
</body>
</html>
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
<title>ALL : OLD BOOKS</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

	<div class="container">
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
						<img alt="BookImage" src="bookImg/<%=b.getPhoto()%>"
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
							<a href="view_book_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mt-2 "> View Details
							</a> <a href="" class="btn btn-danger btn-sm mt-2"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign mt-2"></i></a>

						</div>
						<%
						} else {
						%>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add to Card</a> <a href="view_book_details.jsp?bid=<%=b.getBookId() %>"
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
	</div>

	<!-- End old Book -->



	<%@include file="all_component/footer.jsp"%>
</body>
</html>
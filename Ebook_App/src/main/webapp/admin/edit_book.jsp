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
<title>Admin : Add books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImp book = new BookDaoImp(DbConnection.getDbconnection());
	BookDetails b = book.editBook(id);
	%>

	<div class="container pt-2">

		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mb-3">
					<div class="card-body ">
						<h3 class="text-center">Add Books</h3>
						<%if(session.getAttribute("bookmsg")!=null){ %>
						<p class="text-center">
							<i><%=session.getAttribute("bookmsg")%> </i>
						</p>
						<%} %>
						<form action="../edit_books" method="post">
						
							<div class="form-group p-2">
								<label for="bookId">Book Id</label> <input type="text"
									name="id" class="form-control" id="bookId" readonly="readonly"
									value="<%=b.getBookId()%>" aria-errormessage="emailHelp">
							</div>

							<div class="form-group p-2">
								<label for="book">Book Name*</label> <input type="text"
									name="bname" class="form-control" id="book" required="required"
									value="<%=b.getBookname()%>" aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="author">Author*</label> <input type="text"
									name="bauthor" class="form-control" id="author" required="required"
									value="<%=b.getAuthor()%>" aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="price">Price*</label> <input type="text"
									name="bprice" class="form-control" id="price" required="required"
									value="<%=b.getPrice()%>" aria-errormessage="emailHelp">
							</div>

							<div class="form-group p-1">
								<label for="status">Status</label> <select name="bstatus"
									id="status" class="form-control" aria-errormessage="emailHelp">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary mt-2">Edit</button>

						</form>

					</div>
				</div>
			</div>


		</div>
	</div>


	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
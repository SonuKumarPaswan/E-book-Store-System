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
	User u = (User) session.getAttribute("adminObj");
	if (u != null) {
	%>
	
	<div class="container pt-2">

		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mb-3">
					<div class="card-body ">
						<h3 class="text-center">Add Books</h3>
						<%
						if (session.getAttribute("book") != null) {
						%>
						<p class="text-center">
							<%=session.getAttribute("book")%>
						</p>
						<%
						}
						%>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">

							<div class="form-group p-2">
								<label for="book">Book Name*</label> <input type="text"
									name="bname" class="form-control" id="book" required="required"
									aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="author">Author Name*</label> <input type="text"
									name="bauthor" class="form-control" id="author" required="required"
									aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="price">Price*</label> <input type="text"
									name="bprice" class="form-control" id="price" required="required"
										placeholder="Accepted in Rupees" aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="categori">Book Categories*</label> <select
									name="bcategories" id="categori" class="form-control" required="required"
									aria-errormessage="emailHelp">
									<option selected>---select--</option>
									<option value="New">New Book</option>
									<option value="Recent">Recent Book</option>
									<option value="Old">Old Book</option>
								</select>
							</div>
							<div class="form-group p-1">
								<label for="status">Book Status</label> <select name="bstatus" required="required"
									id="status" class="form-control" aria-errormessage="emailHelp">
									<option selected >---select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group p-1">
								<label for="photo">Upload Photo</label> <input type="file"
									name="bphoto" class="form-control-file" id="photo"
									aria-errormessage="emailHelp" required="required">
							</div>

							<button type="submit" class="btn btn-primary mt-2">Add Book</button>
							<a  href="all_books.jsp" type="button" class="btn btn-primary mt-2">View Book</a>

						</form>

					</div>
				</div>
			</div>


		</div>
	</div>

	<%
	} else {
	%>
	<%
	response.sendRedirect("../login.jsp");
	%>
	<%
	}
	%>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
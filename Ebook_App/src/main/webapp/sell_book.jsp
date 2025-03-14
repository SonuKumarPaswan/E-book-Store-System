<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell : Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>
	<div class="container">
		<div class="row p-3 ">
			<div class="col-md-4 offset-md-4">
				<div class="card  ">
					<div class="card-body p-4">
						<h3 class="text-center text-primary">Sell Old Books</h3>
						<%
						if (session.getAttribute("book") != null) {
						%>
						<p class="text-center">
							<i> <%=session.getAttribute("book")%>
							</i>
						</p>
						<%
						}
						%>
						<form action="add_oldBook" method="post"
							enctype="multipart/form-data">

							<div class="form-group p-2">
								<label for="book">Book Name*</label> <input type="text"
									name="bname" class="form-control" id="book" required="required"
									aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="author">Author Name*</label> <input type="text"
									name="bauthor" class="form-control" id="author"
									required="required" aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="price">Price*</label> <input type="number"
									name="bprice" class="form-control" id="price"
									required="required" placeholder="Accepted in Rupees"
									aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<input type="hidden" name="email" class="form-control"
									required="required" value="<%=user.getEmail()%>"
									aria-errormessage="emailHelp">
							</div>
							<div class="form-group p-1">
								<label for="photo">Upload Photo</label> <input type="file"
									name="bphoto" class="form-control-file" id="photo"
									aria-errormessage="emailHelp" required="required">
							</div>

							<button type="submit" class="btn btn-success mt-2">Add
								Book</button>
							<a href="index.jsp" type="button" class="btn btn-primary mt-2">View
								Book</a>

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
	response.sendRedirect("login.jsp");
	%>
	<%
	}
	%>
</body>
</html>
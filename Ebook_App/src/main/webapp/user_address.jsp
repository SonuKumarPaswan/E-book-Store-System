<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-primary">Add Address</h2>
						
						<form action="#?id=<%=user.getId() %>" method="get">
							  <div class="row m-4 p-2">
								<div class="form-group col-md-6">
									<label for="inputlable4">Address</label> <input type="text"
									value="<%=user.getAddress()%>"	id="inputlable4" name="" class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputlable4">Landmark</label> <input type="text"
									value="<%=user.getLandmark()%>"	id="inputlable4" name="" class="form-control">
								</div>

							</div>


							<div class="row m-4 p-2">
								
								<div class="form-group col-md-4">
									<label for="inputlable4">City</label> <input type="text"
										value="<%=user.getCity() %>" id="inputlable4" name="" class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="inputlable4">State</label> <input type="text"
										value="<%=user.getState()%>" id="inputlable4" name="" class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="inputlable4"> Pin code </label> <input type="text"
									value="<%=user.getPincode()%>"	id="inputlable4" name="" class="form-control">
								</div>

							</div>

							<div class="text-center m-4">
								<button class="btn btn-success col-md-4 m-1 ">Add address</button>
								<a href="index.jsp" type="button"
									class="btn btn-primary col-md-4 m-1">Continue Shopping</a>
							</div>
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
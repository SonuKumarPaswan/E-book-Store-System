<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting : User</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

<%if(user!=null){ %>
	<div class="container">
		<h2 class="text-center">
			Welcome : <span style="color: purple;"><%=user.getName() %></span>
		</h2>
		<div class="row p-5">
			<div class="col-md-4 ">
				<a href="sell_book.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h3>Sell Old Book</h3>
						</div>

					</div>

				</a>
			</div>
			
			<div class="col-md-4 ">
				<a href="edit_sell_book.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h3> Old Book</h3>
						</div>

					</div>

				</a>
			</div>

			<div class="col-md-4 ">
				<a href="edit_profile.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-pen-to-square fa-3x text-info"></i>
							<h4>Edit Profile</h4>
						</div>

					</div>

				</a>
			</div>

		</div>

		<div class="row">
			<div class="col-md-4">
				<a href="user_address.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-location-dot fa-3x text-warning"></i>
							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>

					</div>

				</a>
			</div>


			<div class="col-md-4">
				<a href="order.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-truck fa-3x text-danger"></i>
							<h4>My Order</h4>
							<p>Track your Order</p>
						</div>

					</div>

				</a>
			</div>


			<div class="col-md-4">
				<a href="helpline.jsp">
					<div class="card text-center ">
						<div class="card-body p-4">
							<i class="fa-solid fa-circle-user fa-3x text-success"></i>
							<h4>Help Center</h4>
							<p>24x7 service</p>
						</div>

					</div>

				</a>
			</div>

		</div>

	</div>
	<%}else{ %>
	<%response.sendRedirect("login.jsp"); %>
	<%} %>

</body>
</html>
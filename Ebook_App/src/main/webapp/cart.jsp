<%@page import="java.util.List"%>
<%@page import="com.sp.Ebook_App.entity.Cart"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@page import="com.sp.Ebook_App.dao.CartDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart : Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	if (session.getAttribute("userObj") != null) {
	%>
	<%
	if (session.getAttribute("removeBook") != null) {
	%>
	<p class="text-center text-info">
		<i><%=session.getAttribute("removeBook")%></i>
	</p>
	<%
	}
	%>



	<div class="container pb-2">
		<div class="row pt-3">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body ">
						<h2 class="text-success text-center">Your Selected Items</h2>
						<hr>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								CartDaoImp dao = new CartDaoImp(DbConnection.getDbconnection());
								List<Cart> list = dao.getBookByUserId(user.getId());
								double totalPrice = 0;
								for (Cart c : list) {
									totalPrice += c.getPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%> <i
										class="fa-solid fa-indian-rupee-sign"></i></td>
									<td><a href="remove_book?bid=<%=c.getCartId()%>"
										type="button" class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td colspan="2" class="text-center text-success">
										<h5>Total Price</h5>
									</td>
									<td colspan="2"><%=totalPrice%> <i
										class="fa-solid fa-indian-rupee-sign"></i></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>

			</div>


			<div class="col-md-6">
				<div class="card ">
					<div class="card-body">
						<h2 class="text-center text-success">Your details for Order</h2>

						<%
						if (session.getAttribute("bookOrder") != null) {
						%>
						<p class="text-center"><%=session.getAttribute("bookOrder")%></p>

						<%
						}
						%>
						<form action="productOrder" method="post">
							<div class="form-group col-md-6">
								<input type="hidden" name="id" value="<%=user.getId()%>"
									class="form-control">
							</div>
							<div class="row m-2">
								<div class="form-group col-md-6">
									<label for="inputlable4">Name</label> <input type="text" required="required"
										name="name" id="inputlable4" value="<%=user.getName()%>"
										class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputlable4">Email</label> <input type="email" required="required"
										name="email" id="inputlable4" value="<%=user.getEmail()%>"
										class="form-control">
								</div>

							</div>

							<div class="row m-2">
								<div class="form-group col-md-6">
									<label for="inputlable4">Mobile No</label> <input type="number" required="required"
									maxlength="10"	name="phone" id="inputlable4" value="<%=user.getPhone()%>"
										class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputlable4">Address</label> <input type="text" required="required"
										id="inputlable4" name="address" class="form-control">
								</div>

							</div>


							<div class="row m-2">
								<div class="form-group col-md-6">
									<label for="inputlable4">Landmark</label> <input type="text" required="required"
										id="inputlable4" name="landmark" class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputlable4">City</label> <input type="text" required="required"
										id="inputlable4" name="city" class="form-control">
								</div>

							</div>

							<div class="row m-2">
								<div class="form-group col-md-6">
									<label for="inputlable4">State</label> <input type="text"
										id="inputlable4" name="state" class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputlable4"> Pin code </label> <input type="text"
										id="inputlable4" name="pincode" class="form-control">
								</div>

							</div>


							<div class="form-group m-2 p-2">
								<label>Payment Mode</label> <select class="form-control"
									name="paymet">
									<option value="noselect">---select---</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>

							<div class="text-center m-2">
								<button type="submit" class="btn btn-warning col-md-4 m-1">Order
									Now</button>
								<a href="index.jsp" type="button"
									class="btn btn-success col-md-4 m-1">Continue Shopping</a>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>

	</div>
	<%@include file="admin/footer.jsp"%>
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
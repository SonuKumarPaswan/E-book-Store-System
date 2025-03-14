<%@page import="com.sp.Ebook_App.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@page import="com.sp.Ebook_App.dao.BookOrderDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order : View</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>

	<div class="container ">
		<h3 class="text-center text-success p-2">Your Order !</h3>
		<%
		if (session.getAttribute("bookOrder") != null) {
		%>
		<p class="text-center text-success">
			<i><%=session.getAttribute("bookOrder")%></i>
		</p>
		<%
		}
		%>

		<table class="table table-hover table-striped ">
			<thead class="bg-primary">
				<tr class="text-white">
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Cancel Order</th>
				</tr>
			</thead>
			<tbody>

				<%
				String email = user.getEmail();
				BookOrderDaoImp dao = new BookOrderDaoImp(DbConnection.getDbconnection());
				List<BookOrder> list = dao.getAllOrderBook(email);
				%>
				<%
				for (BookOrder b : list) {
				%>
				<tr>
					<th class="text-center"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
					<td><a href="orderCancel?orderId=<%=b.getId() %>" type="button"
						class="btn btn-sm btn-danger"> Order Cancel</a></td>
				</tr>
				<%
				}
				%>
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
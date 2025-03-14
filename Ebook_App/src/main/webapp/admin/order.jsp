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
<title>Admin:order Book</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="text-center">Order Book</h1>

	<%
	User u = (User) session.getAttribute("adminObj");
	if (u != null) {
	%>
	<div class="container">
		<table class="table table-hover">
			<thead class="bg-primary">
				<tr class="text-white">
					<th scope="col">SNo</th>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone no</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment</th>
					
				</tr>
			</thead>
			<tbody>
			<%
				BookOrderDaoImp dao=new BookOrderDaoImp(DbConnection.getDbconnection());
				List<BookOrder>list=dao.getAllOrder();
				int i=1;
				for(BookOrder b:list){
			%>
			
				<tr>
				   <th scope="row"><%=i++ %></th>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFullAdd() %></td>
					<td><%=b.getPhone() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
				
				<%} %>
				
			</tbody>
		</table>
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
	<%-- <div >
		<%@include file="footer.jsp"%>
	</div> --%>
</body>
</html>
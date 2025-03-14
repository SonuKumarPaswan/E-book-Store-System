<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help : User</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>
	<div class="container p-5">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="text-center">
					<i class="fa-solid fa-phone-volume fa-5x text-success"></i>
					<h2 class="mt-5">24x7 Service</h2>
					<h3>Help line Number</h3>
					<h4>+91 99987 23 645</h4>
					<a href="index.jsp" type="button" class="btn  btn-primary mt-2">Home</a>
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
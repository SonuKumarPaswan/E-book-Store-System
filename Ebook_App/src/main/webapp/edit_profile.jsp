<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit : progfile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user != null) {
	%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-warning">Edit Profile</h2>
						<%
						if (session.getAttribute("editUser") != null){
						%>
						<p class="text-center text-success">
							<i><%=session.getAttribute("editUser")%></i>
						</p>
						<%} %>
						<form action="editUserProfile" method="post">

							<div class="mb-1">
								<input type="hidden" class="form-control"
									name="id" value="<%=user.getId()%>">
							</div>

							<div class="mb-1">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" name="name"
									value="<%=user.getName()%>" id="name" required="required"
									aria-describedby="emailHelp">
							</div>

							<div class="mb-1">
								<label for="email" class="form-label">Email </label> <input
									type="email" class="form-control" name="email" id="email"
									value="<%=user.getEmail()%>" required="required"
									aria-describedby="emailHelp" required="required" />
							</div>

							<div class="mb-1">
								<label for="phone" class="form-label">Phone </label> <input
									type="number" class="form-control" name="phone" id="phone"
									value="<%=user.getPhone()%>" required="required"
									aria-describedby="emailHelp">
							</div>

							<div class="mb-1">
								<label for="passwor" class="form-label">Password</label> <input
									type="password" class="form-control" id="passwor"
									placeholder="Enter old password" required="required"
									name="password" required="required" />
							</div>

							<button type="submit" class="btn btn-primary ">Update</button>
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
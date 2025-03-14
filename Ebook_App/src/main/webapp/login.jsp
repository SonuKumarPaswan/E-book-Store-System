<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container ">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-body ">
						<h2 class="text-center">Login Form</h2>
						<%if(session.getAttribute("logObj")!=null) {%>
						<p class="text-center"> <i><%= session.getAttribute("logObj") %>  </i> </p> 
						<%} %>
						<form action="login" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email </label> <input
									type="email" class="form-control" name="email" id="email"
									aria-describedby="emailHelp" required="required">
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" required="required" />
							</div>
							<div class=" text-center ">
								<button type="submit" class="btn btn-primary text-center">Login</button>
								<br>
							</div>
							<div class=" text-center mt-2">
								<a href="register.jsp">Create New Account</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <%@include file="all_component/footer.jsp"%> --%>
</body>
</html>
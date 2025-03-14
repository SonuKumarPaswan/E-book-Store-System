<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2 ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card ">
					<div class="card-body ">
						<h2 class="text-center">Register Form</h2>
						<%
						if (session.getAttribute("msg") != null) {
						%>
						<p class="text-center text-success">
							<i><%=session.getAttribute("msg")%> </i>
						</p>

						<%
						}
						%>

						<form action="register" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" name="name" id="name"
									required="required" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email </label> <input
									type="email" class="form-control" name="email" id="email"
									required="required" aria-describedby="emailHelp"
									required="required" />
							</div>

							<div class="mb-3">
								<label for="phone" class="form-label">Phone </label> <input
									type="number" class="form-control" name="phone" id="phone"
									required="required" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									required="required" name="password" required="required" />
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms &amp; Condition </label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-success">Reset</button>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
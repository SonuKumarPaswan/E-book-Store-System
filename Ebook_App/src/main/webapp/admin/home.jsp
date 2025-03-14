<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: back;
}

a:hover {
	text-decoration: none;
	color: back;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container mt-4">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp" >
					<div class="card">
						<div class="card-body text-center  text-primary">
							<i class="fas fa-plus-square fa-3x"></i>
							<h3>Add Books</h3>
							<h3>------------</h3>
						</div>

					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp" >
					<div class="card">
						<div class="card-body text-center  text-info">
							<i class="fas fa-book-open fa-3x"></i>
							<h3>All Books</h3>
							<h3>------------</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="order.jsp" >
					<div class="card">
						<div class="card-body text-center text-warning">
							<i class="fas fa-box-open fa-3x "></i>
							<h3>Order</h3>
							<h3>------------</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" >
					<div class="card">
						<div class="card-body text-center ">
							<h1 class="text-success">
								<i class="fa-solid fa-right-to-bracket "></i>
							</h1>
							<h3>Logout</h3>
							<h3>------------</h3>
						</div>
					</div>
				</a>
			</div>


			<!-- Button trigger modal -->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog ">
					<div class="modal-content ">
						<div class="modal-header ">
							<h1 class="modal-title fs-5 " id="exampleModalLabel">Do you
								want to logout!</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body text-center">
							<div class="mt-3">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<a href="../logout" type="button" class="btn btn-primary">Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div style="margin-top: 190px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
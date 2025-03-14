<%@page import="com.sp.Ebook_App.entity.User"%>
<div class="container-fluid"
	style="height: 6px; background-color: #3f51b5;"></div>



  <div class="container-fluid p-3">
	<div class="row">

		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book text-info"></i> Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>

		<div class="col-md-3">
			<%
			if(session.getAttribute("adminObj") != null) {
			%>
			<a  class="btn btn-success"><i
				class="fa-solid fa-user-large"></i> Admin </a>
			<a data-bs-toggle="modal" data-bs-target="#exampleModal"
				class="btn btn-primary text-white"><i
				class="fa-solid fa-right-to-bracket "></i> Logout </a>

			<%
			} else {
			%>
			<a href="../login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="../register.jsp" class="btn btn-primary text-white"><i
				class="fa-solid fa-user-plus"></i> Register</a>
			<%
			}
			%>

		</div>
	</div>
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




<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="../index.jsp"><i
			class="fa-solid fa-house-chimney"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>
			</ul>
		</div>
		<div>
			<%-- <h4 class="text-center text-white">
				Welcome : <i><%=session.getAttribute("logObja")%> </i>
			</h4> --%>
		</div>
	</div>
</nav>
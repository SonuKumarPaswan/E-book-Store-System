<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order : successfull </title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp"%>
		<div class="container p-3">
			<div class="row text-center p-5">
			<i class="fa-solid fa-circle-check fa-5x text-success"></i>
				<h1>Thank You</h1>
				<h3>Your Order Successfully</h3>
				<h6>With in 7 Days Your Product will be Delivered in Your Address</h6>
					<div class="text-center mt-3">
					<a href="index.jsp" class="btn btn-md btn-primary">Home</a>
					<a href="order.jsp" class="btn btn-md btn-success">View Order</a>
			</div>
			</div>
		
		</div>
</body>
</html>
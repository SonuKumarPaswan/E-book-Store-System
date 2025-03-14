<%@page import="com.sp.Ebook_App.controller.LoginController"%>
<%@page import="com.sp.Ebook_App.connection.DbConnection"%>
<%@page import="com.sp.Ebook_App.dao.UserDaoImp"%>
<%@page import="com.sp.Ebook_App.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Home </title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<h3>Home</h3>
		<h2> <%=user.getName() %></h2>
	   <h2> <%=user.getEmail() %></h2>
	   <h2> <%=user.getPhone() %></h2>
	   <h2> <%=user.getPassword() %></h2>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<style>
#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	text-align: center;
	width: 80%;
	margin: auto;
}

#table td, #table th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table tr:nth-child(even) {
	background-color: #f2f2f2;
}

#table tr:hover {
	background-color: #ddd;
}

#table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #04AA6D;
	color: white;
}
</style>
<title>Home Page</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Welcome to AJR Video!</h1>
						<br> <a class="btn btn-outline-light btn-lg" href="addMovie"
							role="button">Add a Movie</a> <a
							class="btn btn-outline-light btn-lg" href="movieList"
							role="button">Display Movies</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card col text-center" style="background-color: rgba(135,206,250);">
			<table class="table">
				<c:forEach var="eachCustomer" items="${customers}">
					<c:url var="loginLink" value="history">
						<c:param name="customerId" value="${eachCustomer.customerId}" />
					</c:url>
					<tr>
						<td><a href="${loginLink}" class="text-dark"> Login as
								${eachCustomer.firstName}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<br>
<br>
<br>
<footer class="bg-light text-center text-lg-start">
	<div class="text-center p-3"
		style="background-color: rgba(30, 144, 255);">
		© 2021 Copyright: <a class="text-light" href="http://www.ajr.com/">www.AJR.com</a>
	</div>
</footer>
<br><br><br>
</html>
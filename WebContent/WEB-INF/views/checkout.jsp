<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
<title>Checkout</title>
</head>
<body>

	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Checkout a Movie
							for:&nbsp;${customer.firstName}&nbsp;${customer.lastName}</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container pd-3">
		<div class="card">
			<table class="table">
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Rating</th>
					<th>Available Quantity</th>
				</tr>
				<c:forEach var="eachMovie" items="${movies}">
					<c:url var="processCheckoutLink" value="/home/processCheckout">
						<c:param name="customerId" value="${customer.customerId}" />
						<c:param name="movieId" value="${eachMovie.movieId}" />
					</c:url>
					<tr>
						<td>${eachMovie.title}</td>
						<td>${eachMovie.description}</td>
						<td>${eachMovie.rating}</td>
						<td>${eachMovie.length}</td>
						<td>${eachMovie.availableQuantity}</td>
						<td><c:if test="${eachMovie.availableQuantity > 0}">
								<a href="${processCheckoutLink}"
									class="btn btn-primary btn-sm active">Checkout Movie</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="card">
			<form action="checkout" method="get">
				<input type="hidden" name="customerId"
					value="${customer.customerId}" /> <input type="text"
					name="searchStr" /> <input type="submit"
					class="btn btn-primary btn-sm active" value="Search Movies" />
			</form>
			<form action="checkout" method="get">
				<input type="hidden" name="customerId"
					value="${customer.customerId}" /> <input type="hidden"
					name="searchStr" value="%" class="btn btn-primary btn-sm active" />
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/home/customerList"
					class="btn btn-primary btn-sm active">Back To Customer List</a>
			</div>
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
</html>
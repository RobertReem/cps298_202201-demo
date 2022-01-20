<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
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
<title>Customer List</title>
</head>
<body>

	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Customer List</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card">
			<div class="card-body"></div>
			<table class="table">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
				</tr>
				<c:forEach var="eachCustomer" items="${customers}">
					<c:url var="checkoutLink" value="/home/checkout">
						<c:param name="customerId" value="${eachCustomer.customerId}" />
					</c:url>
					<c:url var="returnLink" value="/home/return">
						<c:param name="customerId" value="${eachCustomer.customerId}" />
					</c:url>
					<c:url var="historyLink" value="/home/history">
						<c:param name="customerId" value="${eachCustomer.customerId}" />
					</c:url>
					<tr>
						<td>${eachCustomer.firstName}</td>
						<td>${eachCustomer.lastName}</td>
						<td>${eachCustomer.email}</td>
						<td><a href="${checkoutLink}"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true">Checkout Movie</a></td>
						<td><a href="${returnLink}"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true">Return Movie</a></td>
						<td><a href="${historyLink}"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true">History</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<c:url var="movieListLink" value="/home/movieList">
			<c:param name="searchStr" value="%" />
		</c:url>
		<br> <br> <br> <br>
		<form:form action="http://localhost:8080/mp7/api/movie"
			modelAttribute="restDataHolder" method="get">
			<div class="form-group-row">
				<label for="titleSearchBoot" class="col-sm-3 col-form-label">Title
					Search</label>
				<form:input path="movieTitle" placeholder="Enter Title" />
				<input type="submit" class="btn btn-primary btn-sm active"
					value="Click Here" />
			</div>

			<div class="form-group-row">
				<label for="descSearchBoot" class="col-sm-3 col-form-label">Description
					Search</label>
				<form:input path="movieDescription" placeholder="Enter Desc" />
				<input type="submit" class="btn btn-primary btn-sm active"
					value="Click Here" />
			</div>
		</form:form>

		<form:form action="http://localhost:8080/mp7/api/history"
			modelAttribute="restDataHolder" method="get">

			<div class="form-group-row">
				<label for="custoSearch" class="col-sm-3 col-form-label">Customer
					Search</label>
				<form:input path="customerId" />
				<input type="submit" class="btn btn-primary btn-sm active"
					value="Click Here" />
			</div>

			<div class="form-group-row">
				<label for="movieListLink" class="col-sm-5 col-form-label">Display
					Movie List</label> <a href="${movieListLink}"
					class="btn btn-primary btn-sm active" role="button"
					aria-pressed="true">Click Here</a>
			</div>
		</form:form>
	</div>
</body>
<br><br><br>
<footer class="bg-light text-center text-lg-start">
	<div class="text-center p-3"
		style="background-color: rgba(30,144,255);">
		© 2021 Copyright: <a class="text-light" href="http://www.ajr.com/">www.AJR.com</a>
	</div>
</footer>
</html>
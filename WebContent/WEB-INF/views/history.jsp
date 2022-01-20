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
<title>History</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">${customer.firstName}&nbsp;${customer.lastName}'s
							Account History</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card" style="background-color: rgba(135, 206, 250);">
			<table class="table">
				<tr style="background-color: rgba(0, 191, 255);">
					<th>Checkout ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Checkout Time</th>
					<th>Return Time</th>
					<th>Return Movie</th>
				</tr>
				<c:forEach var="eachCheckout" items="${customer.checkouts}">
					<tr">
						<td>${eachCheckout.checkoutId}</td>
						<td><c:url var="movieTitleLink" value="/home/movieLink">
								<c:param name="movieId" value="${eachCheckout.movie.movieId}" />
							</c:url> <a href="${movieTitleLink}" class="text-bright">${eachCheckout.movie.title}</a></td>
						<td>${eachCheckout.movie.description}</td>
						<td>${eachCheckout.checkoutTime}</td>
						<td>${eachCheckout.returnTime}</td>
						<td><c:if test="${eachCheckout.returned == 0}">
								<c:url var="processReturnBtn" value="/home/processReturn">
									<c:param name="customerId"
										value="${eachCheckout.customer.customerId}" />
									<c:param name="movieId" value="${eachCheckout.movie.movieId}" />
									<c:param name="checkoutId" value="${eachCheckout.checkoutId}" />
								</c:url>
								<a href="${processReturnBtn}"
									class="btn btn-primary btn-sm active" role="button"
									aria-pressed="true">Return Movie</a>

							</c:if> <c:if test="${eachCheckout.returned == 1}">
								<c:set var="returned" value="Returned"></c:set>
							</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<table class="table col text-center">
			<tr>
				<td>
					<div class="form-group-row">
						<c:url var="searchForMovie" value="/home/searchForMovie">
							<c:param name="customerId" value="${customer.customerId}" />
						</c:url>
						<a href="${searchForMovie}" class="btn btn-primary btn-sm active"
							role="button" aria-pressed="true">Search For Movie</a> <a
							href="${pageContext.request.contextPath}/home/customerList"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true">Back to Main</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group-row"></div>
				</td>
			</tr>
		</table>
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
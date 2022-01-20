<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<title>Process Checkout</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Checkout Notification</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div>
		<div class="container">
			<div class="card"  style="background-color: rgba(135,206,250);">
				<table class="table">
					<tr>
						<td>
							<div class="form-group-row" style="text-align: center;">
								<h2>${customer.firstName}&nbsp;${customer.lastName}&nbsp;has
									checked out:</h2>
								<h3>${movie.title}</h3>
								<div class="form-group-row"
									style="width: 230px; margin: 0 auto;">
									<a href="${pageContext.request.contextPath}/home/customerList"
										class="btn btn-primary btn-sm active" role="button"
										aria-pressed="true">Back to Main</a>
								</div>
							</div>
						</td>
					</tr>
				</table>
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
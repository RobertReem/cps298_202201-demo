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
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1>Search For Movie</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card col text-center"
			style="padding-bottom: 8px; background-color: rgba(135,206,250);">
			<br>
			<h3>Search By:</h3>
			<br>
			<form:form action="displayMovieSearchResults"
				modelAttribute="restDataHolder" method="get">
				<form action="showMovie">
					<div>
						<input type="radio" name="searchByTitleOrDesc" value="title" /><b>Title</b>
						<input type="radio" name="searchByTitleOrDesc" value="descption" /><b>Description</b>
					</div>
					<input type="text" name="searchStr" /> <input type="hidden"
						name="customerId" value="${customerId}"> <br>
					<div style="padding-top: 3px;">
						<br> <input type="submit"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true" value="Search" />
					</div>
				</form>
			</form:form>
			<br>
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
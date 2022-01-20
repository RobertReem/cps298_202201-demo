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
<title>Movie List</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Movie Details</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container ">
		<div class="card" style="background-color: rgba(135, 206, 250);">
			<table class="table">
				<tr style="background-color: rgba(0, 191, 255);">
					<th>Movie Id</th>
					<th>Title</th>
					<th>Description</th>
					<th>Year Made</th>
					<th>Movie Length</th>
					<th>Release Date</th>
					<th>Rating</th>
					<th>Genre</th>
					<th>Total Quantity</th>
					<th>Available Quantity</th>
				</tr>
				<c:forEach var="eachMovie" items="${movies}">
					<tr>
						<td>${eachMovie.movieId}</td>
						<td><c:url var="movieTitleLink" value="/home/movieLink">
								<c:param name="movieId" value="${eachMovie.movieId}" />
							</c:url> <a href="${movieTitleLink}" class="text-bright">${eachMovie.title}</a></td>
						<td>${eachMovie.description}</td>
						<td>${eachMovie.year}</td>
						<td>${eachMovie.length}</td>
						<td>${eachMovie.releaseDate}</td>
						<td>${eachMovie.rating}</td>
						<td>${eachMovie.genre}</td>
						<td>${eachMovie.totalQuantity}</td>
						<td>${eachMovie.availableQuantity}</td>

					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td>
						<div class="col text-center"
							style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
							>
							<h3>Search for Movies</h3>
							<form action="movieList" method="get">
								<div>
									<input type="text" name="searchStr" style="margin: 8px 0;" />
								</div>
								<div>
									<input type="submit" class="btn btn-primary btn-sm active"
										style="margin: 8px 0;" value="Search" />
								</div>
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="col text-center">
							<a href="${pageContext.request.contextPath}/home/addMovie"
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true">Add Movie</a> <a
								href="${pageContext.request.contextPath}/home/customerList"
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true">Back to Main</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
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
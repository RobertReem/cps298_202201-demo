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
<title>Add Movie</title>
</head>
<body>
	<header>
		<div class="p-5 text-center bg-image"
			style="background-image: url('https://www.freewpheaders.com/wp-content/gallery/abstract/abstract-header-2105-1024x300.jpg'); height: auto; width: auto;">
			<div class="mask">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-black">
						<h1 class="mb-3">Add a Movie to the Inventory</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="card" style="background-color: rgba(135,206,250);">
			<form:form action="processMovie" modelAttribute="movie" method="post">
				<table class="table">
					<tr>
						<td>
							<div>
								<label for="title" class="col-sm-3 col-form-label"><b>Title:</b>
								</label>
								<form:input path="title" placeholder="Enter Title" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="description" class="col-sm-3 col-form-label"><b>Description:</b>
								</label>
								<form:input path="description" placeholder="Enter description" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="year" class="col-sm-3 col-form-label"><b>Year
										Made:</b> </label>
								<form:input path="year" placeholder="Enter year made" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="length" class="col-sm-3 col-form-label"><b>Movie
										length:</b> </label>
								<form:input path="length" placeholder="Enter Movie Length" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="releaseDate" class="col-sm-3 col-form-label"><b>Release
										Date:</b> </label>
								<form:input path="releaseDate" placeholder="Enter Release Date" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="rating" class="col-sm-3 col-form-label"><b>Rating:</b></label>
								<form:select path="rating" id="rating">
									<form:options items="${ratingList}" />
								</form:select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="rating" class="col-sm-3 col-form-label"><b>Pick
										the Genre:</b></label>

								<form:checkboxes path="genre" style="margin: 5px;"
									items="${genreList}" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="totalQuantity" class="col-sm-3 col-form-label"><b>Total
										Quantity:</b> </label>
								<form:input path="totalQuantity"
									placeholder="Enter Total Quantity" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row">
								<label for="availableQuantity" class="col-sm-3 col-form-label"><b>Available
										Quantity:</b> </label>
								<form:input path="availableQuantity"
									placeholder="Enter Available Quantity" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group-row" style="width: 345px; margin: 0 auto;">
								<c:url var="movieListLink" value="/home/movieList">
									<c:param name="searchStr" value="%" />
								</c:url>
								<c:url var="home" value="/home/" />

								<input type="submit" class="btn btn-primary btn-sm active"
									value="Add Movie" /> <a href="${movieListLink}"
									class="btn btn-primary btn-sm active" role="button"
									aria-pressed="true">Movie List</a> <a href="${home}"
									class="btn btn-primary btn-sm active" role="button"
									aria-pressed="true">Back to Main</a>
							</div>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
<br>
<br>
<footer class="bg-light text-center text-lg-start">
	<div class="text-center p-3"
		style="background-color: rgba(30, 144, 255);">
		© 2021 Copyright: <a class="text-light" href="http://www.ajr.com/">www.AJR.com</a>
	</div>
</footer>
<br>
<br>
<br>
</html>
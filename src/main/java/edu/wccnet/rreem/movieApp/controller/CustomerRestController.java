package edu.wccnet.rreem.movieApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParser;

import edu.wccnet.rreem.movieApp.dao.MovieDAO;
import edu.wccnet.rreem.movieApp.entity.Checkout;
import edu.wccnet.rreem.movieApp.entity.Customer;
import edu.wccnet.rreem.movieApp.entity.Movie;

@RestController
@RequestMapping("/api")
public class CustomerRestController {

	@Autowired
	private MovieDAO movieDAOImpl;

	@GetMapping("/movie")
	public Movie restGetMovieFromPage(@ModelAttribute("movieHolder") RestDataHolder restDataHolder) {
		List<Movie> movies = movieDAOImpl.getMovies();
		for (Movie movie : movies) {
			if (movie.getTitle().contains(restDataHolder.getMovieTitle())) {
				return movie;
			} else if (movie.getDescription().contains(restDataHolder.getMovieTitle())) {
				return movie;
			}
		}
		return null;
	}

	@GetMapping("/history")
	public List<Checkout> restGetHistoryFromPage(@ModelAttribute("movieHolder") RestDataHolder restDataHolder) {
		Customer customer = movieDAOImpl.getCustomer(restDataHolder.getCustomerId());
		movieDAOImpl.getCheckoutHistory(customer);
		return customer.getCheckouts();
	}

	@GetMapping("movieByTitle/{title}")
	public List<Movie> restGetMovieByTitle(@PathVariable String title) throws MovieNotFoundException {

		List<Movie> movies = movieDAOImpl.getMovieByTitle(title);
		if (movies.isEmpty()) {
			throw new MovieNotFoundException("Movie Not Found");
		}
		return movies;

	}

	@GetMapping("/movieList{movieId}")
	public String movieTitleLink(Model model, int movieId) {
		model.addAttribute("movies", movieDAOImpl.getMovie(movieId));
		return "movieList";
	}

	@GetMapping("/history/{customerId}")
	public List<Checkout> restGetHistoryFromUrl(@PathVariable int customerId) throws CustomerNotFoundException {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		movieDAOImpl.getCheckoutHistory(customer);
		List<Checkout> checkouts = customer.getCheckouts();
		
		if (checkouts.isEmpty()) {
			throw new MovieNotFoundException("Customer History Not Found!");
		}
		return checkouts;
	}

	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(CustomerNotFoundException e) {
		CustomerErrorResponse error = new CustomerErrorResponse();
		error.setMessage(e.getMessage());
		error.setStatus(HttpStatus.NOT_FOUND.value());
		error.setTimeStamp(System.currentTimeMillis());

		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(MovieNotFoundException e) {
		CustomerErrorResponse error = new CustomerErrorResponse();
		error.setMessage(e.getMessage());
		error.setStatus(HttpStatus.NOT_FOUND.value());
		error.setTimeStamp(System.currentTimeMillis());

		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(Exception e) {
		CustomerErrorResponse error = new CustomerErrorResponse();
		error.setMessage(e.getMessage());
		error.setStatus(HttpStatus.BAD_REQUEST.value());
		error.setTimeStamp(System.currentTimeMillis());

		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}

}

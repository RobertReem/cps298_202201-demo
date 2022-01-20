package edu.wccnet.rreem.movieApp.dao;

import java.util.List;

import edu.wccnet.rreem.movieApp.entity.Checkout;
import edu.wccnet.rreem.movieApp.entity.Customer;
import edu.wccnet.rreem.movieApp.entity.Movie;

public interface MovieDAO {

	public List<Customer> getCustomers();

	public List<Movie> getMovies();

	public void saveMovie(Movie movie);

	public Customer getCustomer(int customerId);

	public List<Movie> searchMovies(String searchStr);

	public Movie getMovie(String title);
	
	public Movie getMovie(int movieId);

	public void processCheckout(Checkout checkout);

	public void getCheckoutHistory(Customer customer);

	public void getCurrentCheckouts(Customer customer);

	public void processReturn(Checkout checkout);

	public Checkout getCheckout(int checkoutId);

	public List<Movie> searchMoviesByTitle(String searchStr);

	public List<Movie> searchMoviesByDescription(String searchStr);
	
	public List<Movie> getMovieByTitle(String title);

}

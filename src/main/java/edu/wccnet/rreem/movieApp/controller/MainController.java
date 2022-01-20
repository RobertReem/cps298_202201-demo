package edu.wccnet.rreem.movieApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.wccnet.rreem.movieApp.dao.MovieDAO;
import edu.wccnet.rreem.movieApp.entity.Checkout;
import edu.wccnet.rreem.movieApp.entity.Customer;
import edu.wccnet.rreem.movieApp.entity.Movie;
import edu.wccnet.rreem.movieApp.entity.PopulatingClass;

@Controller
@RequestMapping("home")

public class MainController {

	@Autowired
	private PopulatingClass populatingClass;
	@Autowired
	private MovieDAO movieDAOImpl;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("customers", movieDAOImpl.getCustomers());
		return "home";
	}

	@RequestMapping("/searchForMovie")
	public String searchForMovie(Model model, @RequestParam("customerId") int customerId) {
		model.addAttribute("customerId", customerId);
		return "searchForMovie";
	}

	@RequestMapping("/displayMovieSearchResults")
	public String showMovie(Model model, @RequestParam(name = "searchStr", defaultValue = "%") String searchStr,
			@RequestParam(name = "searchByTitleOrDesc", defaultValue = "title") String searchByTitleOrDesc,
			@RequestParam("customerId") int customerId) {
		List<Movie> movies;
		Customer customer = movieDAOImpl.getCustomer(customerId);
		if (searchByTitleOrDesc.contains("title")) {
			movies = movieDAOImpl.searchMoviesByTitle(searchStr);
		} else {
			movies = movieDAOImpl.searchMoviesByDescription(searchStr);
		}
		model.addAttribute("movies", movies);
		model.addAttribute("customer", customer);
		return "displayMovieSearchResults";
	}

	@GetMapping("/customerList")
	public String customerListPage(Model model) {
		RestDataHolder restDataHolder = new RestDataHolder();
		model.addAttribute("customers", movieDAOImpl.getCustomers());
		model.addAttribute(restDataHolder);
		System.out.println("inside /customerList");
		return "home";
	}

	@GetMapping("/movieList")
	public String movieListPage(Model model, @RequestParam(name = "searchStr", defaultValue = "%") String searchStr) {
		model.addAttribute("movies", movieDAOImpl.searchMovies(searchStr));
		return "movieList";
	}

	@GetMapping("/movieLink")
	public String movieTitleLink(Model model, @RequestParam(name = "movieId", defaultValue = "0") int movieId) {
		model.addAttribute("movie", movieDAOImpl.getMovie(movieId));
		return "showMovie";
	}

	@GetMapping("/addMovie")
	public String addMoviePage(Model model) {
		Movie movie = new Movie();
		model.addAttribute("movie", movie);
		return "addMovie";
	}

	@PostMapping("/processMovie")
	public String processMoviePage(@ModelAttribute("movie") Movie movie) {
		movieDAOImpl.saveMovie(movie);
		return "redirect:/home/movieList";
	}

	@RequestMapping("/checkout")
	public String checkoutPage(Model model, @RequestParam("customerId") int customerId,
			@RequestParam(name = "searchStr", defaultValue = "%") String searchStr) {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		model.addAttribute("customer", customer);
		model.addAttribute("movies", movieDAOImpl.searchMovies(searchStr));
		return "checkout";
	}

	@RequestMapping("/processCheckout")
	public String processCheckoutPage(Model model, @RequestParam("customerId") int customerId,
			@RequestParam("movieId") int movieId) {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		Movie movie = movieDAOImpl.getMovie(movieId);
		Checkout checkout = new Checkout(customer, movie);
		movieDAOImpl.processCheckout(checkout);
		model.addAttribute(customer);
		model.addAttribute(movie);
		return "processCheckout";
	}

	@RequestMapping("/processReturn")
	public String processReturnPage(Model model, @RequestParam("customerId") int customerId,
			@RequestParam("movieId") int movieId, @RequestParam("checkoutId") int checkoutId) {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		Movie movie = movieDAOImpl.getMovie(movieId);
		Checkout checkout = movieDAOImpl.getCheckout(checkoutId);
		movieDAOImpl.processReturn(checkout);
		model.addAttribute(customer);
		model.addAttribute(movie);
		model.addAttribute(checkout);
		return "processReturn";
	}

	@RequestMapping("/return")
	public String returnPage(Model model, @RequestParam("customerId") int customerId) {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		movieDAOImpl.getCurrentCheckouts(customer);
		model.addAttribute(customer);
		return "return";
	}

	@RequestMapping("/history")
	public String historyPage(Model model, @RequestParam("customerId") int customerId) {
		Customer customer = movieDAOImpl.getCustomer(customerId);
		movieDAOImpl.getCheckoutHistory(customer);
		model.addAttribute(customer);
		return "history";
	}

	@ModelAttribute
	public void populatingData(Model model) {
		model.addAttribute("genreList", populatingClass.populateGenreList());
		model.addAttribute("ratingList", populatingClass.populateRatingList());
	}

	@InitBinder
	public void initialBinderForTrimmingSpaces(WebDataBinder webDataBinder) {
		StringTrimmerEditor stringTrimEditor = new StringTrimmerEditor(true);
		webDataBinder.registerCustomEditor(String.class, stringTrimEditor);
	}

}
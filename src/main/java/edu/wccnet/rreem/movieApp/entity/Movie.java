package edu.wccnet.rreem.movieApp.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "movie")
public class Movie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "movie_id")
	@JsonIgnore
	private int movieId;

	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;

	@Column(name = "year")
	private int year;

	@Column(name = "length")
	private String length;
	
	@Column(name = "release_date")
	private String releaseDate;
	
	@Column(name = "rating")
	private String rating;
	
	@Column(name = "genre")
	private String genre;
	
	@Column(name = "available_quantity")
	private int availableQuantity;
	
	@Column(name = "total_quantity")
	private int totalQuantity;

	@JsonIgnore
	@OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Checkout> checkouts;

	public Movie() {

	}
	
	public Movie(String title, String description, int year, String length, String releaseDate, String rating,
			String genre, int availableQuantity, int totalQuantity) {
		super();
		this.title = title;
		this.description = description;
		this.year = year;
		this.length = length;
		this.releaseDate = releaseDate;
		this.rating = rating;
		this.genre = genre;
		this.availableQuantity = availableQuantity;
		this.totalQuantity = totalQuantity;
	}

	public void addCheckout(Checkout checkout) {
		checkouts.add(checkout);
		checkout.setMovie(this);
	}

	public void removeCheckout(Checkout checkout) {
		checkouts.remove(checkout);
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getAvailableQuantity() {
		return availableQuantity;
	}

	public void setAvailableQuantity(int availableQuantity) {
		this.availableQuantity = availableQuantity;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public List<Checkout> getCheckouts() {
		return checkouts;
	}

	public void setCheckouts(List<Checkout> checkouts) {
		this.checkouts = checkouts;
	}

	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", title=" + title + ", description=" + description + ", year=" + year
				+ ", length=" + length + ", releaseDate=" + releaseDate + ", rating=" + rating + ", genre=" + genre
				+ ", availableQuantity=" + availableQuantity + ", totalQuantity=" + totalQuantity + "]";
	}


}

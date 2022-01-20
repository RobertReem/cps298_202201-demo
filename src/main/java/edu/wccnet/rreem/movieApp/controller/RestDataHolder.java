package edu.wccnet.rreem.movieApp.controller;

public class RestDataHolder {

	private String movieTitle;
	private String movieDescription;
	private int customerId;

	public RestDataHolder() {
	}

	public RestDataHolder(int customerId) {
		this.customerId = customerId;
	}

	public RestDataHolder(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieDescription() {
		return movieDescription;
	}

	public void setMovieDescription(String movieDescription) {
		this.movieDescription = movieDescription;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

}

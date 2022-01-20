package edu.wccnet.rreem.movieApp.controller;

public class MovieNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 2418591167258670229L;

	public MovieNotFoundException(String message) {
		super(message);
	}

}
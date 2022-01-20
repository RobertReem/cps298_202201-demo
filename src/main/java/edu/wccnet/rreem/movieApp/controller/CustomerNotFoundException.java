package edu.wccnet.rreem.movieApp.controller;

public class CustomerNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -253901433027713598L;

	public CustomerNotFoundException(String msg) {
		super(msg);
	}

}
package edu.wccnet.rreem.movieApp.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "checkout")
public class Checkout {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "checkout_id")
	private int checkoutId;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "customer_id")
	@JsonBackReference
	private Customer customer;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "movie_id")
	private Movie movie;

	@Column(name = "returned")
	private int returned;

	@Column(name = "checkout_time")
	private String checkoutTime;

	@Column(name = "return_time")
	private String returnTime;

	public Checkout() {

	}

	public Checkout(Customer customer, Movie movie) {
		super();
		this.customer = customer;
		this.movie = movie;
	}

	public int getCheckoutId() {
		return checkoutId;
	}

	public void setCheckoutId(int checkoutId) {
		this.checkoutId = checkoutId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public int getReturned() {
		return returned;
	}

	public void setReturned(int returned) {
		this.returned = returned;
	}

	public String getCheckoutTime() {
		return checkoutTime;
	}

	public void setCheckoutTime(String checkoutTime) {
		this.checkoutTime = checkoutTime;
	}

	public String getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}

	@Override
	public String toString() {
		return "Checkout [customer=" + customer + ", movie=" + movie + ", returned=" + returned + ", checkoutTime="
				+ checkoutTime + ", returnTime=" + returnTime + "]";
	}

}

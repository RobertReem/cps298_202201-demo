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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private int customerId;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "email")
	private String email;

	//@JsonIgnore
	@OneToMany(mappedBy = "customer", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<Checkout> checkouts;

	@Transient
	private List<Checkout> currentCheckouts;

	public Customer() {
		
	}

	public Customer(String firstName, String lastName, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public void clearCheckoutsList() {
		checkouts.clear();
	}

	public void addCheckout(Checkout checkout) {
		checkouts.add(checkout);
		checkout.setCustomer(this);
	}

	public void removeCheckout(Checkout checkout) {
		checkouts.remove(checkout);
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int id) {
		this.customerId = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Checkout> getCheckouts() {
		return checkouts;
	}

	public void setCheckouts(List<Checkout> checkouts) {
		this.checkouts = checkouts;
	}

	public List<Checkout> getCurrentCheckouts() {
		return currentCheckouts;
	}

	public void setCurrentCheckouts(List<Checkout> currentCheckouts) {
		this.currentCheckouts = currentCheckouts;
	}

	@Override
	public String toString() {
		return "Customer firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", checkouts=" + checkouts + ", currentCheckouts=" + currentCheckouts + "]";
	}

}
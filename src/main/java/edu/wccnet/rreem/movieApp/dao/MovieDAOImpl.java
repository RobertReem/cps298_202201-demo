package edu.wccnet.rreem.movieApp.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.rreem.movieApp.entity.Checkout;
import edu.wccnet.rreem.movieApp.entity.Customer;
import edu.wccnet.rreem.movieApp.entity.Movie;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		Session session = sessionFactory.getCurrentSession();
		Query<Customer> query = session.createQuery("from Customer c order by customerId", Customer.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Movie> getMovies() {
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> query = session.createQuery("from Movie order by title", Movie.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Movie> getMovieByTitle(String title){
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> query = session.createQuery("from Movie m where m.title like '%" + title +"%' ", Movie.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public void saveMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		session.save(movie);
	}

	@Override
	@Transactional
	public Customer getCustomer(int customerId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Customer.class, customerId);
	}

	@Override
	@Transactional
	public List<Movie> searchMovies(String searchStr) {
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> query = session
				.createQuery("from Movie where title like :searchStr or description like :searchStr", Movie.class);
		query.setParameter("searchStr", "%" + searchStr + "%");
		return query.getResultList();
	}

	@Override
	@Transactional
	public Movie getMovie(int movieId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Movie.class, movieId);
	}

	@Override
	@Transactional
	public Movie getMovie(String title) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Movie.class, title);
	}

	@Override
	@Transactional
	public void processCheckout(Checkout checkout) {
		Session session = sessionFactory.getCurrentSession();
		Movie movie = checkout.getMovie();
		movie.setAvailableQuantity(movie.getAvailableQuantity() - 1);
		checkout.setCheckoutTime(new SimpleDateFormat("MM/dd/yyyy hh:mm aa").format(new Date()));
		session.update(movie);
		session.save(checkout);
	}

	@Override
	@Transactional
	public void processReturn(Checkout checkout) {
		// add 1 to movie quantity and sets returned to 1 on the checkout
		Session session = sessionFactory.getCurrentSession();
		Movie movie = checkout.getMovie();
		movie.setAvailableQuantity(movie.getAvailableQuantity() + 1);
		checkout.setReturnTime(new SimpleDateFormat("MM/dd/yyy hh:mm aa").format(new Date()));
		checkout.setReturned(1);
		session.update(movie);
		session.update(checkout);
	}

	@Override
	@Transactional
	public void getCheckoutHistory(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		int customerId = customer.getCustomerId();
		customer.clearCheckoutsList();
		Query query = session.createQuery("from Checkout where customer_id =:customerId", Checkout.class);
		query.setParameter("customerId", customerId);
		customer.setCheckouts(query.getResultList());
	}

	@Override
	@Transactional
	public void getCurrentCheckouts(Customer customer) {
		// Adds each checkout to checkouts list only if returned = 0
		Session session = sessionFactory.getCurrentSession();
		int customerId = customer.getCustomerId();
		customer.clearCheckoutsList();
		Query<Checkout> query = session.createQuery("from Checkout where customer_id =:customerId", Checkout.class);
		query.setParameter("customerId", customerId);
		for (Checkout checkout : query.getResultList()) {
			if (checkout.getReturned() == 0) {
				customer.addCheckout(checkout);
			}
		}
	}

	@Override
	@Transactional
	public Checkout getCheckout(int checkoutId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Checkout.class, checkoutId);
	}

	@Override
	@Transactional
	public List<Movie> searchMoviesByTitle(String searchStr) {
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> query = session.createQuery("from Movie where title like :searchStr", Movie.class);
		query.setParameter("searchStr", "%" + searchStr + "%");
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Movie> searchMoviesByDescription(String searchStr) {
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> query = session.createQuery("from Movie where description like :searchStr", Movie.class);
		query.setParameter("searchStr", "%" + searchStr + "%");
		return query.getResultList();
	}

}

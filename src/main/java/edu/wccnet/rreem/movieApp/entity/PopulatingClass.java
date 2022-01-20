package edu.wccnet.rreem.movieApp.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class PopulatingClass {


	public Map<String, String> populateGenreList() {
		Map<String, String> genreList = new LinkedHashMap<String, String>();
		genreList.put("Comedy", "Comedy");
		genreList.put("Horror", "Horror");
		genreList.put("Fantasy", "Fantasy");
		genreList.put("Sci-Fi", "Sci-Fi");
		genreList.put("Romance", "Romance");
		genreList.put("Thriller", "Thriller");
		genreList.put("Action", "Action");
		genreList.put("Documentary", "Documentary");
		genreList.put("Family", "Family");
		return genreList;
	}

	public Map<String, String> populateRatingList() {
		Map<String, String> ratingList = new LinkedHashMap<String, String>();
		ratingList.put("G", "G");
		ratingList.put("PG", "PG");
		ratingList.put("PG-13", "PG-13");
		ratingList.put("R", "R");
		ratingList.put("NC-17", "NC-17");
		return ratingList;
	}
}

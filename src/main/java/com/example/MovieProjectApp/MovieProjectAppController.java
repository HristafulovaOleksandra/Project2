package com.example.MovieProjectApp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class MovieProjectAppController {

    @GetMapping("/")
    public String showMovies(Model model) {
        List<Movie> movies = List.of(
                new Movie("The Shawshank Redemption", "Drama", 1994),
                new Movie("The Dark Knight", "Action", 2008),
                new Movie("Inception", "Sci-Fi", 2010),
                new Movie("The Godfather", "Crime", 1972),
                new Movie("Pulp Fiction", "Crime", 1994),
                new Movie("Forrest Gump", "Drama", 1994),
                new Movie("The Matrix", "Sci-Fi", 1999)
        );
        model.addAttribute("movies", movies);
        model.addAttribute("highlightGenre", "Sci-Fi");
        return "page";
    }

    // Новий ендпоінт для демонстрації іменованих та стандартних параметрів
    @GetMapping("/movie-details")
    public String showMovieDetails(@RequestParam(name = "title", required = false) String title,
                                   @RequestParam(name = "year", required = false) Integer year,
                                   Model model) {

        Movie movie = null;
        if (title != null && year != null) {
            movie = new Movie(title, "Unknown", year);
        } else if (title != null) {
            movie = new Movie(title, "Unknown", 0);
        }

        model.addAttribute("movie", movie);
        return "movieDetails";
    }
}
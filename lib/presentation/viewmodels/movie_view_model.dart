import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/domain/usecases/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_top_rated_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_upcoming_movies_usecase.dart';


class MovieViewModel extends ChangeNotifier {
  final FetchPopularMoviesUseCase fetchPopularMovies;
  final FetchNowPlayingMoviesUseCase fetchNowPlayingMovies;
  final FetchTopRatedMoviesUseCase fetchTopRatedMovies;
  final FetchUpcomingMoviesUseCase fetchUpcomingMovies;

  MovieViewModel({
    required this.fetchPopularMovies,
    required this.fetchNowPlayingMovies,
    required this.fetchTopRatedMovies,
    required this.fetchUpcomingMovies,
  });

  List<Movie> popularMovies = [];
  List<Movie> nowPlayingMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingMovies = [];

  bool isLoading = false;

  Future<void> loadMovies() async {
    isLoading = true;
    notifyListeners();

    final popular = await fetchPopularMovies();
    final nowPlaying = await fetchNowPlayingMovies();
    final topRated = await fetchTopRatedMovies();
    final upcoming = await fetchUpcomingMovies();

    popularMovies = popular ?? [];
    nowPlayingMovies = nowPlaying ?? [];
    topRatedMovies = topRated ?? [];
    upcomingMovies = upcoming ?? [];

    isLoading = false;
    notifyListeners();
  }
}

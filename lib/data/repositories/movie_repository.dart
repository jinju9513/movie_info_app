
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/domain/entities/movie_detail.dart';

//TMDB 전용
abstract interface class MovieRepository {
  Future<List<Movie>?> fetchNowPlayingMovies();

  Future<List<Movie>?> fetchPopularMovies();

  Future<List<Movie>?> fetchTopRatedMovies();

  Future<List<Movie>?> fetchUpcomingMovies();

  Future<MovieDetail?> fetchMovieDetail(int id);
}

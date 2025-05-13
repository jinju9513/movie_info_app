import 'package:movie_info_app/data/repositories/movie_repository.dart';
import 'package:movie_info_app/domain/entities/movie.dart';

class FetchUpcomingMoviesUseCase {
  final MovieRepository repository;

  FetchUpcomingMoviesUseCase(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.fetchUpcomingMovies();
  }
}

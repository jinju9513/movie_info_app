import 'package:movie_info_app/data/repositories/movie_repository.dart';
import 'package:movie_info_app/domain/entities/movie.dart';

class FetchTopRatedMoviesUseCase {
  final MovieRepository repository;

  FetchTopRatedMoviesUseCase(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.fetchTopRatedMovies();
  }
}

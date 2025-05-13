import 'package:movie_info_app/data/repositories/movie_repository.dart';
import 'package:movie_info_app/domain/entities/movie_detail.dart';

class FetchMovieDetailUseCase {
  final MovieRepository repository;

  FetchMovieDetailUseCase(this.repository);

  Future<MovieDetail?> call(int movieId) async {
    return await repository.fetchMovieDetail(movieId);
  }
}

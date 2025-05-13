
import 'package:movie_info_app/data/models/movie_response_dto.dart';
import 'package:movie_info_app/domain/entities/movie.dart';

extension ResultToEntity on Result {
  Movie toEntity() {
    return Movie(
      id: id,
      posterPath: posterPath,
    );
  }
}

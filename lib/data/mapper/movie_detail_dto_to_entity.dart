
import 'package:movie_info_app/data/models/movie_detail_dto.dart';
import 'package:movie_info_app/domain/entities/movie_detail.dart';

extension MovieDetailDtoToEntity on MovieDetailDto {
  MovieDetail toEntity() {
    return MovieDetail(
      budget: budget,
      genres: genres.map((e) => e.name).toList(),
      id: id,
      productionCompanyLogos: productionCompanies
          .where((e) => e.logoPath != null)
          .map((e) => 'https://image.tmdb.org/t/p/w500${e.logoPath}')
          .toList(),
      overview: overview,
      popularity: popularity,
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      tagline: tagline,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

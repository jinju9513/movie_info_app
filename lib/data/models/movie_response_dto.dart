class MovieResponseDto {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return MovieResponseDto(
      page: json['page'],
      results: List<Result>.from(
        json['results'].map((x) => Result.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Result {
  int id;
  String title;
  String posterPath;
  String overview;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;
  double popularity;

  Result({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '', // 혹시 null일 수도 있으니까 대비
      overview: json['overview'],
      releaseDate: DateTime.parse(json['release_date']),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      popularity: (json['popularity'] as num).toDouble(),
    );
  }
}

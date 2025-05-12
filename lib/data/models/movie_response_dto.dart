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

}
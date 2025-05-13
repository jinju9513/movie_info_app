class MovieDetailDto {
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      adult: json["adult"],
      backdropPath: json["backdrop_path"] ?? '',
      belongsToCollection: json["belongs_to_collection"],
      budget: json["budget"],
      genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      homepage: json["homepage"] ?? '',
      id: json["id"],
      imdbId: json["imdb_id"] ?? '',
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"] ?? '',
      popularity: (json["popularity"] as num).toDouble(),
      posterPath: json["poster_path"] ?? '',
      productionCompanies: List<ProductionCompany>.from(
        json["production_companies"].map((x) => ProductionCompany.fromJson(x)),
      ),
      releaseDate: DateTime.parse(json["release_date"]),
      revenue: json["revenue"],
      runtime: json["runtime"] ?? 0,
      spokenLanguages: List<SpokenLanguage>.from(
        json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)),
      ),
      status: json["status"],
      tagline: json["tagline"] ?? '',
      title: json["title"],
      video: json["video"],
      voteAverage: (json["vote_average"] as num).toDouble(),
      voteCount: json["vote_count"],
    );
  }
}

class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json["id"], name: json["name"]);
  }
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json["id"],
      logoPath: json["logo_path"] as String?,
      name: json["name"],
      originCountry: json["origin_country"],
    );
  }
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json["english_name"],
      iso6391: json["iso_639_1"],
      name: json["name"],
    );
  }
}

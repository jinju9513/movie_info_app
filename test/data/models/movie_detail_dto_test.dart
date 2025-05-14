import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/models/movie_detail_dto.dart';

void main() {
  group('MovieDetailDto fromJson 테스트', () {
    test('정상적으로 파싱되는지 확인', () {
      final json = {
        "adult": false,
        "backdrop_path": "/backdrop.jpg",
        "belongs_to_collection": null,
        "budget": 150000000,
        "genres": [
          {"id": 1, "name": "Action"},
          {"id": 2, "name": "Adventure"}
        ],
        "homepage": "https://example.com",
        "id": 123,
        "imdb_id": "tt1234567",
        "original_language": "en",
        "original_title": "Original Title",
        "overview": "This is an overview",
        "popularity": 123.45,
        "poster_path": "/poster.jpg",
        "production_companies": [
          {
            "id": 101,
            "logo_path": "/logo.png",
            "name": "Marvel",
            "origin_country": "US"
          }
        ],
        "release_date": "2024-05-13",
        "revenue": 500000000,
        "runtime": 130,
        "spoken_languages": [
          {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
          }
        ],
        "status": "Released",
        "tagline": "Just a tagline",
        "title": "Test Movie",
        "video": false,
        "vote_average": 8.8,
        "vote_count": 5432
      };

      final dto = MovieDetailDto.fromJson(json);

      expect(dto.adult, false);
      expect(dto.backdropPath, "/backdrop.jpg");
      expect(dto.belongsToCollection, null);
      expect(dto.budget, 150000000);
      expect(dto.genres.length, 2);
      expect(dto.genres.first.name, "Action");
      expect(dto.homepage, "https://example.com");
      expect(dto.id, 123);
      expect(dto.imdbId, "tt1234567");
      expect(dto.originalLanguage, "en");
      expect(dto.originalTitle, "Original Title");
      expect(dto.overview, "This is an overview");
      expect(dto.popularity, 123.45);
      expect(dto.posterPath, "/poster.jpg");
      expect(dto.productionCompanies.first.name, "Marvel");
      expect(dto.releaseDate, DateTime(2024, 5, 13));
      expect(dto.revenue, 500000000);
      expect(dto.runtime, 130);
      expect(dto.spokenLanguages.first.name, "English");
      expect(dto.status, "Released");
      expect(dto.tagline, "Just a tagline");
      expect(dto.title, "Test Movie");
      expect(dto.video, false);
      expect(dto.voteAverage, 8.8);
      expect(dto.voteCount, 5432);
    });
  });
}

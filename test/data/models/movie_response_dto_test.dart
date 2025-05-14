import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/models/movie_response_dto.dart';

void main() {
  group('MovieResponseDto', () {
    test('fromJson이 올바르게 MovieResponseDto를 생성함', () {
      final json = {
        "page": 1,
        "results": [
          {
            "id": 123,
            "title": "테스트 영화",
            "poster_path": "/test.jpg",
            "overview": "테스트 설명",
            "release_date": "2024-05-01",
            "vote_average": 8.5,
            "vote_count": 1200,
            "popularity": 300.0
          }
        ],
        "total_pages": 10,
        "total_results": 100
      };

      final dto = MovieResponseDto.fromJson(json);

      expect(dto.page, 1);
      expect(dto.totalPages, 10);
      expect(dto.totalResults, 100);
      expect(dto.results.length, 1);

      final result = dto.results.first;
      expect(result.id, 123);
      expect(result.title, "테스트 영화");
      expect(result.posterPath, "/test.jpg");
      expect(result.overview, "테스트 설명");
      expect(result.releaseDate, DateTime(2024, 5, 1));
      expect(result.voteAverage, 8.5);
      expect(result.voteCount, 1200);
      expect(result.popularity, 300.0);
    });
  });
}

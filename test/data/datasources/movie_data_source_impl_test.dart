import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:movie_info_app/data/datasoures/movie_data_source_impl.dart';
import 'package:movie_info_app/data/models/movie_response_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  group('MovieDataSourceImpl 테스트', () {
    late MovieDataSourceImpl dataSource;
    late http.Client mockClient;

    setUp(() async {
      await dotenv.load(fileName: ".env"); 

      mockClient = MockClient((request) async {
        if (request.url.path.contains('popular')) {
          return http.Response(jsonEncode({
            "page": 1,
            "results": [
              {
                "id": 123,
                "title": "Test Movie",
                "poster_path": "/poster.jpg",
                "overview": "overview",
                "release_date": "2024-05-14",
                "vote_average": 8.8,
                "vote_count": 1000,
                "popularity": 300.5
              }
            ],
            "total_pages": 1,
            "total_results": 1
          }), 200);
        }

        return http.Response('Not Found', 404);
      });

      dataSource = MovieDataSourceImpl(mockClient);
    });

    test('fetchPopularMovies()는 성공적으로 영화 리스트를 파싱한다', () async {
      final result = await dataSource.fetchPopularMovies();
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.title, "Test Movie");
    });
  });
}

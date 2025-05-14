import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_info_app/data/models/movie_detail_dto.dart';
import 'package:movie_info_app/data/models/movie_response_dto.dart';

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client _client;
  final String _baseUrl = 'https://api.themoviedb.org/3';
  String get _apiKey => dotenv.env['TMDB_API_KEY']!;

  MovieDataSourceImpl([http.Client? client]) : _client = client ?? http.Client();

  Future<MovieResponseDto?> _getMovieList(String path) async {
    final uri = Uri.parse('$_baseUrl/$path?api_key=$_apiKey&language=ko-KR&page=1');
    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieResponseDto.fromJson(json);
    } else {
      print('Error fetching $path: ${response.statusCode}');
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() {
    return _getMovieList('movie/now_playing');
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() {
    return _getMovieList('movie/popular');
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() {
    return _getMovieList('movie/top_rated');
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() {
    return _getMovieList('movie/upcoming');
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    final uri = Uri.parse('$_baseUrl/movie/$id?api_key=$_apiKey&language=ko-KR');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieDetailDto.fromJson(json);
    } else {
      print('Error fetching movie detail: ${response.statusCode}');
      return null;
    }
  }
}

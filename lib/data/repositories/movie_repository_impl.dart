

import 'package:movie_info_app/data/datasoures/movie_data_source.dart';
import 'package:movie_info_app/data/mapper/movie_detail_dto_to_entity.dart';
import 'package:movie_info_app/data/mapper/result_to_entity.dart';
import 'package:movie_info_app/data/repositories/movie_repository.dart';
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/domain/entities/movie_detail.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final dto = await _movieDataSource.fetchNowPlayingMovies();
    return dto?.results.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final dto = await _movieDataSource.fetchPopularMovies();
    return dto?.results.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final dto = await _movieDataSource.fetchTopRatedMovies();
    return dto?.results.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final dto = await _movieDataSource.fetchUpcomingMovies();
    return dto?.results.map((e) => e.toEntity()).toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final dto = await _movieDataSource.fetchMovieDetail(id);
    return dto?.toEntity();
  }
}

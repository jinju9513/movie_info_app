import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entities/movie_detail.dart';
import 'package:movie_info_app/domain/usecases/fetch_movie_detail_usecase.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final FetchMovieDetailUseCase fetchMovieDetailUseCase;

  MovieDetail? _detail;
  bool _isLoading = false;

  MovieDetail? get detail => _detail;
  bool get isLoading => _isLoading;

  MovieDetailViewModel({required this.fetchMovieDetailUseCase});

  Future<void> fetch(int id) async {
    _isLoading = true;
    notifyListeners();

    _detail = await fetchMovieDetailUseCase(id);

    _isLoading = false;
    notifyListeners();
  }
}

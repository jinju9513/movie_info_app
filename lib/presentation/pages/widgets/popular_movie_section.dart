import 'package:flutter/material.dart';
import 'package:movie_info_app/data/datasoures/movie_data_source_impl.dart';
import 'package:movie_info_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/domain/usecases/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/presentation/pages/detail_page.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:provider/provider.dart';

Widget popularMovieSection({
  required String label,
  required List<Movie> movies,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemCount: 20, // 20개 출력
          itemBuilder: (context, index) {
            final movie = movies[index % movies.length];
            final tag = 'movie_${movie.id}_${label}_$index';

            return Container(
              margin: EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ChangeNotifierProvider(
                              create:
                                  (_) => MovieDetailViewModel(
                                    fetchMovieDetailUseCase:
                                        FetchMovieDetailUseCase(
                                          MovieRepositoryImpl(
                                            MovieDataSourceImpl(),
                                          ),
                                        ),
                                  )..fetch(movie.id),
                              child: DetailPage(movie: movie, heroTag: tag),
                            ),
                      ),
                    );
                  },
                  child: Stack(
                    clipBehavior: Clip.none, // 바깥 넘치게
                    children: [
                      Hero(
                        tag: tag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            movie.posterPath,
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                        Positioned(
                          left: -28,
                          bottom: -20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 24),
    ],
  );
}

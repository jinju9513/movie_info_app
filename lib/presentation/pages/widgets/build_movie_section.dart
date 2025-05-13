import 'package:flutter/material.dart';
import 'package:movie_info_app/data/datasoures/movie_data_source_impl.dart';
import 'package:movie_info_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/domain/usecases/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/presentation/pages/detail_page.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:provider/provider.dart';

Widget buildMovieSection({
  required String label,
  required List<Movie> movies,
  bool showRank = false,
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
          itemCount: 20, // 20개 출력
          itemBuilder: (context, index) {
            final movie = movies[index % movies.length];
            final tag = 'movie_${movie.id}_${label}_$index';

            return Padding(
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
                  alignment: Alignment.bottomLeft,
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
                    if (showRank)
                      Positioned(
                        bottom: 6,
                        left: 6,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
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

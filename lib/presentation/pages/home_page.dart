import 'package:flutter/material.dart';
import 'package:movie_info_app/data/datasoures/movie_data_source_impl.dart';
import 'package:movie_info_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app/domain/usecases/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/presentation/pages/widgets/build_movie_section.dart';
import 'package:movie_info_app/presentation/pages/widgets/popular_movie_section.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_view_model.dart';
import 'package:provider/provider.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MovieViewModel>();
    final featuredMovie =
        vm.popularMovies.isNotEmpty ? vm.popularMovies[0] : null;
    final featuredTag =
        featuredMovie != null ? 'movie_featured_${featuredMovie.id}' : '';

    if (featuredMovie == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 가장 인기있는 포스터 (가로 전체)
              const Text(
                "가장 인기있는",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  if (featuredMovie == null) return;
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
                                ),
                            builder: (context, child) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                context.read<MovieDetailViewModel>().fetch(
                                  featuredMovie.id,
                                );
                              });
                              return DetailPage(
                                movie: featuredMovie,
                                heroTag: featuredTag,
                              );
                            },
                          ),
                    ),
                  );
                },
                child: Hero(
                  tag: featuredTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      featuredMovie!.posterPath,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 600,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child: Image.network(
              //     dummyMovies[0]['poster'],
              //     width: MediaQuery.of(context).size.width - 40,
              //     height: 600,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              const SizedBox(height: 32),

              // 리스트뷰 섹션들
              buildMovieSection(label: "현재 상영중", movies: vm.nowPlayingMovies),
              PopularMovieSection(
                label: "인기순",
                movies: vm.popularMovies,
              ),
              buildMovieSection(label: "평점 높은순", movies: vm.topRatedMovies),
              buildMovieSection(label: "개봉 예정", movies: vm.upcomingMovies),
            ],
          ),
        ),
      ),
    );
  }
}

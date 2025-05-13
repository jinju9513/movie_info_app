import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_info_app/data/datasoures/movie_data_source_impl.dart';
import 'package:movie_info_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app/domain/usecases/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_top_rated_movies_usecase.dart';
import 'package:movie_info_app/domain/usecases/fetch_upcoming_movies_usecase.dart';
import 'package:movie_info_app/presentation/pages/home_page.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final repository = MovieRepositoryImpl(MovieDataSourceImpl());

  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create:
              (_) => MovieViewModel(
                fetchPopularMovies: FetchPopularMoviesUseCase(repository),
                fetchNowPlayingMovies: FetchNowPlayingMoviesUseCase(repository),
                fetchTopRatedMovies: FetchTopRatedMoviesUseCase(repository),
                fetchUpcomingMovies: FetchUpcomingMoviesUseCase(repository),
              )..loadMovies(), // 앱 시작하자 마자 데이터 로드
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

import 'package:flutter/material.dart';
import 'package:movie_info_app/presentation/pages/widgets/build_movie_section.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> dummyMovies = const [
    {
      "id": 1,
      "title": "모아나2",
      "poster": "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"
    },
    {
      "id": 2,
      "title": "쿵푸팬더4",
      "poster": "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"
    },
    {
      "id": 3,
      "title": "엘리베이션",
      "poster": "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg"
    },
    {
      "id": 3,
      "title": "엘리베이션",
      "poster": "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg"
    },
    {
      "id": 3,
      "title": "엘리베이션",
      "poster": "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg"
    },
    {
      "id": 3,
      "title": "엘리베이션",
      "poster": "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg"
    },
    {
      "id": 3,
      "title": "엘리베이션",
      "poster": "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg"
    },
  ];


  @override
  Widget build(BuildContext context) {
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  dummyMovies[0]['poster'],
                  width: MediaQuery.of(context).size.width - 40, 
                  height: 600,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),

              // 리스트뷰 섹션들
              buildMovieSection(
                label: "현재 상영중",
                movies: dummyMovies,
              ),
              buildMovieSection(
                label: "인기순",
                movies: dummyMovies,
                showRank: true,
              ),
              buildMovieSection(
                label: "평점 높은순",
                movies: dummyMovies,
              ),
              buildMovieSection(
                label: "개봉 예정",
                movies: dummyMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

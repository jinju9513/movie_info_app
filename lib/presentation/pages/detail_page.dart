import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_info_app/domain/entities/movie.dart';
import 'package:movie_info_app/presentation/pages/widgets/info_box.dart';
import 'package:movie_info_app/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;
  final String heroTag;
  const DetailPage({super.key, required this.movie, required this.heroTag});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieDetailViewModel>().fetch(widget.movie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MovieDetailViewModel>();

    if (vm.isLoading || vm.detail == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Hero(
              tag: widget.heroTag,
              child: Image.network(
                widget.movie.posterPath,
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      );
    }

    final movieDetail = vm.detail!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 포스터 이미지
            Hero(
              tag: widget.heroTag,
              child: Image.network(
                widget.movie.posterPath,
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목 + 개봉일
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieDetail.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat(
                          'yyyy-MM-dd',
                        ).format(movieDetail.releaseDate),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 태그라인
                  Text(
                    movieDetail.tagline,
                    style: const TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  const SizedBox(height: 5),

                  // 러닝타임 + 카테고리
                  Text(
                    "${movieDetail.runtime}분",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 1,
                    color: Colors.white24,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                  ),
                  // Text(
                  //   "${(dummyDetail['genres'] as List<String>).join(', ')}",
                  //   style: const TextStyle(color: Colors.white),
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          movieDetail.genres.map((genre) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                genre,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList(),
                    ),
                  ),

                  Container(
                    height: 1,
                    color: Colors.white24,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                  ),
                  // const SizedBox(height: 10),

                  // 영화 설명
                  Text(
                    movieDetail.overview,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Container(
                    height: 1,
                    color: Colors.white24,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '흥행정보',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 가로 스크롤 정보 리스트
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        infoBox("평점", movieDetail.voteAverage.toString()),
                        infoBox("평점투표 수", movieDetail.voteCount.toString()),
                        infoBox(
                          "인기점수",
                          movieDetail.popularity.toStringAsFixed(1),
                        ),
                        infoBox(
                          "예산",
                          "\$${_formatCurrency(movieDetail.budget)}",
                        ),
                        infoBox(
                          "수익",
                          "\$${_formatCurrency(movieDetail.revenue)}",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: (movieDetail.productionCompanyLogos).length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final url = (movieDetail.productionCompanyLogos)[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          child: Image.network(url, height: 40),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //천단위 콤마 찍기
  String _formatCurrency(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}

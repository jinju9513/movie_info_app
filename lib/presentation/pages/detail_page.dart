import 'package:flutter/material.dart';
import 'package:movie_info_app/presentation/pages/widgets/info_box.dart';

class DetailPage extends StatelessWidget {
  final Map movie;
  final String heroTag;
  const DetailPage({super.key, required this.movie, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    // TMDB 더미
    const dummyDetail = {
      "title": "모아나 2",
      "releaseDate": "2024-07-01",
      "tagline": "The ocean is calling her back.",
      "runtime": "102분",
      "genres": ["Adventure", "Animation", "Fantasy"],
      "overview":
          "In Moana 2, Moana and Maui reunite to travel to the far seas of Oceania and explore dangerous new waters.",
      "voteAverage": 8.5,
      "voteCount": 2547,
      "popularity": 1234.56,
      "budget": 150000000,
      "revenue": 500000000,
      "productionCompanies": [
        "https://logos-world.net/wp-content/uploads/2021/02/Disney-Logo.png",
      ],
    };

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 포스터 이미지
            Hero(
              tag: heroTag,
              child: Image.network(
                movie['poster'],
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
                          dummyDetail['title'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        dummyDetail['releaseDate'].toString(),
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
                    dummyDetail['tagline'].toString(),
                    style: const TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  const SizedBox(height: 5),

                  // 러닝타임 + 카테고리
                  Text(
                    "${dummyDetail['runtime']}",
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
                          (dummyDetail['genres'] as List<String>).map((genre) {
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
                    dummyDetail['overview'].toString(),
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
                        infoBox("평점", dummyDetail['voteAverage'].toString()),
                        infoBox("평점투표 수", dummyDetail['voteCount'].toString()),
                        infoBox(
                          "인기점수",
                          (dummyDetail['popularity'] as double).toStringAsFixed(
                            1,
                          ),
                        ),
                        infoBox(
                          "예산",
                          "\$${_formatCurrency(dummyDetail['budget'] as int)}",
                        ),
                        infoBox(
                          "수익",
                          "\$${_formatCurrency(dummyDetail['revenue'] as int)}",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (dummyDetail['productionCompanies'] as List<String>)
                              .length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final url =
                            (dummyDetail['productionCompanies']
                                as List<String>)[index];
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

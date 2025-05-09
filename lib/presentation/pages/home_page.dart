import 'package:flutter/material.dart';
import 'package:movie_info_app/presentation/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  final dummyMovies = const [
    {
      "id": 1,
      "title": "듄: 파트2",
      "poster":
          "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"
    },
    {
      "id": 1,
      "title": "듄: 파트2",
      "poster":
          "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"
    },
    {
      "id": 1,
      "title": "듄: 파트2",
      "poster":
          "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("인기영화")),
      body: ListView.builder(
        itemCount: dummyMovies.length,
        itemBuilder: (context, index) {
          final movie = dummyMovies[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage()),
              );
            },
            leading: Hero(
              tag: movie['id'].toString(),
              child: Image.network(
                movie['poster'].toString(),
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(movie['title'].toString()),
          );
        },
      ),
    );
  }
}

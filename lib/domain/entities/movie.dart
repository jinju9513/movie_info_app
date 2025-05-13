
//우리 앱 전용
class Movie { 
  final int id;
  final String posterPath;

  Movie({
    required this.id,
    required String posterPath,
   }) : posterPath = 'https://image.tmdb.org/t/p/w500$posterPath'; 
}

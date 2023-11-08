class Movie {
  String title;
  String overview;
  String backdrop_path;
  String poster_path;
  String relesedata;
  double voteavg;

  Movie(
      {required this.title,
      required this.overview,
      required this.backdrop_path,
      required this.poster_path,
      required this.relesedata,
      required this.voteavg});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'] ?? 'unavilable',
        overview: json['overview'] ?? 'unavilable',
        backdrop_path: json['backdrop_path'] ?? 'unavilable',
        poster_path: json['poster_path'] ?? 'unavilable',
        relesedata: json['release_date'] ?? 'unavilable',
        voteavg: json['vote_average'] ?? 'unavilable');
  }
}

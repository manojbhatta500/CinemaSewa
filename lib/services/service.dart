import 'dart:convert';

import 'package:cinemasewa/constants.dart';
import 'package:cinemasewa/models/movie.dart';
import 'package:http/http.dart' as http;

class Service {
  static const trendingapi =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey';

  static const popularmovie =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apikey';

  static const upcomingmovie =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey';

  static const nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey';

  static const toprated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey';

  Future<List<Movie>> gettoprated() async {
    http.Response response = await http.get(Uri.parse(toprated));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final data = body['results'] as List;
      print('this is a trending  movie');
      print(data);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('sometging went wrong');
    }
  }

  Future<List<Movie>> getupcomming() async {
    http.Response response = await http.get(Uri.parse(upcomingmovie));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final data = body['results'] as List;
      print('this is a trending  movie');
      print(data);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('sometging went wrong');
    }
  }

  Future<List<Movie>> getnowplaying() async {
    http.Response response = await http.get(Uri.parse(nowplaying));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final data = body['results'] as List;
      print('this is a trending  movie');
      print(data);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('sometging went wrong');
    }
  }

  Future<List<Movie>> getpopularmovie() async {
    http.Response response = await http.get(Uri.parse(popularmovie));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final data = body['results'] as List;
      print('this is a popular movie');
      print(data);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('sometging went wrong');
    }
  }

  Future<List<Movie>> gettrendingmovie() async {
    http.Response response = await http.get(Uri.parse(trendingapi));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final data = body['results'] as List;
      print('this is a trending  movie');
      print(data);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('sometging went wrong');
    }
  }
}

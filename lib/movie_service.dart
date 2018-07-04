import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:bloc_example/constant.dart';
import 'package:bloc_example/model.dart';
import 'package:bloc_example/api.dart';

class MovieService {
  static const String _url =
      'https://api.themoviedb.org/3/search/movie?api_key=$api_key&query={1}';

  Future<List<Movie>> getMovies(String query) async {
    List<Movie> list = [];

    await new Api()
        .get(Uri.parse(_url.replaceFirst("{1}", query)))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json["results"])
        .then((movies) =>
            movies.forEach((movie) => list.add(Movie.fromJson(movie))));

    return list;
  }
}

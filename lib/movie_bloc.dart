import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc_example/movie_service.dart';
import 'package:bloc_example/movie_model.dart';

class MovieBloc {
  final MovieService movieService;

  // Init
  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();
  ReplaySubject<String> _query = ReplaySubject<String>();

  // Geter
  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;

  MovieBloc(this.movieService) {
    _results =
        _query.distinct().asyncMap(movieService.getMovies).asBroadcastStream();

    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
        .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}

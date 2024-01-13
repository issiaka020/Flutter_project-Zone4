import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/services/api_services.dart';

class DataRepository with ChangeNotifier {
  final APIServices apiService = APIServices();
  final List<Movie> _popularMovieList = [];
  final List<Movie> _nowPlayingMovieList = [];
  final List<Movie> _upcomingMovieList = [];
  final List<Movie> _topRatedMovieList = [];
  final List<Movie> _animationMovieList = [];
  final List<Movie> _horrorMovieList = [];
  final List<Movie> _thrillerMovieList = [];
  int _popularMoviePageNumber = 1;
  int _nowPlayingPageNumber = 1;
  int _upcomingPageNumber = 1;
  int _topRatedPageNumber = 1;
  int _animationPageNumber = 1;
  int _horrorPageNumber = 1;
  int _thrillerPageNumber = 1;

  List<Movie> get popularMoviesList => _popularMovieList;
  List<Movie> get nowPlayingMoviesList => _nowPlayingMovieList;
  List<Movie> get upcomingMoviesList => _upcomingMovieList;
  List<Movie> get topRatedMoviesList => _topRatedMovieList;
  List<Movie> get animationMoviesList => _animationMovieList;
  List<Movie> get horrorMoviesList => _horrorMovieList;
  List<Movie> get thrillerMoviesList => _thrillerMovieList;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies = await apiService.getPopularMovies(
          pageNumber: _popularMoviePageNumber);
      _popularMovieList.addAll(movies);
      _popularMoviePageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getNowPlayingMovies() async {
    try {
      List<Movie> movies = await apiService.getNowPlayingMovies(
          pageNumber: _nowPlayingPageNumber);
      _nowPlayingMovieList.addAll(movies);
      _nowPlayingPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      List<Movie> movies =
          await apiService.getUpcomingMovies(pageNumber: _upcomingPageNumber);
      _upcomingMovieList.addAll(movies);
      _upcomingPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getTopRatedMovies() async {
    try {
      List<Movie> movies =
          await apiService.getTopRatedMovies(pageNumber: _topRatedPageNumber);
      _topRatedMovieList.addAll(movies);
      _topRatedPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getAnimationMovies() async {
    try {
      List<Movie> movies =
          await apiService.getAnimationMovies(pageNumber: _animationPageNumber);
      _animationMovieList.addAll(movies);
      _animationPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getHorrorMovies() async {
    try {
      List<Movie> movies =
          await apiService.getHorrorMovies(pageNumber: _horrorPageNumber);
      _horrorMovieList.addAll(movies);
      _horrorPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> getThrillerMovies() async {
    try {
      List<Movie> movies =
          await apiService.getThrillerMovies(pageNumber: _thrillerPageNumber);
      _thrillerMovieList.addAll(movies);
      _thrillerPageNumber++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    try {
      // getting movies details such as vote, release date and genres etc...
      Movie newMovie = await apiService.getMovie(movie: movie);
      return newMovie;
    } on Response catch (response) {
      debugPrint('Error :  ${response.statusCode}');
      rethrow;
    }
  }

  Future<void> initData() async {
    await Future.wait([
      getPopularMovies(),
      getNowPlayingMovies(),
      getUpcomingMovies(),
      getTopRatedMovies(),
      getAnimationMovies(),
      getHorrorMovies(),
      getThrillerMovies(),
    ]);
  }
}

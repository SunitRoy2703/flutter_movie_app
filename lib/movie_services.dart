import 'package:flutter_movie_app/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/movie.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_movie_app/custom_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(configProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this.config, this.dio);

  final Config config;
  final Dio dio;

  Future<List<Movie>> getMovies() async {

try {
  final response = await dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=(MOVIE-API-KEY)");
  print(response);


  final results = List<Map<String, dynamic>>.from(response.data["results"]);
  print(results);
  List<Movie> movies = results
      .map((movieData) => Movie.fromMap(movieData))
      .toList(growable: false);
  print(movies);
  return movies;
}on DioError catch (e){

  throw MoviesException.fromDioError(e);
}
  }
}

import 'package:flutter_bloc_clean_architecture_masterclass/model/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}

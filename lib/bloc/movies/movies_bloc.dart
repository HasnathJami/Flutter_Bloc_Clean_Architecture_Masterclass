import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/data/response/api_response.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/model/movies/movies.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/movies/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository})
      : super(MoviesState(apiResponse: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
      MoviesFetched event, Emitter<MoviesState> emit) async {
    await moviesRepository.fetchMoviesList().then((value) {
      emit(state.copyWith(apiResponse: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(apiResponse: ApiResponse.error(error.toString())));
    });
  }
}

part of 'movies_bloc.dart';


class MoviesState extends Equatable {
  const MoviesState({
    required this.apiResponse,
  });

  final ApiResponse<MoviesModel> apiResponse;

  MoviesState copyWith({ApiResponse<MoviesModel>? apiResponse}) {
    return MoviesState(apiResponse: apiResponse?? this.apiResponse);
  }

  @override
  List<Object?> get props => [apiResponse];
}
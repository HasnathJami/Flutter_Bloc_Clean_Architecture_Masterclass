part of 'movies_bloc.dart';


abstract class MoviesEvent extends Equatable{

  List<Object?> get props => [];
}

class MoviesFetched extends MoviesEvent{}
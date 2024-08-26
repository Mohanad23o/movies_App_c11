import 'package:movies_app_c11/model/movies_response.dart';

abstract class MoviesDetailsState {}

class MoviesErrorState extends MoviesDetailsState {
  String errorMessage;

  MoviesErrorState({required this.errorMessage});
}

class MoviesSuccessState extends MoviesDetailsState {
  List<Results> moviesResult;

  MoviesSuccessState({required this.moviesResult});
}

class MoviesLoadingState extends MoviesDetailsState {}

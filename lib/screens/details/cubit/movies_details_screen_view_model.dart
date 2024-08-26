import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/screens/details/cubit/movies_details_state.dart';

class MoviesDetailsScreenViewModel extends Cubit<MoviesDetailsState> {
  MoviesDetailsScreenViewModel() : super(MoviesLoadingState());

  /*
https://api.themoviedb.org/3/movie/{movie_id}/similar
   */
  void getSimilarMoviesByMovieId(int movieId) async {
    emit(MoviesLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, '/3/movie/$movieId/similar',
        {'api_key': ApiConstants.apiKey});

    try {
      var response = await http.get(url);
      var responseJson = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(responseJson);

      if (moviesResponse.success != false) {
        emit(MoviesSuccessState(moviesResult: moviesResponse.results!));
      } else if (moviesResponse.status_message != null) {
        emit(MoviesErrorState(errorMessage: (moviesResponse.status_message!)));
      }
    } catch (e) {
      emit(MoviesErrorState(errorMessage: e.toString()));
    }
  }
}

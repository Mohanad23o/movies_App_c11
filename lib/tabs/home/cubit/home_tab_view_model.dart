import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/model/MoviesResponse.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';

class HomeTabViewModel extends Cubit<SourcesState> {
  HomeTabViewModel() : super(SourceLoadingState());

  Future<void> getPopularMovies() async {
    emit(SourceLoadingState());
    Uri url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': '5e6aa2b7316d4e5556078b7eb2d4e210',
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(jsonResponse);

      if (moviesResponse.success != false) {
        emit(SourceSuccessState(popularMoviesList: moviesResponse.results!));
      } else if (moviesResponse.status_message != null) {
        emit(SourceErrorState(errorMessage: moviesResponse.status_message!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
    }
}

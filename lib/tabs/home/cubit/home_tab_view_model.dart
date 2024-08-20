import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';

class HomeTabViewModel extends Cubit<SourcesState> {
  HomeTabViewModel() : super(SourceLoadingState());

  Future<void> getPopularMovies() async {
    emit(SourceLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
      'api_key': ApiConstants.apiKey,
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

  Future<void> getNewsReleasesMovies() async {
    emit(SourceLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
      'api_key': ApiConstants.apiKey,
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

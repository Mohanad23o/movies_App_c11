import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/model/popular_movies_response.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';

class HomeTabViewModel extends Cubit<SourcesState> {
  HomeTabViewModel() : super(SourceLoadingState());

  List<Results>? popularMovies;
  List<Results>? newReleasesMovies;

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
        emit(SourceSuccessState());
        popularMovies = moviesResponse.results!;
      } else if (moviesResponse.status_message != null) {
        emit(SourceErrorState(errorMessage: moviesResponse.status_message!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getNewReleasesMovies() async {
    emit(SourceLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesApi, {
      'api_key': ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      PopularMoviesResponse popularMoviesResponse =
          PopularMoviesResponse.fromJson(jsonResponse);

      if (popularMoviesResponse.success != false) {
        emit(SourceSuccessState());
        newReleasesMovies = popularMoviesResponse.results!;
      } else if (popularMoviesResponse.status_code == 7) {
        emit(SourceErrorState(
            errorMessage: popularMoviesResponse.status_message!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}

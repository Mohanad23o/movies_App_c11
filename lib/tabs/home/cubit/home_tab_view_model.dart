import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/TopRatedResponse.dart';
import 'package:movies_app_c11/model/UpcomingResponse.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';

class HomeTabViewModel extends Cubit<SourcesState> {
  HomeTabViewModel() : super(SourceLoadingState());

  List<Results>? popularMovies;
  List<Movies>? newReleasesMovies;
  List<TopMovies>? topRatedMovies;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
      'api_key': ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(jsonResponse);

      if (moviesResponse.success != false) {
        popularMovies = moviesResponse.results!;
        emit(PopularMoviesSuccessState());
      } else if (moviesResponse.status_message != null) {
        emit(SourceErrorState(errorMessage: moviesResponse.status_message!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getNewReleasesMovies() async {
    emit(NewReleasesMoviesLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesApi, {
      'api_key': ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      UpcomingResponse upcomingResponse =
          UpcomingResponse.fromJson(jsonResponse);

      if (upcomingResponse.success == false) {
        emit(SourceErrorState(errorMessage: upcomingResponse.status_message!));
      } else {
        newReleasesMovies = upcomingResponse.results;
        emit(NewReleasesMoviesSuccessState());
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedApi, {
      'api_key': ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      TopRatedResponse topRatedResponse =
          TopRatedResponse.fromJson(jsonResponse);

      if (topRatedResponse.success != false) {
        topRatedMovies = topRatedResponse.results!;
        emit(TopRatedMoviesSuccessState());
      } else if (topRatedResponse.status_message != null) {
        emit(SourceErrorState(errorMessage: topRatedResponse.status_message!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}

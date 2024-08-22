import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/SearchMoviesResponse.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_state.dart';

class SearchTabViewModel extends Cubit<SourceSearchState> {
  SearchTabViewModel() : super(SourceUnSearchSuccessState());

  List<SearchResults>? searchResults;
  TextEditingController searchController = TextEditingController();

  String get searchQuery => searchController.text;

  void onSearchTextChanged(String value) {
    if (value.isNotEmpty) {
      getSearchedMovies(value);
    } else {
      emit(SourceUnSearchSuccessState());
    }
  }

  Future<void> getSearchedMovies(String searchQuery) async {
    emit(SourceSearchLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchApi, {
      'api_key': ApiConstants.apiKey,
      'query': searchQuery,
    });

    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      SearchMoviesResponse searchMoviesResponse =
          SearchMoviesResponse.fromJson(jsonResponse);

      if (searchMoviesResponse.success != false) {
        searchResults = searchMoviesResponse.results!;
        emit(SourceSearchSuccessState());
      } else if (searchMoviesResponse.status_message != null) {
        emit(SourceSearchErrorState(
            errorMessage: searchMoviesResponse.status_message!));
      }
    } catch (e) {
      emit(SourceSearchErrorState(errorMessage: e.toString()));
    }
  }
}

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/movies_response.dart';
import 'Watch_list_icon_state.dart';

class WatchListIconViewModel extends Cubit<WatchListIconState> {
  WatchListIconViewModel() : super(LoadingState());
  List<Results> savedMovies = [];

  bool isMovieInWatchList(Results movie) {
    return savedMovies.any((savedMovie) => savedMovie.id == movie.id);
  }

  Future<void> listFill(Results movie) async {
    if (isMovieInWatchList(movie)) {
      return;
    }
    savedMovies.add(movie);
    if (savedMovies.isEmpty) {
      emit(EmptyState());
    } else {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> jsonList =
          savedMovies.map((movie) => movie.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      await prefs.setString('watchLaterList', jsonString);
      emit(SuccessState());
    }
  }

  Future<void> removeFromWatchLaterList(Results movie) async {
    final prefs = await SharedPreferences.getInstance();
    savedMovies.removeWhere((savedMovie) => savedMovie.id == movie.id);

    if (savedMovies.length == 0) {
      await prefs.remove('watchLaterList');
      emit(EmptyState());
    } else {
      final List<Map<String, dynamic>> jsonList =
          savedMovies.map((movie) => movie.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      await prefs.setString('watchLaterList', jsonString);
      emit(SuccessState());
    }
  }

  Future<void> loadWatchLaterList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('watchLaterList');

    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      savedMovies = jsonList.map((json) => Results.fromJson(json)).toList();

      if (savedMovies.isEmpty) {
        emit(EmptyState());
      } else {
        emit(SuccessState());
      }
    } else {
      emit(EmptyState());
    }
  }
}

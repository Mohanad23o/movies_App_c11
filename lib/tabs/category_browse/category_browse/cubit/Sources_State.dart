import 'package:movies_app_c11/model/Categories_Response.dart';

abstract class CategorySourcesState {}

class SourceLoadingState extends CategorySourcesState {}

class GenriesLoadingState extends CategorySourcesState {}

class GenreSuccessfulState extends CategorySourcesState {
  final List<Genres> categories;

  GenreSuccessfulState(this.categories);

  void fun() {
    print(
        "GenreSuccessfulState has been reached%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5");
  }
}

class GenriesErrorState extends CategorySourcesState {
  String errorMessage;

  GenriesErrorState({required this.errorMessage});
}

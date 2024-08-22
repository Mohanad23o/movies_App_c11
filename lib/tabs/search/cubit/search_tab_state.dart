abstract class SourceSearchState {}

class SourceSearchLoadingState extends SourceSearchState {}

class SourceSearchSuccessState extends SourceSearchState {}

class SourceUnSearchSuccessState extends SourceSearchState {}

class SourceSearchErrorState extends SourceSearchState {
  String errorMessage;

  SourceSearchErrorState({required this.errorMessage});
}

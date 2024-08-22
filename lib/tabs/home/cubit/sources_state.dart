abstract class SourcesState {}

class PopularMoviesLoadingState extends SourcesState {}

class SourceLoadingState extends SourcesState {}

class PopularMoviesSuccessState extends SourcesState {}

class NewReleasesMoviesLoadingState extends SourcesState {}

class NewReleasesMoviesSuccessState extends SourcesState {}

class TopRatedMoviesLoadingState extends SourcesState {}

class TopRatedMoviesSuccessState extends SourcesState {}

class SourceErrorState extends SourcesState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

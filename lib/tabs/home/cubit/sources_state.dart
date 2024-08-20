abstract class SourcesState {}

class SourceLoadingState extends SourcesState {}

class SourceErrorState extends SourcesState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourcesState {}

import 'package:movies_app_c11/model/movies_response.dart';

abstract class SourcesState {}
class SourceLoadingState extends SourcesState{}
class SourceErrorState extends SourcesState{
  String errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourcesState{
  List<Results>popularMoviesList ;
  SourceSuccessState({required this.popularMoviesList});
}


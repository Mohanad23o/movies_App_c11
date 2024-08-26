import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/api/api_manager.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';

import 'Sources_State.dart';

class CategoryBrowseTabViewModel extends Cubit<CategorySourcesState> {
  late ApiManager apiManager;

  CategoryBrowseTabViewModel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
  }

  List<Genres>? category;

  Future<void> getGenries() async {
    emit(GenriesLoadingState());
    var response = await apiManager.getGenries();

    try {
      if (response?.success != false) {
        category = response!.genres;
        emit(GenreSuccessfulState(category!));
      } else if (response?.status_message != null) {
        emit(GenriesErrorState(errorMessage: "An error occurred"));
      }
    } catch (e) {
      emit(GenriesErrorState(errorMessage: "An error occurred: $e"));
    }
  }
}

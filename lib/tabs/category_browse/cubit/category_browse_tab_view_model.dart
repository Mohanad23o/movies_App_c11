import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/api/api_manager.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/repository/genries/dataSources/genries_remote_data_source_impl.dart';
import 'package:movies_app_c11/repository/genries/repository/genries_repository_impl.dart';
import 'package:movies_app_c11/repository/genries_data_source.dart';
import 'package:movies_app_c11/repository/genries_repository_contract.dart';

import 'Sources_State.dart';

class CategoryBrowseTabViewModel extends Cubit<CategorySourcesState> {
  late GenriesRepositoryContract repositoryContract;
  late GenriesRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  CategoryBrowseTabViewModel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
    remoteDataSource = GenriesRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract =
        GenriesRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  List<Genres>? category;

  Future<void> getGenries() async {
    emit(GenriesLoadingState());
    var response = await repositoryContract.getGenries();

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

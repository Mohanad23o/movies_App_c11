import 'package:movies_app_c11/api/api_manager.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/repository/genries_data_source.dart';

class GenriesRemoteDataSourceImpl implements GenriesRemoteDataSource {
  ApiManager apiManager;

  GenriesRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<CategoriesResponse?> getGenries() async {
    var response = await apiManager.getGenries();
    return response;
  }
}

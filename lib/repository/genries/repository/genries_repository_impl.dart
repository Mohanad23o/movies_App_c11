import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/repository/genries_data_source.dart';
import 'package:movies_app_c11/repository/genries_repository_contract.dart';

class GenriesRepositoryImpl implements GenriesRepositoryContract {
  GenriesRemoteDataSource remoteDataSource;

  GenriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CategoriesResponse?> getGenries() {
    var response = remoteDataSource.getGenries();
    return response;
  }
}

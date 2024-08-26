import 'package:movies_app_c11/model/Categories_Response.dart';

abstract class GenriesRepositoryContract {
  Future<CategoriesResponse?> getGenries();
}

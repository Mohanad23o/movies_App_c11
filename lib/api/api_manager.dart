import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';

class ApiManager {
  Future<CategoriesResponse?> getGenries() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoriesApi,
        {'api_key': ApiConstants.apiKey});
    var response = await http.get(url);
    try {
      var json = jsonDecode(response.body);
      return CategoriesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

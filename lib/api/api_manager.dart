import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/MoviesResponse.dart';

class ApiManager {
  static Future<MoviesResponse?> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
      'api_key':'5e6aa2b7316d4e5556078b7eb2d4e210'
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MoviesResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}

/*
https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
 */
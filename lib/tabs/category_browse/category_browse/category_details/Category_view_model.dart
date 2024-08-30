import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/api/api_constants.dart';
import 'package:movies_app_c11/model/movies_response.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Results> categorizedMovies = [];
  final int itemsToFetch = 1000; // the number of movies in the list
  final int itemsPerPage = 20;
  final int pagesToFetch = (1000 / 20).ceil(); // Number of pages needed

  Future<void> getMovieByCategory() async {
    List<Future<http.Response>> requests = [];
    for (int page = 1; page <= pagesToFetch; page++) {
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.discoverApi,
        {
          'api_key': ApiConstants.apiKey,
          'page': '$page',
        },
      );
      // Add concurrent requests
      requests.add(http.get(url));
    }
    try {
      // Fetch data concurrently
      List<http.Response> responses = await Future.wait(requests);

      for (var response in responses) {
        if (response.statusCode == 200) {
          MoviesResponse discoverCategoryResponse =
              MoviesResponse.fromJson(jsonDecode(response.body));
          List<Results> results = discoverCategoryResponse.results ?? [];

          categorizedMovies.addAll(results);
          if (categorizedMovies.length >= itemsToFetch)
            break; // Stop if enough items are fetched
        } else {
          print("Failed to load movies: ${response.statusCode}");
        }
      }

      // Trim the list if it exceeds the desired number of items
      if (categorizedMovies.length > itemsToFetch) {
        categorizedMovies = categorizedMovies.sublist(0, itemsToFetch);
      }

      print("Fetched ${categorizedMovies.length} items");
    } catch (e) {
      print("Error fetching movies: $e");
    }

    notifyListeners();
  }
}

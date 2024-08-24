import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_c11/model/discover_Category_Response.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/Categorized_Movie_Item.dart';
import '../../../api/api_constants.dart';

class CategoryViewModel extends ChangeNotifier{
    List<Results>? CategorizedMovies;

    Future<void> getMovieByCategory()async{


        Uri url = Uri.https(
            ApiConstants.baseUrl, ApiConstants.discoverApi,
            {'api_key': ApiConstants.apiKey});
        try{
            var response = await http.get(url);
            DiscoverCategoryResponse discoverCategoryResponse = DiscoverCategoryResponse.
            fromJson(jsonDecode(response.body));

            if (response.statusCode ==200) {
                CategorizedMovies = discoverCategoryResponse.results;
                notifyListeners();

            } else if (response.statusCode !=200) {

            }
            print(response.statusCode);

        }
            catch(e){}
    }
}
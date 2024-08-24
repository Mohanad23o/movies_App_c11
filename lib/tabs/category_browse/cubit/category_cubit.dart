import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:http/http.dart' as http;
import '../../../api/api_constants.dart';
import 'Sources_State.dart';

class CategoryCubit extends Cubit<CategorySourcesState> {
      CategoryCubit() : super(SourceLoadingState());

      List<Genres>? categore;

      Future<void> getGenries() async {
           emit(GenriesLoadingState());
            Uri url = Uri.https(
                ApiConstants.baseUrl, ApiConstants.categoriesApi,
                {'api_key': ApiConstants.apiKey});
            try {
                  var response = await http.get(url);
                  CategoriesResponse categoriesResponse = CategoriesResponse
                      .fromJson(
                      jsonDecode(response.body));
                  if (response.statusCode ==200) {
                        categore = categoriesResponse.genres;
                        emit(GenreSuccessfulState(categore!)
                        );
                  } else if (response.statusCode !=200) {
                       emit(GenriesErrorState(errorMessage: "An error occurred"));
                  }
            }
            catch (e) {
                 emit(GenriesErrorState(errorMessage: "An error occurred: $e"));
            }

            }

      }

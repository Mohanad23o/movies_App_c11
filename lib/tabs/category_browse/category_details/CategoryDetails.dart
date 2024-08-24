import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/model/discover_Category_Response.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/Categorized_Movie_Item.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/Category_view_model.dart';
import 'package:movies_app_c11/tabs/category_browse/category_widget/category_widget.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = "Category Details";
  final CategoryViewModel viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    var moviesList = viewModel.getMovieByCategory();
    final Genres genre = ModalRoute.of(context)!.settings.arguments as Genres;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30,bottom: 20),
            child: Text(
              "${genre.name} Movies",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: moviesList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error loading movies: ${snapshot.error}"),
                  );
                }else {


                  List<Results>? filteredMovies = viewModel.CategorizedMovies!.where((movie) =>
                      movie.genreIds!.contains(genre.id)).toList();
                  


                  if(filteredMovies.isEmpty){
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("This Category is Empty",style: Theme.of(context).textTheme.bodyLarge ,),
                          ElevatedButton(onPressed: ()=>Navigator.pop(context),
                            style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(AppColors.moviesListContainerColor) ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Browse Another Category",
                                style: Theme.of(context).textTheme.displayLarge,),
                            ),)
                        ],
                      );

                  }
                  return ListView.separated(
                    itemCount: filteredMovies!.length,
                    separatorBuilder: (context, index) => SizedBox(height: height * .02),
                    itemBuilder: (context, index) {
                      return CategorizedMovieItem(
                        selectedGenrie: genre,
                          categorizedMovie: filteredMovies![index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),

    );

  }

}

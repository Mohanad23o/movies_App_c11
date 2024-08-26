import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/screens/details/movies_details_screen.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/category_details/Categorized_Movie_Item.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/category_details/Category_view_model.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = "Category Details";
  final CategoryViewModel viewModel = CategoryViewModel();

  CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var moviesList = viewModel.getMovieByCategory();
    final Genres genre = ModalRoute.of(context)!.settings.arguments as Genres;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "${genre.name} Movies",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.start,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(
          //   "${genre.name} Movies",
          //   style: Theme.of(context).textTheme.titleLarge,
          //   textAlign: TextAlign.start,
          // ),
          Expanded(
            child: FutureBuilder(
              future: moviesList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error loading movies: ${snapshot.error}"),
                  );
                } else {
                  List<Results>? filteredMovies = viewModel.CategorizedMovies!
                      .where((movie) => movie.genreIds!.contains(genre.id))
                      .toList();

                  if (filteredMovies.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "This Category is Empty",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.moviesListContainerColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "Browse Another Category",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return ListView.separated(
                    itemCount: filteredMovies.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * .02),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MoviesDetailsScreen.routeName,
                              arguments: filteredMovies[index]);
                        },
                        child: CategorizedMovieItem(
                            selectedGenrie: genre,
                            categorizedMovie: filteredMovies[index]),
                      );
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

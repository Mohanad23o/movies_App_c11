import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/Category_view_model.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

import '../../../model/discover_Category_Response.dart';

class CategorizedMovieItem extends StatelessWidget {

Results categorizedMovie;
Genres selectedGenrie;

CategorizedMovieItem({required this.categorizedMovie, required this.selectedGenrie});

final CategoryViewModel viewModel = CategoryViewModel();


  @override
  Widget build(BuildContext context) {
    List<Results>? moviesList = viewModel.CategorizedMovies;

    print("%%%%%%%%%% object (categorizedMovie) recieved %%%%%%%%%%%");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Results> getMoviesForCategory(Genres genres, List<Results> unfilteredList) {
      return unfilteredList.where((movie) {
        return movie.id != null && movie.id == genres.id;
      }).toList();
    }

/*
    getMoviesForCategory(selectedGenrie, moviesList!);
*/
    return
      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,),
              height: height*.26,
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500/${categorizedMovie.backdropPath}?id=${categorizedMovie.id}',
                width: double.infinity,
                height: height / 3,
                errorWidget: (context, url, error) => Center(
                  child: Lottie.asset(
                    'assets/lottie/error.json',
                    repeat: true,
                    reverse: true,
                    frameRate: const FrameRate(60),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: Lottie.asset(
                    'assets/lottie/loading.json',
                    repeat: true,
                    reverse: true,
                    frameRate: const FrameRate(60),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categorizedMovie.originalTitle!,
                style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: AppColors.moviesItemContainerColor,
            )
          ],
        ),
    );
  }
}

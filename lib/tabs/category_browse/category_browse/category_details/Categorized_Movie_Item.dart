import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/category_details/Category_view_model.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/watch_list_icon_widget.dart';

class CategorizedMovieItem extends StatelessWidget {
  Results categorizedMovie;
  Genres selectedGenrie;

  CategorizedMovieItem(
      {super.key,
      required this.categorizedMovie,
      required this.selectedGenrie});

  final CategoryViewModel viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 12,
            ),
            height: height * .203,
            child: Stack(children: [
              CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500/${categorizedMovie.backdropPath}?id=${categorizedMovie.id}',
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
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categorizedMovie.originalTitle!,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      WatchListIconWidget(
                          right: 0, bottom: 0, movie: categorizedMovie)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categorizedMovie.releaseDate!,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 28),
                          Text(categorizedMovie.voteAverage!.toStringAsFixed(1))
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

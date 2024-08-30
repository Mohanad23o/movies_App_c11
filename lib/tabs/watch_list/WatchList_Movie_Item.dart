import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/remove_icon.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class WatchListMovieItem extends StatefulWidget {
  Results movie;
  final double right;
  final double bottom;

  WatchListMovieItem(
      {required this.movie, required this.right, required this.bottom});

  @override
  State<WatchListMovieItem> createState() => _WatchListMovieItemState();
}

class _WatchListMovieItemState extends State<WatchListMovieItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(left: 28, bottom: 10, right: 20, top: 8),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}',
                height: height * 0.11,
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
            WatchListIconRemove(
              movie: widget.movie,
              right: widget.right,
              bottom: widget.bottom,
            )
          ]),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.movie.title!,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.whiteColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(widget.movie.releaseDate!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.whiteColor)),
            ],
          ),
        )
      ],
    );
  }
}

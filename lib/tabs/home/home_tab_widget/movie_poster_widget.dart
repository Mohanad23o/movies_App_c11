import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/watch_list_icon_widget.dart';
import 'package:movies_app_c11/utils/app_utils.dart';

import '../../watchlist_Icon/cubit/WatchList_Icon_view_model.dart';

class MoviePosterWidget extends StatefulWidget {
  final double height;
  final double right;
  final double width;
  final double bottom;
  final Results movie;

  const MoviePosterWidget({
    super.key,
    required this.height,
    required this.right,
    required this.bottom,
    required this.width,
    required this.movie,
  });

  @override
  State<MoviePosterWidget> createState() => _MoviePosterWidgetState();
}

class _MoviePosterWidgetState extends State<MoviePosterWidget> {
  final WatchListIconViewModel WatchListViewModel = WatchListIconViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: '${AppUtils.missingImageUrl}${widget.movie.posterPath}',
            width: widget.width * 0.25,
            height: widget.height * 0.4,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Center(
              child: Lottie.asset(AppUtils.lottieUrl),
            ),
          ),
        ),
        WatchListIconWidget(
            right: widget.right, bottom: widget.bottom, movie: widget.movie)
      ],
    );
  }
}

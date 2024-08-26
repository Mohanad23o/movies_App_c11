import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/utils/app_utils.dart';
import 'package:movies_app_c11/tabs/watch_list_icon_widget.dart';

class MoviePosterWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: '${AppUtils.missingImageUrl}${movie.posterPath}',
            width: width * 0.25,
            height: height * 0.4,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Center(
              child: Lottie.asset('${AppUtils.lottieUrl}'),
            ),
          ),
        ),
        WatchListIconWidget(right: right, bottom: bottom, movie: movie)
      ],
    );
  }
}

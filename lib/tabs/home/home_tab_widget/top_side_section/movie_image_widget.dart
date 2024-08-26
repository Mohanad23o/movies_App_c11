import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/movie_poster_widget.dart';
import 'package:movies_app_c11/utils/app_utils.dart';

class MovieImageWidget extends StatelessWidget {
  final Results movie;
  final double width;
  final double height;

  const MovieImageWidget({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: '${AppUtils.missingImageUrl}${movie.backdropPath}',
            width: double.infinity,
            height: height / 3,
            errorWidget: (context, url, error) => Center(
              child: Lottie.asset(
                AppUtils.lottieUrl,
                repeat: true,
                reverse: true,
                frameRate: const FrameRate(60),
              ),
            ),
            placeholder: (context, url) => Center(
              child: Lottie.asset(
                AppUtils.lottieUrl,
                repeat: true,
                reverse: true,
                frameRate: const FrameRate(60),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: MoviePosterWidget(
            height: height * 0.4,
            right: width*0.13,
            bottom: height*0.11,
            width: width * 0.9,
            movie: movie,
          ),
        ),
        Positioned(
          bottom: 25,
          left: 170,
          child: Text(
            movie.originalTitle ?? '',
            maxLines: 2,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 170,
          child: Text(
            movie.releaseDate ?? '',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}

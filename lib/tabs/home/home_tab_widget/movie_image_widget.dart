import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';

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
            imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
            width: double.infinity,
            height: height / 3,
            errorWidget: (context, url, error) => Center(
              child: Lottie.asset(
                'assets/lottie/error.json',
                repeat: true,
                reverse: true,
                frameRate: FrameRate(60),
              ),
            ),
            placeholder: (context, url) => Center(
              child: Lottie.asset(
                'assets/lottie/loading.json',
                repeat: true,
                reverse: true,
                frameRate: FrameRate(60),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: width * 0.3,
                height: height * 0.2,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => Center(
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
              )),
        ),
        Positioned(
          top: height * 0.1,
          left: width * 0.5 - 25,
          child:
              const Icon(Icons.play_circle_fill, size: 80, color: Colors.white),
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
        Positioned(
          bottom: 120,
          left: 13,
          child: IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Color.fromRGBO(128, 128, 128, 0.8),
              size: 40,
            ),
            onPressed: () {
              print("Add to watch list");
            },
          ),
        ),
      ],
    );
  }
}

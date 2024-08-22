import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/TopRatedResponse.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class RecommendedMoveItemWidget extends StatelessWidget {
  final double height;
  final double width;
  final TopMovies topMovies;

  RecommendedMoveItemWidget({
    required this.height,
    required this.width,
    required this.topMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.28,
      decoration: BoxDecoration(
        color: AppColors.moviesItemContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl:
                    'https://image.tmdb.org/t/p/w500/${topMovies.posterPath}',
                height: height * 0.20,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => Center(
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
              ),
            ),
            Positioned(
                bottom: 120,
                right: 70,
                child: IconButton(
                  onPressed: () {
                    print('Added To Watch List');
                  },
                  icon: Icon(
                    Icons.bookmark,
                    size: 40,
                    color: AppColors.watchListIcon,
                  ),
                ))
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      topMovies.voteAverage!.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  topMovies.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                ),
                Text(
                  (topMovies.releaseDate != null)
                      ? DateTime.parse(topMovies.releaseDate!).year.toString()
                      : '',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

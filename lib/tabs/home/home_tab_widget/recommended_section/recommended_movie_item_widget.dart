import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/movie_poster_widget.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class RecommendedMoveItemWidget extends StatelessWidget {
  final double height;
  final double width;
  final Results topMovies;

  const RecommendedMoveItemWidget({
    super.key,
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
          MoviePosterWidget(
            height: height * 0.5,
            width: double.infinity,
            right: width*0.19,
            bottom: height*0.15,
            movie: topMovies,
          ),
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
                const SizedBox(height: 4),
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
                  style: const TextStyle(
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

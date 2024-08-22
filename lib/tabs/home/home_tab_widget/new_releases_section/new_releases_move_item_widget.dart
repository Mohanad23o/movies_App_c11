import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/UpcomingResponse.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class NewReleasesMoveItemWidget extends StatelessWidget {
  final double height;
  final double width;
  final Movies movie;

  const NewReleasesMoveItemWidget({
    super.key,
    required this.height,
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
            imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            width: width * 0.25,
            height: height * 0.4,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Center(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
          ),
        ),
        Positioned(
          bottom: 102,
          right: 60,
          child: IconButton(
            onPressed: () {
              print('Add To Watch List');
            },
            icon: const Icon(
              Icons.bookmark,
              size: 40,
              color: AppColors.watchListIcon,
            ),
          ),
        ),
      ],
    );
  }
}

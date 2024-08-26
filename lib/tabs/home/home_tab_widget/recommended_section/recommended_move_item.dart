import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/screens/details/movies_details_screen.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/recommended_section/recommended_move_item_widget.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class RecommendedMoveItem extends StatelessWidget {
  final List<Results> movies;
  String title;

  RecommendedMoveItem({
    super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.moviesListContainerColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.whiteColor),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: movies.length,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (movies.isNotEmpty) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            MoviesDetailsScreen.routeName,
                            arguments: movies[index]);
                      },
                      child: RecommendedMoveItemWidget(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        topMovies: movies[index],
                      ),
                    );
                  } else {
                    return const Text('data');
                  }
                }),
          )
        ],
      ),
    );
  }
}
/*
topMovies.isNotEmpty
                      ? RecommendedMoveItemWidget(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          topMovies: topMovies[index],
                        )
                      : const Text('data'),
 */